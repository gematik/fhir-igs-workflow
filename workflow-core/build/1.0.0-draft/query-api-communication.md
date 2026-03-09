# Query API: Communication - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Communication**

## Query API: Communication

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource **Communication** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Nachrichten abrufen |
| POST | Nachricht einstellen |
| DELETE | Nachricht löschen |

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu Communications](./query-api-communication-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zu Communications](./query-api-communication-req-avs.md): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu Communications](./query-api-communication-req-ktr.md): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Communication*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

* Für den Versicherten noch nicht vom E-Rezept-Fachdienst abgerufene Communications: `?recipient=<kvnr>&received=NULL`

#### API Beschreibung

* [API-ERP: Communications](https://github.com/gematik/api-erp/blob/master/docs/erp_communication.adoc)

#### Hinweis

* Bei Bereitstellung von Communications werden angehangene JSONs in content.payload ebenfalls validiert.

