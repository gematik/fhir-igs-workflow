# Client-Anforderungen: AuditEvent-Query - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: AuditEvent**](query-api-auditevent.md)
* **Client-Anforderungen: AuditEvent-Query**

## Client-Anforderungen: AuditEvent-Query

# Client-Anforderungen: Query API AuditEvent

Diese Seite beschreibt Anforderungen an Clients zur Nutzung der AuditEvent-Query-Endpunkte.

## Normative Client-Anforderungen

In den vorliegenden Spezifikationen sind keine zusaetzlichen, ausschließlich auf `/AuditEvent` bezogenen, normativen Client-Anforderungen ausgewiesen.

## Hinweise zur Nutzung

* AuditEvent-Eintraege enthalten personenbezogene Protokolldaten und sind entsprechend vertraulich zu behandeln.
* `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.

