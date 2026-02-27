TODO: 
- Ersetzen von <Resource> mit dem Namen der FHIR Ressource (bspw. MedicationDispense)
- Ersetzen von <Name> mit fachlichem Namen der Informationseinheit (bspw. Dispensierinformation)

Diese Seite beschreibt den Einstieg in die <Resource>-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Abruf von <Name> wird als HTTP GET-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Liste der hinterlegten _<Resource>_-Instanzen abzurufen.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur <Resource>-Query](./link.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zur <Resource>-Query](./link.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i><Resource></i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

BEISPIEL:- Suche nach Medikamentenabgaben, die an einem bestimmten Tag erfolgten: ``?whenHandedOver=2025-02-14``

#### API Beschreibung

- [API-ERP: Abgabeinformationen abrufen](link-api-erp)

#### Hinweis

- ...Hinweise


### Instance API

Um spezifische Details zu einem einzelnen _<Resource>_ mittels der RESTful API zu erhalten, wird die _<Resource> Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt <i>/<Resource>/[id]</i> gestellt wird.

#### API Beschreibung

- [API-ERP: <Name> zu einem E-Rezept abrufen](link)

#### Hinweise

- ...Hinweise


### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./link) festgehalten.
