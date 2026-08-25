# FD-Anforderungen: Consent-Query - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.3

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Consent**](query-api-consent.md)
* **FD-Anforderungen: Consent-Query**

## FD-Anforderungen: Consent-Query

Diese Seite beschreibt Anforderungen am TI-Flow-Fachdienst zur Nutzung der `Consent`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### DELETE /Consent (Einwilligung widerrufen)

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent mit ?category=CHARGCONS alle dem Versicherten zugeordneten ChargeItem-Ressourcen (ChargeItem.subject.identifier) anhand des zeta-user-info.identifier des Nutzers (KVNR) identifizieren und löschen.

