# Client-Anforderungen $abort - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **Client-Anforderungen $abort**

## Client-Anforderungen $abort

Diese Seite enthält die normativen Anforderungen an den Client des E-Rezept-Fachdienst für die Operation `$abort`. Es gelten weiterhin die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0/op-abort-client-requirements.html).

### E-Rezept-FdV

Das E-Rezept-FdV DARF im Anwendungsfall "E-Rezept löschen" dem Nutzer das Löschen von E-Rezepten mit dem Flowtype 169 oder 209 NICHT ermöglichen, wenn der Task einen Status ungleich "completed" hat.

