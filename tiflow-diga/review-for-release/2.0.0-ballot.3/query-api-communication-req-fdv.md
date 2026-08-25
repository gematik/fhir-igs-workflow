# FdV-Anforderungen: Communication-Query - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FdV-Anforderungen: Communication-Query**

## FdV-Anforderungen: Communication-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### Nachricht versenden

##### Verordnung zuweisen

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV KANN im Anwendungsfall "E-Rezept einer abgebenden Institution zuweisen" es dem Nutzer ermöglichen, für E-Rezepte mit dem Flowtype 162 einen Kostenträger zum Zuweisen einer DiGA auszuwählen.
Die Auswahl kann mit dem Anwendungsfall "Kostenträger suchen" erfolgen.

Beim Zuweisen einer DiGA-Verordnung ist keine freie Textnachricht vorgesehen, um eine maschinelle Verarbeitung zur Bereitstellung des Freischaltcodes zu ermöglichen.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq mit
* Telematik-ID der ausgewählten abgebenden LEI in recipient
* E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/Task/<id>/$accept?ac=..." 
erstellen.

