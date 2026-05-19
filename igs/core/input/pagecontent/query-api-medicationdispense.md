Diese Seite beschreibt die modulübergreifende MedicationDispense-Query-Schnittstelle.

Dem Versicherten werden über die Ressource MedicationDispense Informationen über ein eingelöstes E-Rezept bereitgestellt. Im MedicationDispense ist dabei die Referenz auf das abgegebene Medikament enthalten. Diese Informationen unterstützen den Versicherten im Versorgungsprozess, indem ihm bspw. mittels dieser Informationen ein digitaler Beipackzettel oder weitere Informationen wie Applikationsanleitungen zur Verfügung gestellt werden können. Der Zugriff auf die Ressource MedicationDispense erfolgt ausschließlich lesend über die http-GET-Operation. Das Löschen erfolgt indirekt über das Löschen des der MedicationDispense zugrunde liegenden Tasks.

### Nachricht

Die Nachricht zur Interaktion mit Dispensierinformationen am TI-Flow-Fachdienst als FHIR-Ressource _MedicationDispense_ wird über den `/MedicationDispense` Endpunkt für das jeweilige Modul unterstützt.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur MedicationDispense-Query](./query-api-medicationdispense-req-fdv.html): Anforderungen an das E-Rezept-FdV des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

### API

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.






