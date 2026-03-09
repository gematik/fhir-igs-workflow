# Query API: Communication - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Communication**

## Query API: Communication

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir//query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

Communication wird für die Kommunikation zwischen Versicherten und Kostenträger verwendet.

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource **Communication** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Nachrichten abrufen |
| POST | Nachricht einstellen |
| DELETE | Nachricht löschen |

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu Communications](./query-api-communication-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu Communications](./query-api-communication-req-ktr.md): Anforderungen an ein CS Kostenträger zur Nutzung der Schnittstelle.

### POST /Communication

* Zuweisung von Verordnungen durch den Versicherten an den Kostenträger. Der Payload ist hierbei optional (Kardinalitaet 0..1)
* Übermittlung einer Nachricht dürch den Kostenträger an den Versicherten.

-API Beschreibung aus Cap Statement

### GET /Communication

* Abruf von Zuweisungen durch den Kostenträger
* Abruf von Rückmeldungen durch den Versicherten

Es gelten die übergreifenden Anforderungen an die GET /Communication Schnittstelle.

Es gibt keine workflow-spezifischen Anforderungen für den E-Rezept-Fachdienst.

Es gibt keine workflow-spezifischen Anforderungen für das E-Rezept-FdV.

Es gibt keine workflow-spezifischen Anforderungen für den Kostenträger.

-API Beschreibung aus Cap Statement

