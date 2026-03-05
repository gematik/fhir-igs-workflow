# Query API: MedicationDispense - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: MedicationDispense**

## Query API: MedicationDispense

# Query API: MedicationDispense

Diese Seite beschreibt die moduluebergreifende MedicationDispense-Query-Schnittstelle.

Dem Versicherten werden über die Ressource MedicationDispense Informationen über ein eingelöstes E-Rezept bereitgestellt. Im MedicationDispense ist dabei die Referenz auf das abgegebene Medikament enthalten. Diese Informationen unterstützen den Versicherten im Versorgungsprozess, indem ihm bspw. mittels dieser Informationen ein digitaler Beipackzettel oder weitere Informationen wie Applikationsanleitungen zur Verfügung gestellt werden können. Der Zugriff auf die Ressource MedicationDispense erfolgt ausschließlich lesend über die http-GET-Operation. Das Löschen erfolgt indirekt über das Löschen des der MedicationDispense zugrunde liegenden Tasks.

### Nachricht

### Anforderungen an Schnittstelle

* [Server-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fdv.md): Anforderungen an das E-Rezept-FdV des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

### Hinweis

