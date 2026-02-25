<!--A_24554-->
<requirement conformance="MAY" key="IG-ERP-CHRG-18881YVE" title="E-Rezept-FdV: optional: Liste Abrechnungsinformationen abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "Liste Abrechnungsinformationen abrufen" umsetzen.
</requirement>

TODO: A_22172-01
<!--A_22172-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-79742GJZ" title="E-Rezept-FdV: title" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      text
</requirement>

<!--A_22173-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-64555GAN" title="E-Rezept-FdV: Liste Abrechnungsinformationen abrufen - Abfragerequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Liste Abrechnungsinformationen abfragen" zum Abrufen der Information vom E-Rezept-Fachdienst die HTTP-Operation GET /ChargeItem mit 
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
      </ul>
      ausführen. 
</requirement>

In der Response ist eine Liste von ChargeItem-Ressourcen enthalten. Für jede ChargeItem-Ressource ist die folgende Information enthalten:
<ul>
    <li>Prescription-ID</li>
</ul>