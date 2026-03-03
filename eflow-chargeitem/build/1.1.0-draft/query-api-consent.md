# Query API: Consent - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Consent**

## Query API: Consent

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0query-api-consent.html) und beschreibt den Einstieg in die Consent-Query-Schnittstelle.

Die Query API für Consent ermöglicht das Erteilen, Einsehen und Widerrufen der Einwilligung zur Speicherung von Abrechnungsinformationen.

### Anforderungen an die Schnittstelle

* [Anforderungen für den E-Rezept-Fachdienst](./query-api-consent-req-fd.md)

### POST /Consent (Einwilligung erteilen)

#### Nachricht

Der Versicherte erteilt die Einwilligung durch das Erstellen einer Consent‑Ressource (CHARGCONS). Die KVNR wird in Consent.patient.identifier angegeben.

### GET /Consent (Einwilligung einsehen)

#### Nachricht

Der Versicherte liest die gespeicherte Einwilligung aus. Die Antwort ist ein Bundle mit den Consent‑Ressourcen des Versicherten.

**Beispiel-URI:** `https://prescriptionserver.telematik/Consent`

#### Auslösung

Die Operation wird im FdV/AdV ausgelöst, um den Einwilligungsstatus anzuzeigen.

#### Resource API

Anfragen an die *Consent*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden.

### DELETE /Consent (Einwilligung widerrufen)

#### Nachricht

Der Versicherte widerruft die Einwilligung. Der Widerruf löscht die Consent‑Ressource und alle zugehörigen Abrechnungsinformationen.

**Beispiel-URI:** `https://prescriptionserver.telematik/Consent?category=CHARGCONS`

#### Auslösung

Die Operation wird im FdV/AdV ausgelöst, wenn der Versicherte die Einwilligung zurückzieht.

#### Resource API

Die *Consent*-Ressource können über die RESTful API mittels HTTP DELETE-Anfragen gelöscht werden.

