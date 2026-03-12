Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

Communication wird für die Kommunikation zwischen Versicherten und Apotheke verwendet.

### Nachricht

Die Nachricht zum Abruf von Nachrichten wird als HTTP GET-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Liste der hinterlegten _Communication_-Instanzen abzurufen.

Mit einer POST-Anfrage an den E-Rezept-Fachdienst kann eine _Communication_-Instanz am E-Rezept-Fachdienst eingestellt werden.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Communication-Query](./query-api-communication-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für Communication-Query](./query-api-communication-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen für Communication-Query](./query-api-communication-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>Communication</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

#### API Beschreibung

- [API-ERP: API-Dokumentation für Nachrichtenaustausch](https://github.com/gematik/api-erp/blob/master/docs/erp_communication.adoc)

### Instance API

Um spezifische Details zu einer einzelnen _Communciation_ mittels der RESTful API zu erhalten, wird die _Communciation Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt <i>/Communciation/[id]</i> gestellt wird.

#### API Beschreibung

- [API-ERP: Auf neue Nachrichten im E-Rezept-Fachdienst prüfen](https://github.com/gematik/api-erp/blob/master/docs/erp_communication.adoc#anwendungsfall-auf-neue-nachrichten-im-e-rezept-fachdienst-pr%C3%BCfen)


