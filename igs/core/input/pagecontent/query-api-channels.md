
Für den Empfang von Push Notifications in einem FdV kann die App-Instanz eine Konfiguration am E-Rezept-Fachdienst hinterlegen. Für die Konfiguration wird die Ressource channels verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Konfigurationen für Push Notifications als Ressource _Channels_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Aufruf|Ergebnis der Anfrage|
|---|---|
|GET|GET /channels|Verfügbare Channels abrufen|
|GET|GET /channels/{pushkey}|Für eine FdV-Instanz hinterlegte Konfiguration abrufen|
|POST|POST /channels|Konfiguration für eine FdV-Instanz speichern|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur channels-Query](./query-api-channels-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur channels-Query](./query-api-channels-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.


### Resource API

Der E-Rezept-Fachdienst unterstützt das optionale Feature "Channels". Ruft alle verfügbaren Channels für den authentifizierten Nutzer ab.

#### API Beschreibung

<!-- INFO: Channels ist kein FHIR-Endpunkt, daher kein gematik-api div mit CapabilityStatement möglich. -->
<!-- TODO: API-Beschreibung für Channels (non-FHIR, FdV-only, JSON) ergänzen -->


