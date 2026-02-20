Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}op-reject.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$reject` gesendet.

### Anforderungen an Schnittstelle

- [Ergänzende Server-Anforderungen zu `$reject`](./op-reject-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Ergänzende Client-Anforderungen zu `$reject`](./op-reject-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: E-Rezept zurückweisen](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-zur%C3%BCckweisen)

### Hinweis

- `reject` und direktes erneutes `accept` sollen nicht als Übergabemechanismus zwischen Apotheken verwendet werden.
- Diese Folge erzeugt für Versicherte schwer nachvollziehbare Protokollierung/Notifications.


### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
