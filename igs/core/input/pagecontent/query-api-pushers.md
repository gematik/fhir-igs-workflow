
Für den Empfang von Push Notifications in einem FdV muss sich die App-Instanz am E-Rezept-Fachdienst registrieren. Für die Registrierung wird die Ressource pusher verwendet.

### Nachricht

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Registrierungen abrufen|
|POST|FdV-Instanz registrieren|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Pushers-Query](./query-api-pushers-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Pushers-Query](./query-api-pushers-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.


### Resource API

Dieser Endpunkt ermöglicht die Erstellung, Änderung und Löschung von Pushers für den authentifizierten Nutzer. Das Verhalten dieses Endpunkts variiert je nach Werten im JSON-Body.

Ist `kind` nicht `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer aktualisiert oder erstellt, falls er nicht existiert. Ist `kind` `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer gelöscht.

#### API Beschreibung

<!-- INFO: Pushers ist kein FHIR-Endpunkt, daher kein gematik-api div mit CapabilityStatement möglich. -->
<!-- TODO: API-Beschreibung für Pushers (non-FHIR, FdV-only, JSON) ergänzen -->

