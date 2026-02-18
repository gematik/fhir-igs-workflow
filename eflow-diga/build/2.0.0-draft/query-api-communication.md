# Query API: Communication - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Communication**

## Query API: Communication

Communication wird für die Kommunikation zwischen Versicherten und Kostenträger verwendet.

### POST /Communication

* Zuweisung von Verordnungen durch den Versicherten an den Kostenträger. Der Payload ist hierbei optional (Kardinalitaet 0..1)
* Übermittlung einer Nachricht dürch den Kostenträger an den Versicherten.

Es gelten die übergreifenden Anforderungen an die POST /Communication Schnittstelle.

Es gibt keine workflow-spezifischen Anforderungen für den E-Rezept-Fachdienst.

[Workflow-spezifische Anforderungen für das E-Rezept-FdV](./query-api-communication-req-fdv.md)

[Workflow-spezifische Anforderungen für den Kostenträger](./query-api-communication-req-ktr.md)

-API Beschreibung aus Cap Statement

### GET /Communication

* Abruf von Zuweisungen durch den Kostenträger
* Abruf von Rückmeldungen durch den Versicherten

Es gelten die übergreifenden Anforderungen an die GET /Communication Schnittstelle.

Es gibt keine workflow-spezifischen Anforderungen für den E-Rezept-Fachdienst.

Es gibt keine workflow-spezifischen Anforderungen für das E-Rezept-FdV.

Es gibt keine workflow-spezifischen Anforderungen für den Kostenträger.

-API Beschreibung aus Cap Statement

