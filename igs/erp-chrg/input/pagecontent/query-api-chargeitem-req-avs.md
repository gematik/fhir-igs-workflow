### Abrechnungsinformation bereitstellen (POST /ChargeItem)
Mit diesem Anwendungsfall stellt die abgebende LEI die Abrechnungsinformation zu einem E-Rezept auf dem E-Rezept-Fachdienst ein.

<!--A_22708-->
<requirement conformance="SHALL NOT" key="IG-ERP-CHRG-30168RYA" title="PS abgebende LEI: Abrechnungsinformation bereitstellen – Einwilligung muss vorliegen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das PS der abgebenden LEI DARF NICHT Abrechnungsinformation auf dem E-Rezept-Fachdienst bereitstellen, wenn ihm nicht zuvor die Information über die Einwilligung des Versicherten vom E-Rezept-Fachdienst übertragen wurde.
</requirement>

<!--A_22186-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-96876DS5" title="PS abgebende LEI: Abrechnungsinformation bereitstellen – E-Rezept auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept auszuwählen, zu dem die Abrechnungsinformation auf dem E-Rezept-Fachdienst bereitgestellt werden soll.
</requirement>

Die Information, dass der Versicherte die Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt hat, wird im Anwendungsfall "E-Rezept abrufen" übermittelt.

TODO: A_22187
<!--A_22187-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-52369JHM" title="E-Rezept-Fachdienst – title" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
      text
</requirement>

<!--A_22188-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-03077PVE" title="PS abgebende LEI: Abrechnungsinformation bereitstellen – PKV-Abgabedatensatz erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" eine FHIR-Ressource des PKV-Abgabedatensatzes mit den Informationen zur Abrechnung des abgegebenen Medikaments erstellen.
</requirement>

TODO: Fix Links 
Für die Spezifikation der Ressource PKV-Abgabedatensatz siehe [gemSpec_DM_eRp].

Das Signieren des PKV-Abgabedatensatzes erfolgt gemäß [gemILF_PS_eRp] Kap. "Abgabedatensatz signieren". Für die Wahl des Signaturverfahrens (QES oder nonQES) gelten die rechtlichen Vorgaben.

<!--A_22189-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-79277ZR7" title="PS abgebende LEI: Abrechnungsinformation bereitstellen – ChargeItem erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" eine FHIR-Ressource ChargeItem erstellen und den PKV-Abgabedatensatzes als contained Ressource einfügen.
</requirement>

TODO: Fix Link 
Für die Spezifikation der Ressource ChargeItem siehe [gemSpec_DM_eRp].

<!--A_22190-->
<requirement conformance="SHALL" key="IG-ERP-CHRG-03695JQ2" title="PS abgebende LEI: Abrechnungsinformation bereitstellen - Speicherrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" die HTTP-Operation POST /ChargeItem/ des E-Rezept-Fachdienstes mit
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Task-ID als URL-Parameter ?task=</li>
        <li>Geheimnis in URL-Parameter ?secret=</li>
        <li>ChargeItem im http-Body des Aufrufs als data</li>
      </ul>
      ausführen.
</requirement>

Wenn das E-Rezept bereits vom E-Rezept-Fachdienst gelöscht wurde, dann enthält der Response den Fehlercode 405. Das Bereitstellen der Abrechnungsinformation zu einem E-Rezept ist nur möglich bevor das E-Rezept gelöscht wurde.

Wenn der Versicherte zwischenzeitlich die Einwilligung zum Speichern von Abrechnungsinformationen im E-Rezept-Fachdienst widerrufen hat, dann enthält der Response den Fehlercode 403.

### PKV-Abgabedatensatz ändern (PUT /ChargeItem/&#60;id&#62;)
Mit diesem Anwendungsfall kann die abgebende LEI den PKV-Abgabedatensatz zu einem E-Rezept, welche die abgebende LEI zuvor auf dem E-Rezept-Fachdienst bereitgestellt hat, ändern. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.

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

### Abrechnungsinformation abrufen (GET /ChargeItem/&#60;id&#62;)
Mit diesem Anwendungsfall kann eine abgebende LEI die Abrechnungsinformation vom E-Rezept-Fachdienst abrufen, welche durch sie zuvor bereitgestellt und noch nicht gelöscht wurde. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.

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