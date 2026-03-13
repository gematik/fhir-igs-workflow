# E-Rezept-FdV-Anforderungen: Query API AuditEvent

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der AuditEvent-Query-Endpunkte.

## Normative E-Rezept-FdV-Anforderungen

In den vorliegenden Spezifikationen sind keine zusätzlichen, ausschließlich auf `/AuditEvent` bezogenen, normativen Client-Anforderungen ausgewiesen.

## Hinweise zur Nutzung

- AuditEvent-Einträge enthalten personenbezogene Protokolldaten und sind entsprechend vertraulich zu behandeln.
- `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.
