# Query API: Communication - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

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

* [Server-Anforderungen zu Communications](./query-api-communication-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zu Communications](./query-api-communication-req-avs.md): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu Communications](./query-api-communication-req-ktr.md): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### Resource API

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.

