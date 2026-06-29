Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `AuditEvent`-Query-Endpunkte.

<!-- A_19210 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A301" title="E-Rezept-FdV: Protokolldaten anzeigen - Protokolleinträge abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Protokolldaten anzeigen" zum Abrufen der Protokolleinträge vom TI-Flow-Fachdienst die HTTP-Operation GET /AuditEvent ausführen.
</requirement>

Der Response beinhaltet ein Bundle mit einem searchset von AuditEvent Ressourcen. Die Informationen, die eine AuditEvent Ressource enthält, werden [hier](./audit-service.html) beschrieben.

Das E-Rezept-FdV kann es dem Nutzer über einen Link in der Anzeige ermöglichen, die Details zur referenzierten Verordnung anzuzeigen.

- AuditEvent-Einträge enthalten personenbezogene Protokolldaten und sind entsprechend vertraulich zu behandeln.
- `OperationOutcome` aus Query-Aufrufen ist im Client als konkrete Handlungsanweisung darzustellen.

