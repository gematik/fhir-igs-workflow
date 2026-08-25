# KTR-Anforderungen: Communication-Query - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **KTR-Anforderungen: Communication-Query**

## KTR-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

funkt. Eignung: KonformitätsbestätigungDas Clientsystem des Kostenträgers MUSS im Anwendungsfall "Nachricht an Versicherten versenden" eine FHIR-Ressource mit dem Profil GEM_ERP_PR_Communication_DiGA erstellen.

