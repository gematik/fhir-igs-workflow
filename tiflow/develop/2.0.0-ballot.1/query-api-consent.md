# Query API: Consent - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Consent**

## Query API: Consent

Für die Nutzung verschiedener im Rahmen der Anwendung E-Rezept angebotenen Funktionalitäten muss der Versicherte vorab eine Einwilligung erteilen. Für die Verwaltung der Einwilligung wird die FHIR Ressource Consent verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Einwilligungen als FHIR-Ressource **Consent** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Einwilligungen einsehen |
| POST | Einwilligung erteilen |
| DELETE | Einwilligung widerrufen |

### Anforderungen an Schnittstelle

* [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### API

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.

