# Query API: Consent - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Consent**

## Query API: Consent

Für die Nutzung verschiedener im Rahmen der Anwendung E-Rezept angebotenen Funktionalitäten muss der Versicherte vorab eine Einwilligung erteilen. Für die Verwaltung der Einwilligung wird die FHIR Ressource Consent verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource **Consent** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Einwilligungen einsehen |
| POST | Einwilligung erteilen |
| DELETE | Einwilligung widerrufen |

### Anforderungen an Schnittstelle

* [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

#### Einstellen von Einwilligungen

Als Versicherter möchte ich eine Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen erstellen und dem Fachdienst übermitteln. Die Einwilligung wird über die FHIR-Ressource “Consent” abgebildet.

Der Aufruf erfolgt als http-`POST`-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden.

```
server
```

#### Abfragen von Einwilligungen

Als Versicherter möchte ich meine erteilte Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen einsehen.

Der Aufruf erfolgt als http-GET-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden, der Fachdienst filtert die Consent-Einträge nach der im ACCESS_TOKEN enthaltenen KVNR des Versicherten.

```
server
```

### Instance API

#### Löschen einer einzelnen Einwilligung

Als Versicherter möchte ich meine erteilte Einwilligung zur elektronischen Speicherung meiner Abrechnungsinformationen widerrufen. Mit dem Widerruf der Einwilligung werden bereits gespeicherte Abrechnungsinformationen gelöscht.

Der Aufruf erfolgt als http-`DELETE`-Operation auf die Ressource /Consent. Im Aufruf muss das während der Authentisierung erhaltene ACCESS_TOKEN im http-Request-Header Authorization übergeben werden, der Fachdienst filtert die Consent-Einträge nach der im ACCESS_TOKEN enthaltenen KVNR des Versicherten.

```
server
```

