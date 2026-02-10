# eFlow Server - Startpunkt

Dieser Implementation Guide (IG) beschreibt den **eFlow Server** als Gesamtsystem und ist der **Startpunkt** fuer alle beteiligten IGs. Er zeigt, wie die Module zusammenhaengen, und verweist auf die Detail-IGs.

## Wofuer ist dieser IG?

- **Gesamtvertrag des Servers**: Das CapabilityStatement aggregiert alle Module.
- **Orientierung**: Welche IGs es gibt und wie sie zusammenspielen.
- **Lesepfade**: Was Server- und Client-Hersteller in welcher Reihenfolge lesen sollten.

## Schnellnavigation

- **Wegweiser**: [Wegweiser und Lesepfade](wegweiser.html)
- **FHIR-Artefakte**: [FHIR-Artefakte](artifacts.html)
- **Serververtrag**: ` /CapabilityStatement/eflow-server`

## Die IG-Landschaft (Kurzueberblick)

- **eFlow Core**: Moduluebergreifende Regeln, Sicherheit, Audit, Basisoperationen.
- **Fachmodule**: Jeweils ein Anwendungsfall (z. B. Rx, DiGA, Patientenrechnung, EU).
- **eFlow Server (dieser IG)**: Gesamtumfang des Servers als Aggregation aller Module.

## Alle IGs auf einen Blick

- [eFlow Core](https://gemspec.gematik.de/ig/fhir/eflow-core/latest)
- [eFlow Rx](https://gemspec.gematik.de/ig/fhir/eflow-rx/latest)
- [eFlow DiGA](https://gemspec.gematik.de/ig/fhir/eflow-diga/latest)
- [eFlow PatRech](https://gemspec.gematik.de/ig/fhir/eflow-patrech/latest)
- [eFlow EU](https://gemspec.gematik.de/ig/fhir/eflow-eu/latest)
- [eFlow Transfer](https://gemspec.gematik.de/ig/fhir/eflow-transfer/latest)

Details und konkrete Lesepfade findest du im [Wegweiser](wegweiser.html).