# Query API: Consent - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Query API**](menu-schnittstellen-query-api.md)
* **Query API: Consent**

## Query API: Consent

Diese Seite beschreibt den Einstieg in die Consent-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource **Consent** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Einwilligungen einsehen |
| POST | Einwilligung erteilen |
| DELETE | Einwilligung widerrufen |

### Anforderungen an die Schnittstelle

* [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

#### Einstellen von Einwilligungen

Als Versicherter möchte ich eine Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen erstellen und dem Fachdienst übermitteln. Die Einwilligung wird über die FHIR-Ressource “Consent” abgebildet.

Der Aufruf erfolgt als http-`POST`-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden.

```
server
```

Error processing command: Unable to find fragment resource Consent/ExampleEUConsent pointed to in file /home/runner/work/fhir-igs-workflow/fhir-igs-workflow/igs/erp-eu/input/pagecontent/query-api-consent </div> 

Error processing command: Unable to find fragment resource Consent/ExampleEUConsent pointed to in file /home/runner/work/fhir-igs-workflow/fhir-igs-workflow/igs/erp-eu/input/pagecontent/query-api-consent </div> </div> </div> #### Abfragen von Einwilligungen Als Versicherter möchte ich meine erteilte Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen einsehen. Der Aufruf erfolgt als http-GET-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden. Der Fachdienst filtert die Consent-Einträge nach der in der Nutzerinformation (zeta-user-info) enthaltenen KVNR des Versicherten. 

```
server
```

 ### Instance API #### Löschen einer einzelnen Einwilligung Als Versicherter möchte ich meine erteilte Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen widerrufen. Mit dem Widerruf der Einwilligung werden bereits gespeicherte Abrechnungsinformationen gelöscht. Der Aufruf erfolgt als http-`DELETE`-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden. Der Fachdienst filtert die Consent-Einträge nach der in der Nutzerinformation (zeta-user-info) enthaltenen KVNR des Versicherten. 

```
server
```

 


