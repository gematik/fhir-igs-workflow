Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$revoke-eu-access-permission`-Endpunktes.

Das E-Rezept-FdV MUSS es dem Nutzer im Anwendungsfall "Zugriffsberechtigung löschen" ermöglichen den Löschwunsch einzugeben.

<!--A_27125 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-A34" title="E-Rezept-FdV: Zugriffsberechtigung löschen - Abfragerequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" zum Löschen der Information auf dem TI-Flow-Fachdienst die HTTP-Operation DELETE /$revoke-eu-access-permission ausführen.
</requirement>

<!--A_27126 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-A35" title="E-Rezept-FdV: Zugriffsberechtigung löschen - lokale Zugriffsberechtigung löschen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" die lokal gespeicherten Informationen zur Zugriffsberechtigung löschen.
</requirement>