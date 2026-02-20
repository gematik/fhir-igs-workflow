# Operation $accept (Task akzeptieren) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $accept (Task akzeptieren)**

## Operation $accept (Task akzeptieren)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0op-accept.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$accept` gesendet.

### Anforderungen an Schnittstelle

* [Ergänzende Server-Anforderungen zu `$accept`](./op-accept-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Ergänzende Client-Anforderungen zu `$accept`](./op-accept-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept abrufen](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-abrufen)

### Hinweis

* Die Rückgabe kann bei Mehrfachverordnung mit `403` scheitern, wenn die Einlösefrist noch nicht begonnen hat.
* AccessCode und insbesondere `secret` sind als hochsensible Daten zu behandeln.

### Geschäftslogik

**Abbildung: **Ablauf Operation `$accept`
### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

