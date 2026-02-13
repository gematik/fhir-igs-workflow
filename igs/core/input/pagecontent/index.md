# Implementation Guide E-Rezept-Workflow Core

Dieser IG beschreibt die zentralen, IG-uebergreifenden Anforderungen an den
E-Rezept-Fachdienst. Er fasst grundlegende Sicherheits-, Protokollierungs- und
Validierungsvorgaben zusammen, die in allen nachgelagerten IGs wiederverwendet
werden.

## Zweck und Geltungsbereich

Der Core-IG fokussiert auf die technische Basisschicht des Fachdienstes:

- Zugriffs- und Systemprotokollierung (AuditEvent)
- Datenschutz und Sicherheit, insbesondere Anforderungen an die VAU
- Validierung von FHIR-Ressourcen und Bundles
- Loeschfristen und automatisches Loeschen
- Moduluebergreifende Operationen auf Task ($create, $activate, $abort)

## Aufbau

- [Zugriffsprotokollierung](./audit-service.html)
- [Datenschutz und Sicherheit](./data-security.html)
- [FHIR-Validierung](./fhir-validate.html)
- [Loeschfristen](./ttl.html)
- [Operation API (moduluebergreifend)](./operation-api.html)
- [FHIR-Artefakte](./artifacts.html)

## Bezug zu weiteren IGs

Dieser IG enthaelt nur die gemeinsamen Vorgaben. Fachliche und
prozessspezifische Details werden in den jeweiligen IGs dokumentiert.
