TODO: 
- Ersetzen von <Name> mit fachlichem Namen der Operation (bspw. "Task erzeugen")
- Ersetzen von <op-name> mit FHIR Namen der Operation (bspw. "$create")

### <Name> (<op-name>)

OPTIONAL: Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/<op-name>.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/<op-name>` gesendet.

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu `<op-name>`](./<op-name>-fd-requirements.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [Client-Anforderungen zu `<op-name>`](./<op-name>-client-requirements.html): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: <Name>](link)

### Hinweis

- ...Hinweise

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./link) festgehalten.
