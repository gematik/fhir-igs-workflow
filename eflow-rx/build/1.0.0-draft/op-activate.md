# Operation $activate (Task aktivieren) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $activate (Task aktivieren)**

## Operation $activate (Task aktivieren)

Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, nachdem das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt hat. Der E-Rezept-Fachdienst validiert dabei Identitäten, Flowtype-spezifische Inhalte sowie die Signatur und erzeugt anschließend serverseitige Nachweise und Downstream-Daten (z.B. ePA Medication Service, Push-Benachrichtigungen).

## Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet und enthält den PKCS#7-kapselten QES-Datensatz als `Parameters`-Ressource. Der Aufruf MUSS den AccessCode im Header `X-AccessCode` oder als URL-Parameter `ac` übermitteln und darf nur erfolgen, solange der `Task.status = draft` ist ([gemSpec_FD_eRp#A_19114], [A_19128]).

### Auslösung

Das Primärsystem (PVS/KIS) ruft `$activate` unmittelbar nach der QES-Erzeugung auf. Grundlage ist die zuvor erhaltene PrescriptionID. Vor dem Versand MUSS das System sicherstellen, dass alle Pflichtangaben (u.a. KVNR, Coverage, Medication, Flowtype, PerformerType) vollständig sind und der Workflow zum Ziel passt.

### FHIR Operation API

**Serverpflichten gemäß gemSpec_FD_eRp Kap. 6.1.2.2**

#### Allgemeine Anforderungen der Operation

##### Vorbedingungen und Transport

Der E-Rezept-Fachdienst MUSS bei erfolgreichem `$activate` den adressierten Task in den Status
*ready*überführen und die aktualisierte Ressource im Response zurückgeben.

Der E-Rezept-Fachdienst MUSS den übergebenen QES-Datensatz als Enveloping CAdES PKCS#7 entgegennehmen und bei fehlender bzw. ungültiger ASN.1-Struktur die Operation mit HTTP 400 abbrechen.

Der E-Rezept-Fachdienst MUSS vor jeder Aktivierung den bereitgestellten AccessCode aus HTTP-Header
*X-AccessCode*bzw. Parameter
*ac*mit dem im Task gespeicherten Wert vergleichen und den Aufruf bei Abweichung oder fehlender Angabe mit HTTP 403 abbrechen.

Der E-Rezept-Fachdienst MUSS bei fehlenden oder ungültigen AccessCodes den Aufruf mit HTTP 403 abbrechen, den `Warning`-Header zur Brute-Force-Drosselung setzen und die nächste mögliche Aktivierung künstlich verzögern.
##### Signatur- und Payload-Validierung

Der E-Rezept-Fachdienst MUSS das QES-Signaturzertifikat C.HP.QES gemäß gemSpec_PKI (inklusive OCSP-Prüfung) validieren und bei fehlgeschlagener Online-Prüfung den Aufruf mit HTTP 512 beenden.

Der E-Rezept-Fachdienst MUSS die qualifizierte Signatur prüfen, das eingebettete FHIR-Bundle gegen `kbv.ita.erp` bzw. `kbv.itv.evdga` validieren und den PKCS#7-Datensatz sicher speichern; Fehler sind mit HTTP 400 zu quittieren.

Der E-Rezept-Fachdienst MUSS den MimeType des signierten Dokuments auf
*text/plain; charset=utf-8*prüfen und bei Abweichungen mit HTTP 400 abbrechen.
##### Ableitungen und Folgeverarbeitung

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks das Feld
*Task.performerType*anhand der Prozessparameter des Flowtypes befüllen.

Der E-Rezept-Fachdienst MUSS die KVNR aus
*Patient.identifier*(System `http://fhir.de/sid/gkv/kvid-10`) in
*Task.for*übernehmen, damit die Patientenreferenz im Workflow eindeutig ist.

Der E-Rezept-Fachdienst MUSS nach erfolgreichem `$activate` die Verordnungsdaten für den ePA Medication Service vorbereiten.

Der E-Rezept-Fachdienst MUSS bei erfolgreicher Aktivierung den Push-Trigger
*erp.task.activate*für die KVNR aus
*Task.for*starten.

Der E-Rezept-Fachdienst MUSS das QES-Bundle normalisieren, mit ID.FD.OSIG als detached JWS signieren und das Ergebnis als Dokumenttyp 2 in
*Task.input*referenzieren.
#### Identifikations- und Prüfziffern

##### Kostenträger (IKNR)

Der E-Rezept-Fachdienst MUSS beim Aktivieren den Wert
*Coverage.payor.identifier.value*gemäß IK-Prüfziffervalidierung kontrollieren und bei Fehlern HTTP 400 mit der definierten Meldung liefern.

Der E-Rezept-Fachdienst MUSS bei vorhandenem Wert in
*Coverage.payor.identifier.extension:alternativeID*prüfen, dass dieser das IK-Prüfzifferverfahren besteht; andernfalls ist die Operation mit HTTP 400 abzulehnen.
##### Leistungserbringer (LANR/ZANR)

Der E-Rezept-Fachdienst MUSS, wenn die Prüfung der LANR/ZANR eine Auffälligkeit erkennt und die Konfiguration auf „Fehler“ gestellt ist, mit HTTP 400 abbrechen und den angegebenen Fehlertest liefern.
##### Arzneimittel (PZN)

Der E-Rezept-Fachdienst MUSS die PZN in
*KBV_PR_ERP_Medication_PZN*gemäß Prüfziffer berechnen und bei Ungültigkeit HTTP 400 mit der vorgesehenen Meldung zurückgeben.

Der E-Rezept-Fachdienst MUSS auch für
*KBV_PR_ERP_Medication_Compounding*die PZN-Prüfziffer kontrollieren und bei Fehlern die Operation beenden.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass jede übergebene PZN exakt achtstellig ist, andernfalls ist HTTP 400 mit dem Hinweis „Länge PZN unzulässig“ zurückzugeben.
##### Patient (KVNR)

Der E-Rezept-Fachdienst MUSS sicherstellen, dass in der Patient-Ressource der Identifier das System `http://fhir.de/sid/gkv/kvid-10` verwendet; bei Abweichung ist HTTP 400 mit der entsprechenden Fehlermeldung zu liefern.
##### Datums- und Konsistenzprüfungen

Der E-Rezept-Fachdienst MUSS sicherstellen, dass
*MedicationRequest.authoredOn*und das Signaturdatum aus dem QES taggleich sind; bei Abweichungen ist HTTP 400 mit dem vorgesehenen Hinweis zurückzugeben.
#### Flowtype-spezifische Anforderungen

##### Flowtypes 160/169/200/209: Zulässige Berufsgruppen für QES

Der E-Rezept-Fachdienst MUSS für Flowtypes 160, 169, 200 und 209 prüfen, dass die QES von einer zulässigen professionOID (z.B.
*oid_arzt*,
*oid_zahnarzt*) stammt und bei unzulässigen Berufsgruppen mit HTTP 400 abbrechen.
##### Flowtype 166: T-Rezept-spezifische Payload-Prüfung

Der E-Rezept-Fachdienst MUSS bei Flowtype 166 sicherstellen, dass das Bundle eine
*MedicationRequest*plus eine
*Medication*mit Kategorie 02 enthält; andernfalls ist HTTP 400 mit dem entsprechenden Fehlertext zu liefern.
##### Coverage-Type: GKV- und PKV-Workflows

Der E-Rezept-Fachdienst MUSS sicherstellen, dass bei Flowtypes 160, 162 und 169
*Coverage.type.coding.code*nicht den Wert
*PKV*enthält; Verstöße führen zu HTTP 400.

Der E-Rezept-Fachdienst MUSS für Flowtypes 200 und 209 sicherstellen, dass der Coverage-Typ den Wert
*PKV*enthält; andernfalls ist die Operation abzulehnen.
##### Allgemeine Inhaltsausschlüsse

Der E-Rezept-Fachdienst MUSS `$activate` mit dem Fehler „BTM nicht zulässig“ abbrechen, wenn das Bundle
*Medication.extension:KBV_EX_ERP_Medication_Category = 01*enthält.
##### Ableitungen aus Flowtype (EU-Einlösbarkeit)

Der E-Rezept-Fachdienst MUSS
*Task.extension:eu-isRedeemableByProperties*auf „true“ setzen, wenn Flowtype 160 oder 200 mit PZN-Verordnung vorliegt, und ansonsten auf „false“.
#### Anforderungen für Mehrfachverordnungen

##### Flowtype-Zulässigkeit

Der E-Rezept-Fachdienst MUSS bei
*Mehrfachverordnung.kennzeichen = true*sicherstellen, dass der Flowtype 160, 169, 200 oder 209 beträgt; anderenfalls ist HTTP 400 zurückzugeben.
##### Zählwerte (Numerator/Denominator)

Der E-Rezept-Fachdienst MUSS Numerator und Denominator auf Werte ≤ 4 prüfen und bei Überschreitung mit HTTP 400 abbrechen.

Der E-Rezept-Fachdienst MUSS bei Mehrfachverordnungen sicherstellen, dass der Numerator mindestens 1 ist; ansonsten ist die Operation unzulässig.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass der Denominator ≥ 2 ist, da Mehrfachverordnungen aus mindestens zwei Teilen bestehen.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass Numerator ≤ Denominator ist; andernfalls ist HTTP 400 zurückzugeben.
##### Ausschlüsse und Konsistenzregeln

Der E-Rezept-Fachdienst MUSS `$activate` mit HTTP 400 beenden, wenn eine Verordnung MVO-Extensions enthält, obwohl das Kennzeichen = false ist.

Der E-Rezept-Fachdienst MUSS den Aufruf mit HTTP 400 abweisen, wenn eine Verordnung als Mehrfachverordnung und gleichzeitig als Entlassrezept (Rechtsgrundlage 04/14) oder als Ersatzverordnung (Rechtsgrundlage 10/11/17) gekennzeichnet ist.
##### Zeitraum und ID-Schema

Der E-Rezept-Fachdienst MUSS bei Mehrfachverordnungen sicherstellen, dass
*Mehrfachverordnung.Zeitraum.start*gesetzt ist; fehlt der Wert, ist die Aktivierung mit HTTP 400 zu beenden.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass ein angegebenes Enddatum ≥ Startdatum ist; sonst ist die Operation ungültig.

Der E-Rezept-Fachdienst MUSS sicherstellen, dass die ID in
*Mehrfachverordnung.ID.valueIdentifier*dem in der KBV-Technischen Anlage definierten Schema entspricht; Abweichungen führen zu HTTP 400.

```

      {"resourceType":"CapabilityStatement","id":"erp-fachdienst-server","meta":{"profile":["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]},"extension":[{"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-base-url","valueString":"http://todo"},{"extension":[{"url":"statusCode","valueString":"423"},{"url":"description","valueString":"If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."},{"url":"responseType","valueString":"application/json"},{"url":"errorCode","valueString":"locked"}],"url":"https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"}],"url":"https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-server","version":"1.0.0-draft","name":"ERPFachdienstServer","title":"ERP CapabilityStatement für den E-Rezept-Fachdienst","status":"draft","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"ERP CapabilityStatement für den E-Rezept-Fachdienst","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"kind":"requirements","fhirVersion":"4.0.1","format":["application/fhir+json","application/fhir+xml"],"rest":[{"mode":"server"}]}
    
```

```

      {"resourceType":"OperationDefinition","id":"ActivateOperation","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition ActivateOperation</p><a name=\"ActivateOperation\"> </a><a name=\"hcActivateOperation\"> </a>URL: [base]/Task/[id]/$activateInput parameters Profile:<a href=\"http://hl7.org/fhir/R4/parameters.html\">Parameters</a>Output parameters Profile:<a href=\"StructureDefinition-eflow-rx-activate-operation-output-parameters.html\">GEM ERP PR ActivateOperation Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINePrescription1..1<a href=\"http://hl7.org/fhir/R4/binary.html\">Binary</a>Das qualifizierte unterzeichnete Verordnung (QES) zur Aktivierung des E-Rezept-Workflows.\nOUTreturn1..1<a href=\"http://hl7.org/fhir/R4/task.html\">Task</a>Geben Sie die aktualisierte und aktivierte Aufgabe zurück.\n</table></div>"},"url":"https://gematik.de/fhir/erp/OperationDefinition/ActivateOperation","version":"1.0.0-draft","name":"Activate","status":"draft","kind":"operation","date":"2025-12-15","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der E-Rezept-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow.","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":true,"code":"activate","resource":["Task"],"system":false,"type":false,"instance":true,"inputProfile":"http://hl7.org/fhir/StructureDefinition/Parameters","outputProfile":"https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-activate-operation-output-parameters","parameter":[{"name":"ePrescription","use":"in","min":1,"max":"1","documentation":"Das qualifizierte unterzeichnete Verordnung (QES) zur Aktivierung des E-Rezept-Workflows.","type":"Binary"},{"name":"return","use":"out","min":1,"max":"1","documentation":"Geben Sie die aktualisierte und aktivierte Aufgabe zurück.","type":"Task"}]}
    
```

## Geschäftslogik

Die Aktivierung folgt einem streng sequenziellen Prüfpfad:

1. **Authentisierung und Statusprüfung:**AccessCode, optional Secret und Taskstatus`draft`bilden die Eintrittskriterien. Verletzungen führen zu 403.
1. **Identitäts- und Attributvalidierungen:**IKNR, alternative Kostenträger-IDs, KVNR (Patient), LANR/ZANR (Performer) und PZN werden mit den jeweiligen Prüfziffern kontrolliert. Zusätzlich gelten Flowtype-spezifische Constraints (Coverage-Typ, T-Rezept Medication category).
1. **Mehrfachverordnungslogik:**Für Kennzeichnung`Mehrfachverordnung=true`prüft der Fachdienst Numerator/Denominator, Datumsfenster und Rechtsgrundlage. Entlass-/Ersatzrezepte sowie unvollständige Zeiträume werden abgewiesen.
1. **QES- und Schemaprüfung:**Der PKCS#7-Datensatz wird gegen ETSI/QES-Regeln validiert; das eingebettete Bundle muss KBV-konform sein. OCSP-Fehler resultieren in HTTP 512.
1. **Persistenz und Ableitungen:**Bei Erfolg speichert der Fachdienst QES und serversigniertes Bundle, übernimmt KVNR und performerType in den Task, setzt`Task.status = ready`, ermittelt EU-Einlösbarkeit und stellt Daten für den ePA Medication Service bereit ([A_25925]).
1. **Benachrichtigungen:**Es erfolgt eine Push Notification`erp.task.activate`an das E-Rezept-FdV sowie Logging/Audit nach Vorgabe ([A_28126]).

<?xml version=”1.0” encoding=”us-ascii” standalone=”no”?>

## Sicherheitsanforderungen

Zusätzlich zu den allgemeinen Vorgaben gelten:

* Zugriffe ohne gültigen AccessCode werden verworfen; bei Fehlversuchen greift die Brute-Force-Drosselung via HTTP-Header `Warning` und künstlicher Verzögerung ([A_20703]).
* Der QES muss mit einer nicht gesperrten HBA-Identität erstellt worden sein; OCSP-Prüfungen sind verpflichtend und Timeout führt zu HTTP 512 ([A_20159-04]).
* Der Payload darf keine Betäubungsmittel enthalten, solange der Workflow dies nicht explizit vorsieht ([A_22231]).
* Erfolgreiche Aktivierungen lösen Push-Nachrichten aus, wodurch Versicherte über neue offene Verordnungen informiert werden ([A_28126]).

Weitere Sicherheitsgrundlagen sind im Dokument [menu-schnittstellen-datenschutz-und-sicherheit.html](./menu-schnittstellen-datenschutz-und-sicherheit.md) beschrieben.

