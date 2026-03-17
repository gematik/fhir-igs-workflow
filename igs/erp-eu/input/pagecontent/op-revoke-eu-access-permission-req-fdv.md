Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$revoke-eu-access-permission`-Endpunktes.

Das E-Rezept-FdV MUSS es dem Nutzer im Anwendungsfall "Zugriffsberechtigung löschen" ermöglichen den Löschwunsch einzugeben.

<!--A_27125 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-33" title="E-Rezept-FdV: Zugriffsberechtigung löschen - Abfragerequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" zum Löschen der Information auf dem E-Rezept-Fachdienst die HTTP-Operation DELETE /$revoke-eu-access-permission mit:
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
    </ul>
    ausführen.
</requirement>

<!--A_27126 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-34" title="E-Rezept-FdV: Zugriffsberechtigung löschen - lokale Zugriffsberechtigung löschen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" die lokal gespeicherten Informationen zur Zugriffsberechtigung löschen.
</requirement>