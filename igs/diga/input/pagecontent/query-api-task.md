Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-task.html) und beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource _Task_ wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Versicherter|GET|Liste von Task abrufen|
|Versicherter|GET /&#60;id&#62;|Spezifischen Task abrufen|
|Kostenträger|GET /&#60;id&#62;?ac=|Recovery Secret|
|Kostenträger|GET /&#60;id&#62;?secret=|Quittung erneut abrufen|
|Versicherter|PATCH|Task markieren|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für Task-Query](./query-api-task-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [KTR-Anforderungen für Task-Query](./query-api-task-req-ktr.html): Anforderungen an das Clientsystem Kostenträger zur Nutzung der Schnittstelle.

#### API Beschreibung

- [API-ERP: Abruf der DiGA-Verordnung durch den Versicherten](https://github.com/gematik/api-erp/blob/master/docs/erp_diga.adoc#abrufen-der-diga-verordnung)
- [API-ERP: E-Rezept erneut abrufen durch den Kostenträger](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-erneut-abrufen)

