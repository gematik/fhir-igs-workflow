Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `ChargeItem`-Query-Endpunkte.

### Abrechnungsinformationen abrufen
### Liste von Abrechnungsinformationen abrufen (GET /ChargeItem)
Mit diesem Anwendungsfall kann der Nutzer eine Liste aller Abrechnungsinformationen vom E-Rezept-Fachdienst abrufen, welche für den Versicherten bereitgestellt wurden.

<!--A_24554-->
<requirement conformance="MAY" key="IG-ERP-CHRG-18881YVE" title="E-Rezept-FdV: optional: Liste Abrechnungsinformationen abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="eRP_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "Liste Abrechnungsinformationen abrufen" umsetzen.
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

### Abrechnungsinformation abrufen (GET /ChargeItem/&#60;id&#62;)
Mit diesem Anwendungsfall kann der Nutzer (Versicherter) die Abrechnungsinformation zu einem E-Rezept vom E-Rezept-Fachdienst herunterladen.

<!--A_24544-->
<requirement conformance="MAY" key="IG-ERP-CHRG-29018CDG" title="E-Rezept-FdV: optional: Abrechnungsinformation abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das E-Rezept-FdV KANN den Anwendungsfall "Abrechnungsinformation durch den Versicherten abrufen" umsetzen.
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

### Abrechnungsinformation markieren (PATCH /Charge/&#60;id&#62;)
Mit diesem Anwendungsfall kann der Nutzer (Versicherter) Markierungen zu seiner Abrechnungsinformation setzen. Diese werden auf dem E-Rezept-Fachdienst gespeichert.

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

### Abrechnungsinformation löschen (DELETE /ChargeItem/&#60;id&#62;)
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