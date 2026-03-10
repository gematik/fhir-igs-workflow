Für die Nutzung verschiedener im Rahmen der Anwendung E-Rezept angebotenen Funktionalitäten zu Verordnungen werden verschiednen Workflows genutzt. Für die Verwaltung der Workflows wird die FHIR Ressource Task verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource _Task_ wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Versicherter|GET|Liste von Task abrufen|
|Versicherter|GET /<id>|Spezifischen Task abrufen|
|Apotheke, Kostenträger|GET /<id>?ac=|Recovery Secret|
|Apotheke, Kostenträger|GET /<id>?secret=|Quittung erneut abrufen|
|Versicherter|GET /<id>|Spezifischen Task abrufen|
|Versicherter|PATCH|Task markieren|

### Anforderungen an Schnittstelle

- [Server-Anforderungen zur Task-Query](./query-api-task-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Task-Query](./query-api-task-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zur Task-Query](./query-api-task-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.
- [KTR-Anforderungen zur Task-Query](./query-api-task-req-ktr.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.


### Resource API

Anfragen an die <i>Task</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

Durch Angabe des URL-Parameter `?ac=` bei der GET-Operation kann eine abgebende Institution den Anwendungsfall "Recovery Secret" ausführen.

Durch Angabe des URL-Parameter `?secret=` bei der GET-Operation kann eine abgebende Institution den Anwendungsfall "UC 4.8 - Quittung erneut abrufen" ausführen.

#### API Beschreibung

- [API-ERP: Alle E-Rezepte ansehen (FdV)](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#alle-e-rezepte-ansehen)

### Instance API

Um spezifische Details zu einem einzelnen _Task_ mittels der RESTful API zu erhalten, wird die _Task Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt <i>/Task/[id]</i> gestellt wird.

#### API Beschreibung

- [API-ERP: E-Rezept abrufen (FdV)](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#ein-einzelnes-e-rezept-abrufen-und-in-der-apotheke-einl%C3%B6sen)
- [API-ERP: E-Rezept erneut abrufen (PS abgebend)](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-erneut-abrufen)
- [API-ERP: Quittung erneut abrufen (PS abgebend)](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#quittung-erneut-abrufen)

