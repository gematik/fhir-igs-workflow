Dieser IG beschreibt die zentralen, IG-übergreifenden Anforderungen an den
E-Rezept-Fachdienst. Er fasst grundlegende Sicherheits-, Protokollierungs- und
Validierungsvorgaben zusammen, die in allen nachgelagerten IGs wiederverwendet
werden.

## Zweck und Geltungsbereich

Der Core-IG fokussiert auf die technische Basisschicht des Fachdienstes:

- Zugriffs- und Systemprotokollierung (AuditEvent)
- Datenschutz und Sicherheit, insbesondere Anforderungen an die VAU
- Validierung von FHIR-Ressourcen und Bundles
- Löschfristen und automatisches Löschen
- Modulübergreifende Operationen auf Task ($create, $activate, $abort, ...)


### Anforderungen zur Umsetzung des IGs

<requirement conformance="SHALL" title="E-Rezept-Fachdienst: Umsetzung 'Implementation Guide E-Rezept-Workflow Core'" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS zur Umsetzung des Implementation Guides "Implementation Guide E-Rezept-Workflow Core" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind.
</requirement>

## Aufbau

- [Zugriffsprotokollierung](./audit-service.html)
- [Datenschutz und Sicherheit](./data-security.html)
- [FHIR-Validierung](./fhir-validate.html)
- [Löschfristen](./ttl.html)
- [Verbindungsaufbau Clientsysteme (über IDP-Dienst)](./verbindungsaufbau-client.html)
- [Query API (modulübergreifend)](./query-api.html)
- [Operation API (modulübergreifend)](./operation-api.html)
- [FHIR-Artefakte](./artifacts.html)

## Bezug zu weiteren IGs

Dieser IG enthält nur die gemeinsamen Vorgaben. Fachliche und
prozessspezifische Details werden in den jeweiligen IGs dokumentiert.
