# Client-Anforderungen: Query API AuditEvent

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der AuditEvent-Query-Endpunkte.

## Normative Client-Anforderungen

In den vorliegenden Spezifikationen sind keine zusaetzlichen, ausschließlich auf `/AuditEvent` bezogenen, normativen Client-Anforderungen ausgewiesen.

## Hinweise zur Nutzung

- AuditEvent-Eintraege enthalten personenbezogene Protokolldaten und sind entsprechend vertraulich zu behandeln.
- `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.
