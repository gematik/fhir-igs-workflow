Mit der FHIR-Operation kann die Zugriffsberechtigung für die im ACCESS_TOKEN angegebene KVNR abgerufen werden. Diese Operation steht Versicherten zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `GET` an `/$read-eu-access-permission` gesendet.

### Anforderungen an Schnittstelle

- [Server Anforderungen zu `$read-eu-access-permission`](./op-read-eu-access-permission-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu `$read-eu-access-permission`](./op-read-eu-access-permission-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: Abfragen des Zugriffscodes im TI-Flow-Fachdienst](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#abfragen-des-zugriffscodes-im-TI-Flow-Fachdienst)



