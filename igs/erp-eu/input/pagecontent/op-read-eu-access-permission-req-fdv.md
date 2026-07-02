Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$read-eu-access-permission`-Endpunktes.

<!--A_27121 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-A46" title="E-Rezept-FdV: Zugriffsberechtigung abrufen - Abfragerequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung abrufen" zum Abrufen der Information vom TI-Flow-Fachdienst die HTTP-Operation GET /$read-eu-access-permission ausführen.
</requirement>

In der Response kann ein Zugriffsberechtigungsdatensatz [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] enthalten sein.