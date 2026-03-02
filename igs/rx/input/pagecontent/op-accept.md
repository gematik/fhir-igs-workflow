Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/op-accept.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$accept` gesendet.

### Anforderungen an Schnittstelle

- [Ergänzende Server-Anforderungen zu `$accept`](./op-accept-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:
- [API-ERP: E-Rezept abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-abrufen)

### Hinweis

- Die Rückgabe kann bei Mehrfachverordnung mit `403` scheitern, wenn die Einlösefrist noch nicht begonnen hat.
- AccessCode und insbesondere `secret` sind als hochsensible Daten zu behandeln.

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
