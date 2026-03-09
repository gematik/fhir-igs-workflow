Für die Nutzung verschiedener im Rahmen der Anwendung E-Rezept angebotenen Funktionalitäten zu Verordnungen werden verschiednen Workflows genutzt. Für die Verwaltung der Workflows wird die FHIR Ressource Task verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource _Task_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Task abrufen|
|PATCH|Task markieren|

### Anforderungen an Schnittstelle

- [Server-Anforderungen zur Task-Query](./query-api-task-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Task-Query](./query-api-task-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zur Task-Query](./query-api-task-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zur Task-Query](./query-api-task-req-ktr.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.


### Resource API

Durch Angabe des URL-Parameter ?ac= bei der GET-Operation kann eine abgebende Institution den Anwendungsfall "Recovery Secret" ausführen.

Durch Angabe des URL-Parameter ?secret= bei der GET-Operation kann eine abgebende Institution den Anwendungsfall "UC 4.8 - Quittung erneut abrufen" ausführen.

#### API Beschreibung

tbd

#### Hinweis

tbd

