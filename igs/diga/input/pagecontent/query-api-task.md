Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-task.html) und beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource _Task_ wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Versicherter|GET|Liste von Task abrufen|
|Versicherter|GET /<id>|Spezifischen Task abrufen|
|Kostenträger|GET /<id>?ac=|Recovery Secret|
|Kostenträger|GET /<id>?secret=|Quittung erneut abrufen|
|Versicherter|GET /<id>|Spezifischen Task abrufen|
|Versicherter|PATCH|Task markieren|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für Task-Query](./query-api-task-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen für Task-Query](./query-api-task-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.


Die Query API für Task beschreibt den lesenden Zugriff auf Tasks.
Der Versicherte ruft die Liste aller seiner Verordnungen inklusive DiGA-Verordnungen ab.
Der Versicherte kann mit Referenz auf eine Task-ID eine einzelne Verordnung abrufen.

Der Kostenträger kann unter Angabe der Task-ID und des ACCESS_CODE die Daten einer einzelnen Verordnung abrufen und somit insbesondere den Anwendungfall "Recovery Secret" umsetzen.

Der Kostenträger kann unter Angabe der Task-ID und des Secrets die Daten einer einzelnen Verordnung abrufen und somit insbesondere den Anwendungfall "Quittung erneut abrufen" umsetzen.
