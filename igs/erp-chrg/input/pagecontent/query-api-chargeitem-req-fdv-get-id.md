<!--A_24544-->
<requirement conformance="MAY" key="IG-ERP-CHRG-29018CDG" title="E-Rezept-FdV: optional: Abrechnungsinformation abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation durch den Versicherten abrufen" umsetzen.
</requirement>

TODO: A_22174-01
<!--A_22174-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-92528SYV" title="E-Rezept-Fachdienst – title" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
      text
</requirement>

<!--A_22175-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-14908CQD" title="E-Rezept-FdV: Abrechnungsinformation abrufen - Abfragerequest einzelner Datensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation abfragen" zum Abrufen der Information zu einem einzelnen Datensatz vom E-Rezept-Fachdienst die HTTP-Operation GET /ChargeItem/&#60;id&#62;/ mit 
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Prescription-ID in URL &#60;id&#62;</li>
      </ul>
      ausführen.
</requirement>

In der Response ist die ChargeItem Ressource und die zugehörigen Detaildatensätze Verordnungsdatensatz, PKV-Abgabedatensatz, Quittung und der AccessCode zum Ändern des PKV-Abgabedatensatzes enthalten.