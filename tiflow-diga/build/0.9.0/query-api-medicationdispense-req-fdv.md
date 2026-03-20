# FdV-Anforderungen: MedicationDispense-Query - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: MedicationDispense**](query-api-medicationdispense.md)
* **FdV-Anforderungen: MedicationDispense-Query**

## FdV-Anforderungen: MedicationDispense-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" die HTTP-Operation GET /MedicationDispense mit
* ACCESS_TOKEN im Authorization-Header
* optional: Suchparameter gemäß https://www.hl7.org/fhir/medicationdispense.html#search
ausführen.
### Modulspezifische Anforderungen

Der Kostenträger stellt die Abgabeinformationen beim Abschluss des Workflows zur Verordnung ein. Der Task hat dann den Status “completed”.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" dem Nutzer Abgabeinformationen eines Tasks mit Flowtyp 162 den Freischaltcode in geeigneter Weise darstellen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" dem Nutzer zusammen mit den Abgabeinformationen zu einer DiGA-App Supportinformationen zu der DiGA-App anzeigen.
Supportinformationen zu DiGA-Apps sind im BfArM-Verzeichnis verfügbar.

