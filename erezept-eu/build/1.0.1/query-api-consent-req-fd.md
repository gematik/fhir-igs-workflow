# Server Anforderungen: Consent - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Consent**](query-api-consent.md)
* **Server Anforderungen: Consent**

## Server Anforderungen: Consent

### Anforderungen der Schnittstelle aus der Core-Spezifikation

//TODO: Include Core AFOs

### Anforderungen der Schnittstelle aus diesem Modul

#### DELETE

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt `/Consent` mit `?category=EUDISPCONS` alle dem Versicherten zugeordneten Zugriffsberechtigungen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und löschen.

