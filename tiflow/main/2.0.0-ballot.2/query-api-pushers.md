# Query API: Pushers - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Additional API**](menu-schnittstellen-additional-api.md)
* **Query API: Pushers**

## Query API: Pushers

Für den Empfang von Push Notifications in einem FdV muss sich die App-Instanz am TI-Flow-Fachdienst registrieren. Für die Registrierung wird die Ressource pusher verwendet.

### Nachricht

| | |
| :--- | :--- |
| GET | Registrierungen abrufen |
| POST | FdV-Instanz registrieren |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Pushers-Query](./query-api-pushers-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Pushers-Query](./query-api-pushers-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

Dieser Endpunkt ermöglicht die Erstellung, Änderung und Löschung von Pushers für den authentifizierten Nutzer. Das Verhalten dieses Endpunkts variiert je nach Werten im JSON-Body.

Ist `kind` nicht `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer aktualisiert oder erstellt, falls er nicht existiert. Ist `kind` `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer gelöscht.

#### API Beschreibung

##### GET /pushers

```
server
```

Successful operation

Bad Request

Unauthorized

Forbidden

Too Many Requests

##### POST /pushers/set

```
server
```

Successful operation

Bad Request

Unauthorized

Forbidden

Too Many Requests

