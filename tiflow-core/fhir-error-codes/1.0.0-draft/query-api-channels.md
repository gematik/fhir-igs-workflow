# Query API: Channels - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Channels**

## Query API: Channels

Für den Empfang von Push Notifications in einem FdV kann die App-Instanz eine Konfiguration am TI-Flow-Fachdienst hinterlegen. Für die Konfiguration wird die Ressource channels verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Konfigurationen für Push Notifications als Ressource **Channels** wird über die folgenden HTTP-Methoden ermöglicht:

| | | |
| :--- | :--- | :--- |
| GET | GET /channels | Verfügbare Channels abrufen |
| GET | GET /channels/{pushkey} | Für eine FdV-Instanz hinterlegte Konfiguration abrufen |
| POST | POST /channels/{pushkey} | Konfiguration für eine FdV-Instanz speichern |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur channels-Query](./query-api-channels-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur channels-Query](./query-api-channels-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

Der TI-Flow-Fachdienst unterstützt das optionale Feature “Channels”. Ruft alle verfügbaren Channels für den authentifizierten Nutzer ab.

#### API Beschreibung

##### GET /channels

```
server
```

{ "channels": [ { "id": "channel1", "status": "enabled" }, { "id": "channel2", "status": "disabled" } ] }

Successful operation

Bad Request

Unauthorized

Forbidden

Too Many Requests

##### GET /channels/{pushkey}

```
server
```

{ "channels": [ { "id": "channel1", "status": "enabled" }, { "id": "channel2", "status": "disabled" } ] }

Successful operation

Bad Request

Unauthorized

Forbidden

Too Many Requests

##### POST /channels/{pushkey}

```
server
```

{ "channels": [ { "name": "channel1", "value": "enabled" }, { "name": "channel2", "value": "disabled" } ] }

{}

Successful operation

Bad Request

Unauthorized

Forbidden

Too Many Requests

