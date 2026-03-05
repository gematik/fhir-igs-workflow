# Query API: AuditEvent - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: AuditEvent**

## Query API: AuditEvent

# Query API: AuditEvent

Diese Seite beschreibt die moduluebergreifende AuditEvent-Query-Schnittstelle.

### Nachricht

Die AuditEvent-Query wird ueber HTTP `GET` auf `/AuditEvent` und `/AuditEvent/{id}` aufgerufen.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

* [Einsicht in das Zugriffsprotokoll](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#einsicht-in-das-zugriffsprotokoll)

### Hinweis

* Die AuditEvent-Query ist auf Versicherte beschraenkt.
* Schreibende HTTP-Operationen auf `AuditEvent` sind unzulaessig.

