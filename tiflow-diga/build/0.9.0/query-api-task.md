# Query API: Task - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Task**

## Query API: Task

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir//query-api-task.html) und beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource **Task** wird über die folgenden HTTP-Methoden ermöglicht:

| | | |
| :--- | :--- | :--- |
| Versicherter | GET | Liste von Task abrufen |
| Versicherter | GET /<id> | Spezifischen Task abrufen |
| Kostenträger | GET /<id>?ac= | Recovery Secret |
| Kostenträger | GET /<id>?secret= | Quittung erneut abrufen |
| Versicherter | PATCH | Task markieren |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen für Task-Query](./query-api-task-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
* [KTR-Anforderungen für Task-Query](./query-api-task-req-ktr.md): Anforderungen an das Clientsystem Kostenträger zur Nutzung der Schnittstelle.

#### API Beschreibung

```
server
```

```
server
```

