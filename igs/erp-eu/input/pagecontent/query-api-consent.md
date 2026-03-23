Diese Seite beschreibt den Einstieg in die Consent-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource _Consent_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Einwilligungen einsehen|
|POST|Einwilligung erteilen|
|DELETE|Einwilligung widerrufen|

### Anforderungen an die Schnittstelle

- [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>Consent</i>-Ressource können über die RESTful API durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

- Suche nach Einwilligungen, die für einen Anwendungsfall eingestellt wurden: ``?category=EUDISPCONS``

#### API Beschreibung

- [API-ERP: Zustimmung für die Nutzung von E-Rezepten im EU-Ausland](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#zustimmung-f%C3%BCr-die-nutzung-von-e-rezepten-im-eu-ausland)



