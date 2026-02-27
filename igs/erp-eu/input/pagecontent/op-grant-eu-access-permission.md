Die FHIR-Operation $grant-eu-access-permission beendet den E-Rezept-Workflow des unter der <id> geführten Tasks und speichert die von der europäischen Apotheke übermittelten Dispensierinformationen für den Versicherten. Diese Operation steht ausschließlich dem NCPeH-FD zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/$grant-eu-access-permission` gesendet.

### Anforderungen an Schnittstelle

- [Server Anforderungen zu `$grant-eu-access-permission`](./$grant-eu-access-permission-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: Erstellen des Zugriffscodes im E-Rezept-Fachdienst](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#erstellen-des-zugriffscodes-im-e-rezept-fachdienst)


### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
