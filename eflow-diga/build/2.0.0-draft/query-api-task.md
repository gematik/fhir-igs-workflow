# Query API: Task - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

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
| Versicherter | GET / | Spezifischen Task abrufen |
| Kostenträger | GET /?ac= | Recovery Secret |
| Kostenträger | GET /?secret= | Quittung erneut abrufen |
| Versicherter | GET / | Spezifischen Task abrufen |
| Versicherter | PATCH | Task markieren |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen für Task-Query](./query-api-task-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen für Task-Query](./query-api-task-req-avs.md): Anforderungen an das AVS zur Nutzung der Schnittstelle.

Die Query API für Task beschreibt den lesenden Zugriff auf Tasks. Der Versicherte ruft die Liste aller seiner Verordnungen inklusive DiGA-Verordnungen ab. Der Versicherte kann mit Referenz auf eine Task-ID eine einzelne Verordnung abrufen.

Der Kostenträger kann unter Angabe der Task-ID und des ACCESS_CODE die Daten einer einzelnen Verordnung abrufen und somit insbesondere den Anwendungfall “Recovery Secret” umsetzen.

Der Kostenträger kann unter Angabe der Task-ID und des Secrets die Daten einer einzelnen Verordnung abrufen und somit insbesondere den Anwendungfall “Quittung erneut abrufen” umsetzen.

