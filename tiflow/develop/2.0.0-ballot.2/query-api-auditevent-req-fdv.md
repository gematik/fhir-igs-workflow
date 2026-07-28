# FdV-Anforderungen: AuditEvent-Query - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: AuditEvent**](query-api-auditevent.md)
* **FdV-Anforderungen: AuditEvent-Query**

## FdV-Anforderungen: AuditEvent-Query

Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `AuditEvent`-Query-Endpunkte.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Protokolldaten anzeigen" zum Abrufen der Protokolleinträge vom TI-Flow-Fachdienst die HTTP-Operation GET /AuditEvent ausführen.
Der Response beinhaltet ein Bundle mit einem searchset von AuditEvent Ressourcen. Die Informationen, die eine AuditEvent Ressource enthält, werden [hier](./audit-service.md) beschrieben.

Das E-Rezept-FdV kann es dem Nutzer über einen Link in der Anzeige ermöglichen, die Details zur referenzierten Verordnung anzuzeigen.

* AuditEvent-Einträge enthalten personenbezogene Protokolldaten und sind entsprechend vertraulich zu behandeln.
* `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.

