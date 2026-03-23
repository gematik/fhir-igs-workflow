Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$read-eu-access-permission`-Endpunktes.

<!--A_27121 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-46" title="E-Rezept-FdV: Zugriffsberechtigung abrufen - Abfragerequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung abrufen" zum Abrufen der Information vom E-Rezept-Fachdienst die HTTP-Operation GET /$read-eu-access-permission mit: 
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
    </ul>
    ausführen.
</requirement>

In der Response kann ein Zugriffsberechtigungsdatensatz [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] enthalten sein.