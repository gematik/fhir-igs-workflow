# Operation API: Zugriffsberechtigung löschen - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Zugriffsberechtigung löschen**

## Operation API: Zugriffsberechtigung löschen

Die Operation führt zum Löschen der für den Versicherten gespeicherten Zugriffsberechtigung. Diese Operation steht dem Versicherten, der die Zugriffsberechtigung erteilt hat, zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `DELETE` an `/$revoke-eu-access-permission` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$revoke-eu-access-permission`](./$revoke-eu-access-permission-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: Löschen des Zugriffscodes im E-Rezept-Fachdienst](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#l%C3%B6schen-des-zugriffscodes-im-e-rezept-fachdienst)

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

