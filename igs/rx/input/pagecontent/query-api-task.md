Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-task.html) und beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Abruf von E-Rezepten wird als HTTP GET-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Liste der hinterlegten _Task_-Instanzen abzurufen.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für Task-Query](./query-api-task-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen für Task-Query](./query-api-task-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>Task</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

#### API Beschreibung

- [API-ERP: Alle E-Rezepte ansehen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#alle-e-rezepte-ansehen)
- [API-ERP: E-Rezept erneut abrufen abgebend](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-erneut-abrufen)

### Instance API

Um spezifische Details zu einem einzelnen _Task_ mittels der RESTful API zu erhalten, wird die _Task Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt <i>/Task/[id]</i> gestellt wird.

#### API Beschreibung

- [API-ERP: Ein einzelnes E-Rezept abrufen und in der Apotheke einlösen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#ein-einzelnes-e-rezept-abrufen-und-in-der-apotheke-einl%C3%B6sen)
