# Operation API: Zugriffsberechtigung einsehen - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Zugriffsberechtigung einsehen**

## Operation API: Zugriffsberechtigung einsehen

Mit der FHIR-Operation kann die Zugriffsberechtigung für die im ACCESS_TOKEN angegebene KVNR abgerufen werden. Diese Operation steht Versicherten zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `GET` an `/$read-eu-access-permission` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$read-eu-access-permission`](./$read-eu-access-permission-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: Abfragen des Zugriffscodes im E-Rezept-Fachdienst](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#abfragen-des-zugriffscodes-im-e-rezept-fachdienst)

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

