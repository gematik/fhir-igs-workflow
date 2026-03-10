Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$abort`.

<!-- A_19241 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-121" title="PS abgebende LEI: E-Rezepte löschen - E-Rezept auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Löschen auf dem Fachdienst auszuwählen.
</requirement>

<!-- A_19242 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-122" title="PS abgebende LEI: E-Rezept löschen - Bestätigung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept gelöscht werden soll, und die Möglichkeit geben, das Löschen abzubrechen.
</requirement>

<!-- A_19243 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-123" title="PS abgebende LEI: E-Rezept durch Abgebenden löschen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.3 - E-Rezept durch Abgebenden löschen" aus [gemSysL_eRp] gemäß TAB_ILFERP_009 umsetzen. Tabelle # : TAB_ILFERP_009 – E-Rezept durch Abgebenden löschen Name E-Rezept durch Abgebenden löschen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat das E-Rezept vom E-Rezept-Fachdienst heruntergeladen. Der Nutzer hat ein E-Rezept zum Löschen markiert und das Löschen bestätigt. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Das ausgewählte E-Rezept ist vom E-Rezept-Fachdienst unwiederbringlich gelöscht. Standardablauf Task-ID und Geheimnis des E-Rezepts bestimmen E-Rezept auf Fachdienst löschen E-Rezept-Token in PS löschen
</requirement>

<!-- A_19244 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-124" title="PS abgebende LEI: E-Rezept löschen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden löschen" für das zu löschende E-Rezept die HTTP-Operation POST /Task/&lt;id&gt;/$abort mit ACCESS_TOKEN im Authorization-Header Task-ID in URL &lt;id&gt; Geheimnis in URL Parameter ?secret= ausführen.
</requirement>

<!-- A_19245 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-125" title="PS abgebende LEI: E-Rezept löschen - E-Rezept-Token löschen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden löschen" für das zu löschende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept löschen" die Daten zum E-Rezept-Token und das Geheimnis im PS löschen.
</requirement>
