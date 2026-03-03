Die FHIR-Operation $eu-close beendet den E-Rezept-Workflow des unter der <id> geführten Tasks und speichert die von der europäischen Apotheke übermittelten Dispensierinformationen für den Versicherten. Diese Operation steht ausschließlich dem NCPeH-FD zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$eu-close` gesendet.

### Anforderungen an Schnittstelle

- [Server Anforderungen zu `$eu-close`](./$eu-close-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: Abgabeinformationen zu einem E-Rezept einstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#abgabeinformationen-zu-einem-e-rezept-einstellen)



