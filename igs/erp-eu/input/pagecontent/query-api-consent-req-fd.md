### Anforderungen der Schnittstelle aus der Core-Spezifikation

{% include core-query-api-consent-req-fd.md %}

### Anforderungen der Schnittstelle aus diesem Modul

#### DELETE

<!-- A_27131 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-33" title="TI-Flow-Fachdienst - Consent löschen - EUDISPCONS - Löschen Zugriffsberechtigung" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt `/Consent` mit `?category=EUDISPCONS` alle dem Versicherten zugeordneten Zugriffsberechtigungen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und löschen.
</requirement>
