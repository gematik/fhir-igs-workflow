# Query API: Communication - Verordnungen fuer Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen fuer Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Communication**

## Query API: Communication

Query API: Communication

Communication wird für die Kommunikation zwischen Versicherten und Kostenträger verwendet.

## POST /Communication

* Zuweisung von Verordnungen durch den Versicherten an den Kostenträger. Der Payload ist hierbei optional (Kardinalitaet 0..1)
* Übermittlung des Freischaltcodes dürch den Kostenträger an den Versicherten.

ToDo: Afo für FD zum Prüfen des Payload ?

-API Beschreibung aus Cap Statement

## GET /Communication

* Abruf von Zuweisungen durch den Kostenträger
* Abruf von Rückmeldungen durch den Versicherten

-API Beschreibung aus Cap Statement

