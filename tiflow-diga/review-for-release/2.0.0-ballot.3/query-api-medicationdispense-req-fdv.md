# FdV-Anforderungen: MedicationDispense-Query - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* [**Query API: MedicationDispense**](query-api-medicationdispense.md)
* **FdV-Anforderungen: MedicationDispense-Query**

## FdV-Anforderungen: MedicationDispense-Query

Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `MedicationDispense`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

Der Kostenträger stellt die Abgabeinformationen beim Abschluss des Workflows zur Verordnung ein. Der Task hat dann den Status "completed".

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" für einen Task mit Flowtyp 162 dem Nutzer den Freischaltcode den Freischaltcode in geeigneter Weise darstellen.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "Abgabeinformationen abfragen" für einen Task mit Flowtyp 162 dem Nutzer Supportinformationen zu der DiGA-App zusammen mit dem Freischaltcode anzeigen.
Supportinformationen zu DiGA-Apps sind im BfArM-Verzeichnis verfügbar.

