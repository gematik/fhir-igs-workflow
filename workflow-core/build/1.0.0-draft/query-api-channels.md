# Query API: Channels - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Channels**

## Query API: Channels

Für den Empfang von Push Notifications in einem FdV kann die App-Instanz eine Konfiguration am E-Rezept-Fachdienst hinterlegen. Für die Konfiguration wird die Ressource channels verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Konfigurationen für Push Notifications als Ressource **Channels** wird über die folgenden HTTP-Methoden ermöglicht:

| | | |
| :--- | :--- | :--- |
| GET | GET /channels | Verfügbare Channels abrufen |
| GET | GET /channels/{pushkey} | Für eine FdV-Instanz hinterlegte Konfiguration abrufen |
| POST | POST /channels | Konfiguration für eine FdV-Instanz speichern |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur channels-Query](./query-api-channels-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur channels-Query](./query-api-channels-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

Der E-Rezept-Fachdienst unterstützt das optionale Feature “Channels”. Ruft alle verfügbaren Channels für den authentifizierten Nutzer ab.

#### API Beschreibung

* [API-ERP: Channel Verwaltung](https://github.com/gematik/api-erp/blob/master/docs/erp_push_notifications.adoc#channel-verwaltung)

