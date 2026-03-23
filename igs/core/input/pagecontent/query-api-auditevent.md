# Query API: AuditEvent

Diese Seite beschreibt die moduluebergreifende AuditEvent-Query-Schnittstelle.

### Nachricht

Die AuditEvent-Query wird ueber HTTP `GET` auf `/AuditEvent` und `/AuditEvent/{id}` aufgerufen.

### Anforderungen an Schnittstelle

- [Server-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur AuditEvent-Query](./query-api-auditevent-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API Beschreibung

- [Einsicht in das Zugriffsprotokoll](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#einsicht-in-das-zugriffsprotokoll)


### Hinweis

- Die AuditEvent-Query ist auf Versicherte beschraenkt.
- Schreibende HTTP-Operationen auf `AuditEvent` sind unzulaessig.
