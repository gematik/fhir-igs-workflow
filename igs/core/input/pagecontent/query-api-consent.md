
Für die Nutzung verschiedener im Rahmen der Anwendung E-Rezept angebotenen Funktionalitäten muss der Versicherte vorab eine Einwilligung erteilen. Für die Verwaltung der Einwilligung wird die FHIR Ressource Consent verwendet.

### Nachricht


Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource _Consent_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Einwilligungen einsehen|
|POST|Einwilligung erteilen|
|DELETE|Einwilligung widerrufen|


### Anforderungen an Schnittstelle

- [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.


### Resource API

tbd

#### API Beschreibung

- [API-ERP: Consent](https://github.com/gematik/api-erp/blob/master/docs/erp_consent.adoc)

#### Hinweis

tbd

