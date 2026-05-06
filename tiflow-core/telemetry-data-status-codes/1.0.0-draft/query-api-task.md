# Query API: Task - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Task**

## Query API: Task

Für die Nutzung verschiedener im Rahmen der Anwendung E-Rezept angebotenen Funktionalitäten zu Verordnungen werden verschiednen Workflows genutzt. Für die Verwaltung der Workflows wird die FHIR Ressource Task verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource **Task** wird über die folgenden HTTP-Methoden ermöglicht:

| | | |
| :--- | :--- | :--- |
| Versicherter | GET | Liste von Task abrufen |
| Versicherter | GET / | Spezifischen Task abrufen |
| Apotheke, Kostenträger | GET /?ac= | Recovery Secret |
| Apotheke, Kostenträger | GET /?secret= | Quittung erneut abrufen |
| Versicherter | PATCH | Task markieren |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Task-Query](./query-api-task-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zur Task-Query](./query-api-task-req-avs.md): Anforderungen an das AVS zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zur Task-Query](./query-api-task-req-ktr.md): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Task*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

Durch Angabe des URL-Parameter `?ac=` bei der GET-Operation kann eine abgebende Institution den Anwendungsfall “Recovery Secret” ausführen.

Durch Angabe des URL-Parameter `?secret=` bei der GET-Operation kann eine abgebende Institution den Anwendungsfall “UC 4.8 - Quittung erneut abrufen” ausführen.

#### API Beschreibung

```
server
```

### Instance API

Um spezifische Details zu einem einzelnen **Task** mittels der RESTful API zu erhalten, wird die **Task Instance API** verwendet, indem eine HTTP GET-Anfrage an den Endpunkt */Task/[id]* gestellt wird.

#### Task abrufen

```
server
```

#### Task markieren

```
server
```

