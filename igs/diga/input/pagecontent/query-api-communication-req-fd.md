Diese Seite beschreibt Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

Der TI-Flow-Fachdienst MUSS für das Modul DIGA folgende Operationen unterstützen:
|Akteur|Operation|
|---|---|
|Versicherter, Kostenträger|GET /Communication|
|Versicherter, Kostenträger|POST /Communication|
|Versicherter, Kostenträger|DELETE /Communication/&#60;id&#62|

### Modulspezifische Anforderungen

Es gibt keine modulspezifischen Anforderungen.