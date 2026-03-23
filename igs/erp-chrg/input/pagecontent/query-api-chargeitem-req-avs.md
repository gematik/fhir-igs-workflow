### Abrechnungsinformation bereitstellen (POST /ChargeItem)
Mit diesem Anwendungsfall stellt die abgebende LEI die Abrechnungsinformation zu einem E-Rezept auf dem TI-Flow-Fachdienst ein.

<!--A_22708-->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CHRG-22" title="PS abgebende LEI: Abrechnungsinformation bereitstellen – Einwilligung muss vorliegen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das PS der abgebenden LEI DARF NICHT Abrechnungsinformation auf dem TI-Flow-Fachdienst bereitstellen, wenn ihm nicht zuvor die Information über die Einwilligung des Versicherten vom TI-Flow-Fachdienst übertragen wurde.
</requirement>

<!--A_22186-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-23" title="PS abgebende LEI: Abrechnungsinformation bereitstellen – E-Rezept auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept auszuwählen, zu dem die Abrechnungsinformation auf dem TI-Flow-Fachdienst bereitgestellt werden soll.
</requirement>

Die Information, dass der Versicherte die Einwilligung zum Speichern der Abrechnungsinformationen auf dem TI-Flow-Fachdienst erteilt hat, wird im Anwendungsfall "E-Rezept abrufen" übermittelt.

<!--A_22188-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-24" title="PS abgebende LEI: Abrechnungsinformation bereitstellen – PKV-Abgabedatensatz erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" eine FHIR-Ressource des PKV-Abgabedatensatzes mit den Informationen zur Abrechnung des abgegebenen Medikaments erstellen.
</requirement>

Für die Spezifikation der Ressource PKV-Abgabedatensatz siehe [gemSpec_DM_eRp].

Das Signieren des PKV-Abgabedatensatzes erfolgt gemäß [gemILF_PS_eRp] Kap. "Abgabedatensatz signieren". Für die Wahl des Signaturverfahrens (QES oder nonQES) gelten die rechtlichen Vorgaben.

<!--A_22189-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-25" title="PS abgebende LEI: Abrechnungsinformation bereitstellen – ChargeItem erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" eine FHIR-Ressource ChargeItem erstellen und den PKV-Abgabedatensatzes als contained Ressource einfügen.
</requirement>

Für die Spezifikation der Ressource ChargeItem siehe [gemSpec_DM_eRp].

<!--A_22190-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-26" title="PS abgebende LEI: Abrechnungsinformation bereitstellen - Speicherrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "Abrechnungsinformation bereitstellen" die HTTP-Operation POST /ChargeItem/ des TI-Flow-Fachdienstes mit
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Task-ID als URL-Parameter ?task=</li>
        <li>Geheimnis in URL-Parameter ?secret=</li>
        <li>ChargeItem im http-Body des Aufrufs als data</li>
      </ul>
      ausführen.
</requirement>

Wenn das E-Rezept bereits vom TI-Flow-Fachdienst gelöscht wurde, dann enthält der Response den Fehlercode 405. Das Bereitstellen der Abrechnungsinformation zu einem E-Rezept ist nur möglich bevor das E-Rezept gelöscht wurde.

Wenn der Versicherte zwischenzeitlich die Einwilligung zum Speichern von Abrechnungsinformationen im TI-Flow-Fachdienst widerrufen hat, dann enthält der Response den Fehlercode 403.

### PKV-Abgabedatensatz ändern (PUT /ChargeItem/&#60;id&#62;)
Mit diesem Anwendungsfall kann die abgebende LEI den PKV-Abgabedatensatz zu einem E-Rezept, welche die abgebende LEI zuvor auf dem TI-Flow-Fachdienst bereitgestellt hat, ändern. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.

<!--A_22191-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-27" title="PS abgebende LEI: PKV-Abgabedatensatz ändern - PKV-Abgabedatensatz zum Ändern auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
      Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, die Abrechnungsinformation zu einem E-Rezept zum Ändern auf dem TI-Flow-Fachdienst auszuwählen.
</requirement>

<!--A_22193-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-28" title="PS abgebende LEI: PKV-Abgabedatensatz ändern – PKV-Abgabedatensatz erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" eine FHIR-Ressource des PKV-Abgabedatensatzes mit den Informationen zur Abrechnung des abgegebenen Medikaments erstellen.
</requirement>

Für die Spezifikation der Ressource PKV-Abgabedatensatz siehe [gemSpec_DM_eRp].

Das Signieren des PKV-Abgabedatensatzes erfolgt gemäß [gemILF_PS_eRp] Kap. "Abgabedatensatz signieren".

<!--A_22194 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-29" title="PS abgebende LEI: PKV-Abgabedatensatz ändern – ChargeItem erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS der abgebenden LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" eine FHIR-Ressource ChargeItem erstellen und den PKV-Abgabedatensatzes als contained Ressource einfügen.
</requirement>

Für die Spezifikation der Ressource ChargeItem siehe [gemSpec_DM_eRp].

<!--A_22195-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-30" title="PS abgebende LEI: PKV-Abgabedatensatz ändern - Speicherrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
      Das PS abgebende LEI MUSS im Anwendungsfall "PKV-Abgabedatensatz ändern" die HTTP-Operation PUT /ChargeItem/&#60;id&#62;/ des TI-Flow-Fachdienstes mit
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Prescription-ID in URL &#60;id&#62;</li>
        <li>AccessCode in URL-Parameter ?ac=</li>
        <li>ChargeItem im http-Body des Aufrufs als data</li>
      </ul>
      ausführen.
</requirement>

Wenn der Versicherte zwischenzeitlich die Einwilligung zum Speichern von Abrechnungsinformationen im TI-Flow-Fachdienst widerrufen hat, dann enthält der Response den Fehlercode 403.

### Abrechnungsinformation abrufen (GET /ChargeItem/&#60;id&#62;)
Mit diesem Anwendungsfall kann eine abgebende LEI die Abrechnungsinformation vom TI-Flow-Fachdienst abrufen, welche durch sie zuvor bereitgestellt und noch nicht gelöscht wurde. Als Voraussetzung muss der Versicherte der abgebenden LEI einen AccessCode übermitteln, um die abgebende LEI zu berechtigen.

<!--A_22203-->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-31" title="PS abgebende LEI: Abrechnungsinformation abrufen - Leserequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
      Das PS abgebende LEI MUSS im Anwendungsfall "Abrechnungsinformation abrufen" die HTTP-Operation GET /ChargeItem/&#60;id&#62; des TI-Flow-Fachdienstes mit
      <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Prescription-ID in URL &#60;id&#62;</li>
        <li>AccessCode in URL-Parameter ?ac=</li>
      </ul>
      ausführen.
</requirement>

Im Response ist die ChargeItem Ressource mit dem Verordnungsdatensatz und dem zugehörigen PKV-Abgabedatensatz enthalten.