TODO: A_22202 
<!--A_22202 -->
<requirement conformance="SHALL" key="IG-ERP-CHRG-08524D64" title="PS abgebende LEI: Abrechnungsinformation abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
      text
</requirement>

<!--A_22203-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-63541GTY" title="PS abgebende LEI: Abrechnungsinformation abrufen - Leserequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
      Das PS abgebende LEI MUSS im Anwendungsfall "Abrechnungsinformation abrufen" die HTTP-Operation GET /ChargeItem/&#60;id&#62; des E-Rezept-Fachdienstes mit
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Prescription-ID in URL &#60;id&#62;</li>
        <li>AccessCode in URL-Parameter ?ac=</li>
      </ul>
      ausführen.
</requirement>

Im Response ist die ChargeItem Ressource mit dem Verordnungsdatensatz und dem zugehörigen PKV-Abgabedatensatz enthalten.