Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

Der TI-Flow-Fachdienst MUSS für das Modul DIGA folgende Operationen unterstützen:
|Akteur|Operation|
|---|---|
|Versicherter|GET /Task|
|Versicherter|GET /Task/&#60;id&#62;|
|Kostenträger|GET /Task/&#60;id&#62;?ac=|
|Kostenträger|GET /Task/&#60;id&#62;?secret=|

Der TI-Flow-Fachdienst DARF für das Modul DiGA die Operation nicht unterstützen:
|Operation|
|---|
|GET /Task (PoPP-Token)|
|PATCH /Task/&#60;id&#62;|

### Modulspezifische Anforderungen

Es gibt keine modulspezifischen Anforderungen.