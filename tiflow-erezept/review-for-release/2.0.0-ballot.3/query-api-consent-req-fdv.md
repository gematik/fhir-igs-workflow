# FdV-Anforderungen: Consent - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Consent**](query-api-consent.md)
* **FdV-Anforderungen: Consent**

## FdV-Anforderungen: Consent

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung der `Consent`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

Für die Verwaltung der Einwilligung zum Einlösen von E-Rezepten im europäischen Ausland wird Consent.category.coding.code mit dem Codesystem https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType verwendet.

