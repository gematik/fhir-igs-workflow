# TODO: Fehlende Beispiele für gematik-api Blöcke

Dieses Dokument listet alle fehlenden FHIR-Beispiele auf, die für die `gematik-api` HTML-Blöcke
in den Operation- und Query-API-Seiten des Core IG benötigt werden.

**Formatregel:** FdV (eRp_FdV / Versicherte App) nutzt immer JSON. Alle anderen Schnittstellen (PVS, AVS, KTR) nutzen immer XML.

---

## Operationen

### $create (op-create.md) - PVS: XML
- [x] Request: `Parameters/OperationCreateParametersInputExample` (existiert in rx)
- [x] Response: `Task/b12eb5f7-91ce-4887-93c7-800454601377` (existiert in rx)
- [x] Error: `OperationOutcome/ExampleOperationCreateError` (existiert in rx)

### $activate (op-activate.md) - PVS: XML
- [x] Request: `Parameters/ExampleOperationActivateParametersInput` (existiert in rx)
- [ ] Response: Task im Status "ready" - prüfen ob `Task/TaskInReadyState` die richtige FHIR-ID hat
- [x] Error: `OperationOutcome/ExampleOperationActivateError` (existiert in rx)

### $accept (op-accept.md) - AVS/KTR: XML
- [ ] Request: Kein Body nötig (nur Header mit AccessCode), ggf. HTTP-Request-Beispiel erstellen
- [ ] Response: Bundle mit Task + Secret - `Bundle/ExampleAcceptResponseBundle` erstellen
- [x] Error: `OperationOutcome/ExampleOperationAcceptError` (existiert in rx)

### $reject (op-reject.md) - AVS/KTR: XML
- [ ] Request: Kein Body nötig (nur Header mit AccessCode und secret), ggf. HTTP-Request-Beispiel erstellen
- [ ] Response: Erfolgsfall (HTTP 204 No Content) - kein FHIR-Beispiel nötig
- [x] Error: `OperationOutcome/ExampleOperationRejectError` (existiert in rx)

### $close (op-close.md) - AVS: XML
- [x] Request: `Parameters/ExampleCloseInputParameters` (existiert in rx, inkl. Varianten)
- [ ] Response: Task im Status "completed" - prüfen ob `Task/TaskInClosedState` die richtige FHIR-ID hat
- [ ] Error: OperationOutcome-Fehlerbeispiel für $close erstellen

### $abort (op-abort.md) - PVS/AVS: XML, FdV: JSON
- [ ] Request (PVS, XML): Kein Body nötig, ggf. HTTP-Request-Beispiel
- [ ] Request (AVS, XML): Kein Body nötig, ggf. HTTP-Request-Beispiel
- [ ] Request (FdV, JSON): Kein Body nötig, ggf. HTTP-Request-Beispiel
- [x] Error (PVS, XML): `OperationOutcome/ExampleOperationAbortErrorPVS` (existiert in rx)
- [x] Error (AVS, XML): `OperationOutcome/ExampleOperationAbortErrorAVS` (existiert in rx)
- [ ] Error (FdV, JSON): FdV-Fehlerbeispiel für $abort als JSON erstellen

---

## Query APIs

### Task - Resource API (query-api-task.md) - FdV: JSON
- [ ] Request: GET /Task Beispiel-Request (FdV, JSON)
- [ ] Response: Bundle mit Task-Liste (FdV, JSON)

### Task - Instance API (query-api-task.md) - FdV: JSON, AVS/KTR: XML
- [ ] Request (FdV, JSON): GET /Task/{id} Beispiel
- [ ] Request (AVS/KTR, XML): GET /Task/{id}?ac= und GET /Task/{id}?secret= Beispiele
- [ ] Response (FdV, JSON): Einzelner Task
- [ ] Response (AVS/KTR, XML): Einzelner Task mit Secret / Quittung

### MedicationDispense (query-api-medicationdispense.md) - FdV: JSON
- [ ] Request: GET /MedicationDispense Beispiel-Request (FdV, JSON)
- [ ] Response: Bundle mit MedicationDispense-Liste (FdV, JSON)

### AuditEvent (query-api-auditevent.md) - FdV: JSON
- [ ] Request: GET /AuditEvent Beispiel-Request (FdV, JSON)
- [ ] Response: Bundle mit AuditEvent-Liste (FdV, JSON)

### Communication (query-api-communication.md) - FdV: JSON, AVS: XML, KTR: XML
- [ ] Request (FdV, JSON): GET /Communication?recipient=&received=NULL Beispiel
- [ ] Request (AVS, XML): GET /Communication Beispiel
- [ ] Request (KTR, XML): GET /Communication Beispiel
- [ ] Response (FdV, JSON): Bundle mit Communication-Liste
- [ ] Response (AVS, XML): Bundle mit Communication-Liste
- [ ] Response (KTR, XML): Bundle mit Communication-Liste

### Device (query-api-device.md) - alle Clients: XML und JSON
- [ ] Request: GET /Device Beispiel
- [ ] Response (XML): Device-Ressource
- [ ] Response (JSON): Device-Ressource

### Consent (query-api-consent.md) - FdV: JSON
- [ ] Request: GET /Consent Beispiel-Request (FdV, JSON)
- [ ] Response: Bundle mit Consent-Ressource (FdV, JSON)

### Subscription (query-api-subscription.md) - AVS/KTR: XML
- [ ] Request: POST /Subscription Beispiel-Request (AVS/KTR, XML)
- [ ] Response: Subscription-Ressource (AVS/KTR, XML)

---

## Non-FHIR Endpunkte (kein gematik-api div möglich)

### Pushers (query-api-pushers.md) - FdV: JSON
- [ ] API-Beschreibung für Pushers-Endpunkt erstellen (non-FHIR, proprietäres JSON)
- [ ] Request/Response-Beispiele für Pusher-Verwaltung

### Channels (query-api-channels.md) - FdV: JSON
- [ ] API-Beschreibung für Channels-Endpunkt erstellen (non-FHIR, proprietäres JSON)
- [ ] Request/Response-Beispiele für Channel-Verwaltung

---

## Hinweise

- Beispiele die mit "(existiert in rx)" markiert sind, sind als FSH-Instanzen im rx IG definiert.
  Diese stehen nach dem Merge der Core-Seiten in den rx-Build zur Verfügung.
- Für den Core-Standalone-Build müssen diese Beispiele ggf. als Dependency verfügbar sein.
- Fragment-Referenzen nutzen das Format: `{% fragment ResourceType/ResourceId FORMAT %}`
- Die FHIR-IDs in den Fragment-Referenzen müssen mit den tatsächlichen `id`-Werten der
  FSH-Instanzen übereinstimmen (nicht mit dem Instance-Namen).
