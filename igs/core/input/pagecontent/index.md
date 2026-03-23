Dieser IG beschreibt die zentralen, IG-übergreifenden Anforderungen an den
TI-Flow-Fachdienst. Er fasst grundlegende Sicherheits-, Protokollierungs- und
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

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-261" title="TI-Flow-Fachdienst: Anwendung des IG 'E-Rezept-Workflow Core'" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS den Implementation Guide "E-Rezept-Workflow Core" umsetzen.
</requirement>

<!-- A_20745-01, A_19299-02, A_19298-01, A_22483-01, A_19324-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-262" title="TI-Flow-Fachdienst: Umsetzung 'Implementation Guide E-Rezept-Workflow Core'" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS zur Umsetzung des Implementation Guides "E-Rezept-Workflow Core" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind.
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
