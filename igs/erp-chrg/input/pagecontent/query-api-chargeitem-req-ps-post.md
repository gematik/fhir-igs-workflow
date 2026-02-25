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