# Query API: Task - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Task**

## Query API: Task

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0/query-api-task.html) und beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Verordnungen als FHIR-Ressource **Task** wird über die folgenden HTTP-Methoden ermöglicht:

| | | |
| :--- | :--- | :--- |
| Versicherter | GET | Liste von Task abrufen |
| Versicherter | GET /<id> | Spezifischen Task abrufen |
| Apotheke | GET ?hcv= | E-Rezepte von Versicherten abrufen (VSDM) |
| Apotheke | GET X-PoPP-Token | E-Rezepte von Versicherten abrufen (PoPP) |
| Apotheke | GET /<id>?ac= | Recovery Secret |
| Apotheke | GET /<id>?secret= | Quittung erneut abrufen |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Task-Query](./query-api-task-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen für Task-Query](./query-api-task-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen für Task-Query](./query-api-task-req-avs.md): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Task*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

#### API Beschreibung

* [API-ERP: Alle E-Rezepte ansehen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#alle-e-rezepte-ansehen)
* [API-ERP: E-Rezept erneut abrufen abgebend](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-erneut-abrufen)

### Instance API

Um spezifische Details zu einem einzelnen **Task** mittels der RESTful API zu erhalten, wird die **Task Instance API** verwendet, indem eine HTTP GET-Anfrage an den Endpunkt */Task/<id>* gestellt wird.

#### API Beschreibung

* [API-ERP: Ein einzelnes E-Rezept abrufen und in der Apotheke einlösen](https://github.com/gematik/api-erp/blob/master/docs/erp_versicherte.adoc#ein-einzelnes-e-rezept-abrufen-und-in-der-apotheke-einl%C3%B6sen)

