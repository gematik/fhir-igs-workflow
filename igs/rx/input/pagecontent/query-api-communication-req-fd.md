Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

Der TI-Flow-Fachdienst MUSS für das Modul Arzneimittel folgende Operationen unterstützen:
|Akteur|Operation|
|---|---|
|Versicherter, Apotheke|GET /Communication|
|Versicherter, Apotheke|POST /Communication|
|Versicherter, Apotheke|DELETE /Communication/&#60;id&#62|

### Modulspezifische Anforderungen

#### POST /Communication

Für Prüfung Payload siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.html)