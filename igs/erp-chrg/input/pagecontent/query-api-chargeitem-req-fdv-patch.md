<!--A_24553-->
<requirement conformance="MAY" key="IG-ERP-CHRG-98921PAA" title="E-Rezept-FdV: optional: Abrechnungsinformation markieren" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation markieren" umsetzen.
</requirement>

<!--A_22176-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-37823RK3" title="E-Rezept-FdV: Abrechnungsinformation markieren - Markierungen auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation markieren" es dem Nutzer ermöglichen, eine oder mehrere der folgenden Inhalte als Markierung für eine Abrechnungsinformation zu wählen oder abzuwählen:
      <ul>
        <li>zur Abrechnung bei Krankenversicherung eingereicht (extention "insuranceProvider")</li>
        <li>zur Abrechnung bei der Beihilfe eingereicht (extention "subsity")</li>
        <li>zur Einreichung beim Finanzamt verwendet (extention "taxOffice")</li>
      </ul>
</requirement>

TODO: A_22177-02
<!--A_22177-02-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-89929A71" title="E-Rezept-FdV: title" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      text
</requirement>

<!--A_22179-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-07053MFH" title="E-Rezept-FdV: Abrechnungsinformation markieren - Speicherrequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation markieren" zum Speichern der Information im E-Rezept-Fachdienst die HTTP-Operation PATCH /ChargeItem/&#60;id&#62; mit 
        <ul>
            <li>ACCESS_TOKEN im Authorization-Header</li>
            <li>Prescription-ID in URL &#60;id&#62;</li>
        </ul>
      für jede zu ändernde Markierung
        <ul>
            <li>"add" in type</li>
            <li>zu ändernde Markierung in path</li>
            <li>geänderter Wert in value</li>
        </ul>
      ausführen.
</requirement>
