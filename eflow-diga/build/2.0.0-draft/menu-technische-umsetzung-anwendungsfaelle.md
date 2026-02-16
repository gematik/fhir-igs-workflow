# Technische Anwendungsfaelle - E-Rezept fuer Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

E-Rezept fuer Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemueberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Technische Anwendungsfaelle**

## Technische Anwendungsfaelle

### Technische Anwendungsfälle

Diese Seite beschreibt die technischen Anwendungsfälle für den DiGA-Workflow. Sie ergänzt die Basis-Anwendungsfälle des E-Rezept-Workflows und fokussiert DiGA-spezifische Besonderheiten.

#### Verordnung erstellen

Ein Task wird im Workflow-Fachdienst angelegt, um eine Rezept-ID (PrescriptionID) und einen AccessCode zu erhalten. Die technischen Details entsprechen dem Basis-Workflow.

#### Verordnung qualifiziert signieren

Der Verordnungsdatensatz wird im Primärsystem mittels HBA qualifiziert elektronisch signiert (QES). Die QES-Erzeugung erfolgt über den Konnektor; der signierte Datensatz wird für die Aktivierung vorbereitet.

#### Task aktivieren

Der QES-signierte Verordnungsdatensatz wird am referenzierten Task hinterlegt. Der Workflow-Fachdienst validiert Signatur und Schemakonformitaet und setzt bei Erfolg den Task-Status auf `ready`. DiGA-spezifische Prüfungen sind in [Operation $activate](./op-activate.md) beschrieben.

#### DiGA-Verordnung zuweisen

Der Versicherte weist die Verordnung dem Kostenträger zu. Dazu wird eine Communication (GEM_ERP_PR_Communication_DispReq) erstellt. Bei DiGA kann `Communication.payload` entfallen (Kardinalität 0..1). Das E-Rezept-FdV ermittelt die Telematik-ID des Kostenträgers über das FHIR-VZD oder bietet dem Nutzer eine manuelle Auswahl der Kostenträger an.

#### DiGA-E-Rezept abrufen (Kostenträger)

Der Kostenträger MUSS ein E-Rezept mit Rezept-ID und AccessCode abrufen können. Der E-Rezept-Fachdienst setzt den Status auf "in Abgabe (gesperrt)" und liefert ein Geheimnis zur Statusänderung.

#### Freischaltcode bereitstellen oder Rückmeldung geben

Der Kostenträger MUSS Abgabeinformationen übermitteln und eine Quittung erhalten können. Der E-Rezept-Fachdienst setzt den Status auf "quittiert" und stellt die Abgabeinformation dem Versicherten bereit.
#### Rückgabe bei fehlerhafter Zuweisung

Der Kostenträger MUSS eine abgerufene Verordnung zurückgeben können, sodass der Status wieder "offen" ist und der Zugriff protokolliert wird.
#### Nachrichten zwischen Versicherten und Kostenträger

Der Kostenträger MUSS Nachrichten zum Zuweisen vom E-Rezept-Fachdienst abrufen können. In der Nachricht ist der E-Rezept-Token enthalten, der den Abruf der Verordnung legitimiert.

Der Kostenträger MUSS eine Antwortnachricht an den Versicherten einstellen können. Der Versand erfolgt über den E-Rezept-Fachdienst an den Absender der ursprünglichen Nachricht.

