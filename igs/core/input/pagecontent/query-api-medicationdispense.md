# Query API: MedicationDispense

Diese Seite beschreibt die moduluebergreifende MedicationDispense-Query-Schnittstelle.

Dem Versicherten werden über die Ressource MedicationDispense Informationen über ein eingelöstes E-Rezept bereitgestellt. Im MedicationDispense ist dabei die Referenz auf das abgegebene Medikament enthalten. Diese Informationen unterstützen den Versicherten im Versorgungsprozess, indem ihm bspw. mittels dieser Informationen ein digitaler Beipackzettel oder weitere Informationen wie Applikationsanleitungen zur Verfügung gestellt werden können. Der Zugriff auf die Ressource MedicationDispense erfolgt ausschließlich lesend über die http-GET-Operation. Das Löschen erfolgt indirekt über das Löschen des der MedicationDispense zugrunde liegenden Tasks.

### Nachricht

Die Nachricht zur Interaktion mit Einlöseinformationen als FHIR-Ressource _MedicationDispense_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Einlöseinformation abrufen|

### Anforderungen an Schnittstelle

- [Server-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fdv.html): Anforderungen an das E-Rezept-FdV des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>MedicationDispense</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

#### API Beschreibung

- [API-ERP: Abgabeinformationen abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#abgabeinformationen-abrufen)
- [API-ERP: Abgabeinformationen zu einem E-Rezept abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#abgabeinformationen-zu-einem-e-rezept-abrufen)

<!-- ### Instance API -->

<!-- TODO: für neuausschreibung einzelne API mit richtiger /<id>? -->






