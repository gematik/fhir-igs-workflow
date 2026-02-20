# Operation $activate (Task aktivieren) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $activate (Task aktivieren)**

## Operation $activate (Task aktivieren)

Diese Operation basiert auf der gleichnamigen Operation in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0op-activate.html).

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

* [Ergänzende Server-Anforderungen zu `$activate`](./op-activate-fd-requirements.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Ergänzende Client-Anforderungen zu `$activate`](./op-activate-client-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept vervollständigen und Task aktivieren](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-vervollst%C3%A4ndigen-und-task-aktivieren)

### Hinweis

* Bei ausbleibender Antwort soll der Client den Aufruf wiederholen.
* Wenn ein wiederholter Aufruf mit `403` und “Task not in status draft but in status ready” antwortet, war ein vorheriger Aufruf bereits erfolgreich.

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

