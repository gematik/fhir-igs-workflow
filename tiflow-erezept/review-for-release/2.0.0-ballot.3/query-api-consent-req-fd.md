# FD-Anforderungen: Consent - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Consent**](query-api-consent.md)
* **FD-Anforderungen: Consent**

## FD-Anforderungen: Consent

### Anforderungen der Schnittstelle aus der Core-Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Anforderungen der Schnittstelle aus diesem Modul

#### DELETE

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt `/Consent` mit `?category=EUDISPCONS` alle dem Versicherten zugeordneten Zugriffsberechtigungen anhand des zeta-user-info.identifier des Nutzers (KVNR) identifizieren und löschen.

