# Operation $activate (Task aktivieren) - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $activate (Task aktivieren)**

## Operation $activate (Task aktivieren)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$activate`](./op-activate-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zu `$activate`](./op-activate-req-pvs.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept vervollständigen und Task aktivieren](https://github.com/gematik/api-erp/blob/master/docs/erp_bereitstellen.adoc#e-rezept-vervollst%C3%A4ndigen-und-task-aktivieren)

### Hinweis

* Bei ausbleibender Antwort soll der Client den Aufruf wiederholen.
* Wenn ein wiederholter Aufruf mit `403` und “Task not in status draft but in status ready” antwortet, war ein vorheriger Aufruf bereits erfolgreich.

