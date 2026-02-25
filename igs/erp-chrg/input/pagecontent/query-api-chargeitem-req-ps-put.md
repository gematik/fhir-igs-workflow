<!--A_22191-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-03575L7M" title="PS abgebende LEI: PKV-Abgabedatensatz ändern - PKV-Abgabedatensatz zum Ändern auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, die Abrechnungsinformation zu einem E-Rezept zum Ändern auf dem E-Rezept-Fachdienst auszuwählen.
</requirement>

TODO: A_22192 
<!--A_22192-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-80758PUK" title="PS abgebende LEI: title" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      text
</requirement>

<!--A_22193-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-06446PDE" title="PS abgebende LEI: PKV-Abgabedatensatz ändern – PKV-Abgabedatensatz erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" eine FHIR-Ressource des PKV-Abgabedatensatzes mit den Informationen zur Abrechnung des abgegebenen Medikaments erstellen.
</requirement>

TODO: Fix Links 
Für die Spezifikation der Ressource PKV-Abgabedatensatz siehe [gemSpec_DM_eRp].

Das Signieren des PKV-Abgabedatensatzes erfolgt gemäß [gemILF_PS_eRp] Kap. "Abgabedatensatz signieren".

<!--A_22194 -->
<requirement conformance="SHALL" key="IG-ERP-CHRG-04535L9N" title="PS abgebende LEI: PKV-Abgabedatensatz ändern – ChargeItem erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" eine FHIR-Ressource ChargeItem erstellen und den PKV-Abgabedatensatzes als contained Ressource einfügen.
</requirement>

TODO: Fix Link 
Für die Spezifikation der Ressource ChargeItem siehe [gemSpec_DM_eRp].

<!--A_22195-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-90148Q11" title="PS abgebende LEI: PKV-Abgabedatensatz ändern - Speicherrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS abgebende LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" die HTTP-Operation PUT /ChargeItem/&#60;id&#62;/ des E-Rezept-Fachdienstes mit
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Prescription-ID in URL &#60;id&#62;</li>
        <li>AccessCode in URL-Parameter ?ac=</li>
        <li>ChargeItem im http-Body des Aufrufs als data</li>
      </ul>
      ausführen.
</requirement>

Wenn der Versicherte zwischenzeitlich die Einwilligung zum Speichern von Abrechnungsinformationen im E-Rezept-Fachdienst widerrufen hat, dann enthält der Response den Fehlercode 403.