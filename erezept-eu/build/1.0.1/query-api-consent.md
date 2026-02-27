# Query API: Consent - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Query API**](menu-schnittstellen-query-api.md)
* **Query API: Consent**

## Query API: Consent

Diese Seite beschreibt den Einstieg in die Consent-Query-Schnittstelle.

### Nachricht

Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource **Consent** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Zustimmung einsehen |
| POST | Zustimmung erteilen |
| DELETE | Zustimmung widerrufen |

### Anforderungen an Schnittstelle

* [Server Anforderungen zur Consent-Query](./query-api-consent-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.

### Resource API

Anfragen an die *Consent*-Ressource können über die RESTful API durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

* Suche nach Einwilligungen, die für einen Anwendungsfall eingestellt wurden: `?category=EUDISPCONS`

#### API Beschreibung

* [API-ERP: Zustimmung für die Nutzung von E-Rezepten im EU-Ausland](https://github.com/gematik/api-erp/blob/master/docs/erp_eprescription.adoc#zustimmung-f%C3%BCr-die-nutzung-von-e-rezepten-im-eu-ausland)

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

