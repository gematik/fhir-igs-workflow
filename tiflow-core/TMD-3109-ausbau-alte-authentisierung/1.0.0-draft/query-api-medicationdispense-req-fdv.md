# FdV-Anforderungen: MedicationDispense-Query - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: MedicationDispense**](query-api-medicationdispense.md)
* **FdV-Anforderungen: MedicationDispense-Query**

## FdV-Anforderungen: MedicationDispense-Query

Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

Das E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" die HTTP-Operation GET /MedicationDispense mit
* ACCESS_TOKEN im Authorization-Header
* optional: Suchparameter gemäß https://www.hl7.org/fhir/medicationdispense.html#search
ausführen.

