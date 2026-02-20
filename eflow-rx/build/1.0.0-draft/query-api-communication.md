# Query API: Communication - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Communication**

## Query API: Communication

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

### Nachricht

Die Nachricht zum Abruf von Nachrichten wird als HTTP `GET`-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Liste der hinterlegten **Communication**-Instanzen abzurufen.

Zum Einstellen von Nachrichten wird eine HTTP `POST`-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Nachricht für einen intendierten Empfänger einzustellen.

Zum Löschen von Nachrichten wird eine HTTP `DELETE`-Anfrage an den E-Rezept-Fachdienst gesendet, um eine Nachricht zu löschen.

### Anforderungen an Schnittstelle

* [Ergänzende Client-Anforderungen zur Communication-Query](./query-api-communication-server-requirements.md): Anforderungen an den Client des E-Rezept-Fachdienstes zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Communication*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

* Für den Versicherten noch nicht vom E-Rezept-Fachdienst abgerufene Communications: `?recipient=<kvnr>&received=NULL`

#### API Beschreibung

* [API-ERP: Communications](https://github.com/gematik/api-erp/blob/master/docs/erp_communication.adoc)

#### Hinweis

* Bei Bereitstellung von Communications werden angehangene JSONs in content.payload ebenfalls validiert

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

