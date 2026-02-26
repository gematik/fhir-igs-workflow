Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-Consent.html) und beschreibt den Einstieg in die Consent-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Abruf von E-Rezepten wird als HTTP GET-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Liste der hinterlegten _Consent_-Instanzen abzurufen.

### Anforderungen an Schnittstelle

- [Anforderungen E-Rezept-Fachdienst zur Consent-Query](./query-api-consent-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- ... weitere Systeme, eine Seite pro Clientsystem/Produkttyp

### Resource API

Anfragen an die <i>Consent</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden...