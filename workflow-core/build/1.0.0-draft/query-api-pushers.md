# Query API: Pushers - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Pushers**

## Query API: Pushers

Für den Empfang von Push Notifications in einem FdV muss sich die App-Instanz am E-Rezept-Fachdienst registrieren. Für die Registrierung wird die Ressource pusher verwendet.

### Nachricht

| | |
| :--- | :--- |
| GET | Registrierungen abrufen |
| POST | FdV-Instanz registrieren |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Pushers-Query](./query-api-pushers-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Pushers-Query](./query-api-pushers-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

Dieser Endpunkt ermöglicht die Erstellung, Änderung und Löschung von Pushers für den authentifizierten Nutzer. Das Verhalten dieses Endpunkts variiert je nach Werten im JSON-Body.

Ist `kind` nicht `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer aktualisiert oder erstellt, falls er nicht existiert. Ist `kind` `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer gelöscht.

#### API Beschreibung

* [API-ERP: Pusher Verwaltung](https://github.com/gematik/api-erp/blob/master/docs/erp_push_notifications.adoc#pusher-verwaltung)

