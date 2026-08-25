# E-Rezept-FdV Anforderungen $abort - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **E-Rezept-FdV Anforderungen $abort**

## E-Rezept-FdV Anforderungen $abort

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV DARF im Anwendungsfall "E-Rezept löschen" dem Nutzer das Löschen von E-Rezepten mit dem Flowtype 169 oder 209 NICHT ermöglichen, wenn der Task einen Status ungleich "completed" hat.

