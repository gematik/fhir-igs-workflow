# Technische Anwendungsfälle - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Anwendungsfälle**

## Technische Anwendungsfälle

### Technische Anwendungsfälle

Die folgenden technischen Anwendungsfälle ergänzen die fachlichen Anwendungsfälle zur Verordnung und Bereitstellung eines E-Rezepts. Sie beschreiben die Interaktion des Primärsystems (PVS/KIS) mit dem E-Rezept-Fachdienst (Workflow-Ressource **Task**), sowie die dabei relevanten Artefakte.

Hinweis: Die konkreten Schnittstellenangaben werden im nächsten Schritt ergänzt; vorerst steht dort jeweils **todo**.

#### Lesezugriffe

Dieser technische Anwendungsfall beschreibt lesende Zugriffe im Kontext der ärztlichen Verordnung. Dazu zählen insbesondere die Abfrage von Task-Informationen (z.B. Status), sowie der Abruf von in der Primärsystem-Logik benötigten Metadaten.

**Schnittstelle:** *todo*

Typische Inhalte/Ergebnisse:

* Abfrage des aktuellen Task-Status zur Einordnung des Workflows (z.B. `draft`, `ready`).
* Abruf/Anzeige von für den Prozess relevanten Identifikatoren (z.B. Rezept-ID / PrescriptionID).

#### E-Rezept erstellen

Technische Einordnung des fachlichen Use Cases „E-Rezept erstellen“:

* Ein Task wird im E-Rezept-Fachdienst angelegt, um eine Rezept-ID (PrescriptionID) zu erhalten.
* Der E-Rezept-Fachdienst erzeugt zusätzlich einen AccessCode, der für nachfolgende, berechtigte Operationen benötigt wird.

**Schnittstelle:** *todo* **Schnittstelle:** *[todo](./todo.md)* **Schnittstelle:** *[Operation API: E-Rezept erstellen](./op-create.md)*

#### E-Rezept qualifiziert signieren

Technische Einordnung des fachlichen Use Cases „E-Rezept qualifiziert signieren“:

* Der Verordnungsdatensatz wird im Primärsystem mittels HBA qualifiziert elektronisch signiert (QES).
* Die QES wird typischerweise über den Konnektor erstellt; die signierten Nutzdaten werden anschließend für die Bereitstellung verwendet.

**Schnittstelle:** *todo*

#### E-Rezept vervollständigen und Task aktivieren

Technische Einordnung des fachlichen Use Cases „E-Rezept vervollständigen und Task aktivieren“:

* Der QES-signierte Verordnungsdatensatz wird am referenzierten Task hinterlegt.
* Der E-Rezept-Fachdienst validiert Signatur und Schemakonformität und setzt bei Erfolg den Task-Status auf `ready`.

**Schnittstelle:** *[Operation API: E-Rezept aktivieren](./op-activate.md)*

Technischer Ablauf (vereinfachte Sicht):

* Das Primärsystem ruft die Operation zur Aktivierung des referenzierten Tasks auf und übergibt dabei die QES-signierten Verordnungsdaten gemäß Operationsdefinition.
* Der E-Rezept-Fachdienst prüft u.a. die Berechtigung (z.B. AccessCode am Task), die Integrität der Signatur sowie die Schemakonformität der fachlichen Nutzdaten.
* Bei erfolgreicher Prüfung hinterlegt der E-Rezept-Fachdienst die Nutzdaten serverseitig und verknüpft sie mit dem Workflow (Task) so, dass die nachfolgende Einlösung/Belieferung möglich ist.

Relevante Datenmodelle und Relationen (konzeptionell):

* **Task** (Workflow-Ressource) 
* Status-Transition: `draft` → `ready`.
* Referenzierung der bereitgestellten Verordnungsdaten (z.B. über `Task.input` auf eine serverseitig gespeicherte Ressource).
 
* **Binary** (Transport-/Persistenz-Container) 
* Persistierung der vom Primärsystem übermittelten, signierten Nutzdaten (QES/PKCS#7/CAdES) als serverseitiges Artefakt.
* Verknüpfung vom Task auf diese Persistenz (indirekt über Referenzen in `Task.input`/`Task.output`).
 
* Verordnungsdaten (fachliche Payload, typischerweise als Bundle gemäß KBV/ERP-Profilen) 
* Inhaltliche Konsistenzprüfungen (z.B. Identifikatoren, Prüfziffern, flowtype-spezifische Constraints) erfolgen im Rahmen der Aktivierung.
 

Ergebnis:

* Bei Erfolg liefert der E-Rezept-Fachdienst den aktualisierten Task zurück (inkl. `ready`), sodass der Einlöse-Workflow starten kann.
* Bei Fehlern erfolgt eine ablehnende Antwort gemäß Operationsdefinition (z.B. fehlende/ungültige Berechtigung, ungültige Signatur, nicht schemakonforme oder fachlich inkonsistente Daten).

##### Mehrfachverordnung (MVO) – technische Ergänzungen

Für Mehrfachverordnungen gelten zusätzliche Prüfungen und Datenanforderungen:

* **Kennzeichnung im Verordnungsdatensatz:** 
* `MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true`
* Nummerierung der Teilverordnung in `valueRatio.numerator` (1..4)
* Gesamtzahl der Teilverordnungen in `valueRatio.denominator` (2..4)
* Gültigkeitszeitraum in `valuePeriod.start` (Pflicht) und optional `valuePeriod.end`
 
* **Flowtype-Zulässigkeit:** Nur 160, 169, 200 oder 209.
* **Ausschlüsse:** Keine Mehrfachverordnung bei Entlassrezepten (Rechtsgrundlage 04/14) oder Ersatzverordnungen (Rechtsgrundlage 10/11/17).
* **Konsistenzregeln:** 
* Numerator ≤ Denominator
* Numerator ≥ 1
* Denominator ≥ 2
 
* **Gültigkeit:** Wenn `valuePeriod.end` fehlt, wird die Teilverordnung bis **Ausstellungsdatum + 365 Tage** gültig geführt.

Diese Regeln werden beim `$activate` geprüft; fehlerhafte MVO-Daten führen zu HTTP 400.

##### MVO-Teilverordnungen abrufen ($accept)

Beim Abruf einer Teilverordnung durch Apotheke/AVS MUSS der E-Rezept-Fachdienst den Beginn der Einlösefrist prüfen. Liegt `valuePeriod.start` in der Zukunft, wird der Aufruf mit HTTP 403 abgewiesen und das Datum im `OperationOutcome` ausgegeben (“Teilverordnung ab  einlösbar").

**Abbildung: **Anwendungsfall E-Rezept einstellen


Im E-Rezept-Fachdienst Datenraum werden die folgenden Verknüpfungen und Datenmodelle verwendet, um den Anwendungsfall technisch umzusetzen:

**Abbildung: **todo


#### E-Rezept löschen

Technische Einordnung des fachlichen Use Cases „E-Rezept löschen“:

* Das E-Rezept wird (solange es nicht in Belieferung ist) über den E-Rezept-Fachdienst widerrufen/gelöscht.
* Technisch bedeutet dies, dass der referenzierte Task gelöscht wird; Nutzdaten werden dabei nicht mehr bereitgestellt.

**Schnittstelle:** *[Operation API: E-Rezept löschen](./op-abort.md)*

#### Übertragen an den ePA MedicationService

Technische Einordnung des fachlichen Use Cases „E-Rezept löschen“:

* Das E-Rezept wird (solange es nicht in Belieferung ist) über den E-Rezept-Fachdienst widerrufen/gelöscht.
* Technisch bedeutet dies, dass der referenzierte Task gelöscht wird; Nutzdaten werden dabei nicht mehr bereitgestellt.

**Schnittstelle:** *[Operation API: E-Rezept löschen](./op-abort.md)*

