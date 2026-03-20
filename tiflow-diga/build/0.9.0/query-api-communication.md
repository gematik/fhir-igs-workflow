# Query API: Communication - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

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

* [FD-Anforderungen zu Communications](./query-api-communication-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu Communications](./query-api-communication-req-ktr.md): Anforderungen an ein CS Kostenträger zur Nutzung der Schnittstelle.

### POST /Communication

* Zuweisung einer Verordnung durch den Versicherten an den Kostenträger. Der Payload ist hierbei optional (Kardinalität 0..1)
* Übermittlung einer Nachricht durch den Kostenträger an den Versicherten.

-API Beschreibung aus Cap Statement

### GET /Communication

* Kostenträger: Abruf von Zuweisungen von Versicherten
* Versicherter: Abruf der Rückmeldungen des Kostenträgers

-API Beschreibung aus Cap Statement

