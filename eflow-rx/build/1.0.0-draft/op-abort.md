# Operation $abort (Task abbrechen) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $abort (Task abbrechen)**

## Operation $abort (Task abbrechen)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0op-abort.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

### Anforderungen an Schnittstelle

* [Ergänzende Server-Anforderungen zu `$abort`](./op-abort-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Ergänzende Client-Anforderungen zu `$abort`](./op-abort-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept löschen verordnend](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#ein-e-rezept-l%C3%B6schen)
* [API-ERP: E-Rezept löschen abgebend](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-l%C3%B6schen)
* [API-ERP: E-Rezept löschen Versicherter](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#ein-e-rezept-l%C3%B6schen)

### Hinweis

* Nach erfolgreichem `$abort` sind lokale Einlöseinformationen (`secret`, Token-Bezug) im Client zu bereinigen.
* Fehlercodes und OperationOutcome-Hinweise sollen dem Nutzer mit klarem Bezug zum Task-Status angezeigt werden.

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

