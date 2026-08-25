# Anforderungen an den verordnende Primärsystem für die $create-Operation - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $create**](op-create.md)
* **Anforderungen an den verordnende Primärsystem für die $create-Operation**

## Anforderungen an den verordnende Primärsystem für die $create-Operation

Diese Seite enthält die normativen Anforderungen an ein PVS für die Operation `$create`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Zur Verordnung von DiGAs werden die DiGA-FHIR-Profile der KBV genutzt: https://simplifier.net/evdga.

Das PS der verordnenden LEI darf FHIR-Extensions nicht im Verordnungsdatensatz verwenden, die nicht explizit gemäß KBV-Profilversion "kbv.itv.evdga" beschrieben sind.

funkt. Eignung: HerstellererklärungDas PS der verordnenden LEI DARF bei der Verordnung einer DiGA zu Lasten einer Berufsgenossenschaft oder Unfallkasse NICHT die elektronische Verordnung nutzen.
Das PS der verordnenden LEI DARF bei der Verordnung einer DiGA NICHT eine Mehrfachverordnung erstellen.

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden erstellen" beim Verordnen einer DiGA die HTTP-Operation POST /Task/$create mit Parameter FlowType = 162 ausführen.

