Diese Seite beschreibt Anforderungen an ein TI-Flow-FdV zur Nutzung der `AuditEvent`-Query-Endpunkte.

<!-- A_19210 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A301" title="TI-Flow-FdV: Protokolldaten anzeigen - Protokolleinträge abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das TI-Flow-FdV MUSS im Anwendungsfall "Protokolldaten anzeigen" zum Abrufen der Protokolleinträge vom TI-Flow-Fachdienst die HTTP-Operation GET /AuditEvent ausführen.
</requirement>

Der Response beinhaltet ein Bundle mit einem searchset von AuditEvent Ressourcen. Die Informationen, die eine AuditEvent Ressource enthält, werden [hier](./audit-service.html) beschrieben.

Das TI-Flow-FdV kann es dem Nutzer über einen Link in der Anzeige ermöglichen, die Details zur referenzierten Verordnung anzuzeigen.

- AuditEvent-Einträge enthalten personenbezogene Protokolldaten und sind entsprechend vertraulich zu behandeln.
- `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.

