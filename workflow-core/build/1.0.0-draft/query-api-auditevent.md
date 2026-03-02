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
* [Client-Anforderungen zur AuditEvent-Query](./query-api-auditevent-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

#### GET /AuditEvent

```
server
```

#### GET /AuditEvent/{id}

```
server
```

### Hinweis

* Die AuditEvent-Query ist auf Versicherte beschraenkt.
* Schreibende HTTP-Operationen auf `AuditEvent` sind unzulaessig.

