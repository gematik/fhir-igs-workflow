<!--A_24546-->
<requirement conformance="MAY" key="IG-ERP-CHRG-90005HHP" title="E-Rezept-FdV: optional: Abrechnungsinformation löschen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation löschen" umsetzen.
</requirement>

<!--A_22180-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-14219NQZ" title="E-Rezept-FdV: Abrechnungsinformation löschen - Abrechnungsinformationen zum Löschen auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" es dem Nutzer ermöglichen, eine Abrechnungsinformationen zum Löschen auszuwählen.
</requirement>

<!--A_22181-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-00853F24" title="E-Rezept-FdV: Abrechnungsinformation löschen - Bestätigung" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" vom Nutzer eine Bestätigung einholen, dass die selektierte Abrechnungsinformation gelöscht werden soll und die Möglichkeit geben, das Löschen abzubrechen.
</requirement>

Das E-Rezept-FdV muss im Rahmen der Bestätigung darauf hinweisen, dass mit dem Löschen der Abrechnungsinformation die Daten des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung gelöscht werden und somit ein Neueinstellen der Abrechnungsinformation durch die Apotheke ggf. nicht mehr möglich ist.

Das E-Rezept-FdV kann es dem Nutzer ermöglichen, den Anwendungsfall zum lokalen Löschen für die zu löschende Abrechnungsinformation zusammen mit dem Löschen auf dem E-Rezept-Fachdienst auszuführen.

TODO: A_22182-01
<!--A_22182-01-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-25421EA5" title="E-Rezept-FdV: title" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      text
</requirement>

<!--A_22183-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-82359UAF" title="E-Rezept-FdV: Abrechnungsinformation löschen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
      Das E-Rezept-FdV MUSS im Anwendungsfall "Abrechnungsinformation löschen" die HTTP-Operation DELETE /ChargeItem/&#60;id&#62; des E-Rezept-Fachdienstes mit
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Prescription-ID in URL &#60;id&#62;</li>
      </ul>
      ausführen.
</requirement>

<!--A_22707-01-->
<requirement conformance="MAY" key="IG-ERP-CHRG-00019CYE" title="E-Rezept-FdV: Hinweis automatisches Löschen Abrechnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN, wenn es das Management von Abrechnungsinformationen unterstützt, den Nutzer vor Erreichen der Aufbewahrungsfrist der Abrechnungsinformation einen Hinweis zum automatischen Löschen geben, um dem Nutzer die Möglichkeit zu geben, falls gewünscht die Daten herunterzuladen und zu archivieren. 
</requirement>