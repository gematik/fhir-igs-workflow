# Operation $create (Task erzeugen) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $create (Task erzeugen)**

## Operation $create (Task erzeugen)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0op-create.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

### Anforderungen an Schnittstelle

* [Ergänzende Server-Anforderungen zu `$create`](./op-create-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Ergänzende Client-Anforderungen zu `$create`](./op-create-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen)

### Hinweis

* Task-IDs dürfen nicht auf Vorrat erzeugt bzw. bevorratet werden.
* `$create` ist nur für konkrete, unmittelbar folgende Verordnungsprozesse zu verwenden.
* Quelle: [api-erp: E-Rezept erstellen](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-erstellen).

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

