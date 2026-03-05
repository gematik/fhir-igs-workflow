
Für den Empfang von Push Notifications in einem FdV muss sich die App-Instanz am E-Rezept-Fachdienst registrieren. Für die Registrierung wird die Ressource pusher verwendet.

### Nachricht

Die Nachricht zum Abruf von Einwilligungen wird als HTTP `GET`-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Liste der hinterlegten _Consent_-Instanzen abzurufen.

Zum Erteilen von Einwilligungen wird eine HTTP `POST`-Anfrage an den E-Rezept-Fachdienst gesendet.

Zum Widerrufen einer Einwilligung wird eine HTTP `DELETE`-Anfrage an den E-Rezept-Fachdienst gesendet.


### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Pusher-Query](./query-api-pusher-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Pusher-Query](./query-api-pusher-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.


### Resource API

tbd

#### API Beschreibung

tbd

#### Hinweis

tbd

