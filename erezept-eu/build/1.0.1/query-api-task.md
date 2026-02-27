# Query API: Task - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Query API**](menu-schnittstellen-query-api.md)
* **Query API: Task**

## Query API: Task

Diese Seite beschreibt den Einstieg in die Task-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit E-Rezepten als FHIR-Ressource **Task** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| PATCH | Task markieren |

### Anforderungen an Schnittstelle

* [Server Anforderungen zur Task-Query](./query-api-task-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [Client-Anforderungen zur Task-Query](./query-api-task-req-fdv.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Task*-Ressource können über die RESTful API durchgeführt werden.

#### API Beschreibung

* [API-ERP: Setzen der Markierung zur Einlösung im EU-Ausland](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#setzen-der-markierung-zur-einl%C3%B6sung-im-eu-ausland)

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

