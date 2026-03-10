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

## PVS

<!-- A_19236 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-126" title="PS verordnende LEI: E-Rezepte löschen - E-Rezept zum Löschen auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der verordnenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Löschen auf dem Fachdienst auszuwählen.
</requirement>

<!-- A_19237 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-127" title="PS verordnende LEI: E-Rezept löschen - Bestätigung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der verordnenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept gelöscht werden soll und die Möglichkeit geben, das Löschen abzubrechen.
</requirement>

<!-- A_19238 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-128" title="PS verordnende LEI: E-Rezept durch Verordnenden löschen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der verordnenden LEI MUSS den Anwendungsfall "UC 2.5 - E-Rezept durch Verordnenden löschen" aus [gemSysL_eRp] gemäß TAB_ILFERP_004 umsetzen. Tabelle # : TAB_ILFERP_004 – E-Rezept durch Verordnenden löschen Name E-Rezept durch Verordnenden löschen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter verordnende LEI Vorbedingung Der Nutzer hat ein E-Rezept zum Löschen markiert und das Löschen bestätigt. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Das ausgewählte E-Rezept ist vom E-Rezept-Fachdienst unwiederbringlich gelöscht. Standardablauf Task-ID und AccessCode des E-Rezepts bestimmen E-Rezept auf E-Rezept-Fachdienst löschen E-Rezept-Token in PS löschen
</requirement>

<!-- A_19239-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-129" title="PS verordnende LEI: E-Rezept löschen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden löschen" für das zu löschende E-Rezept die HTTP-Operation POST /TASK/&lt;id&gt;/$abort mit ACCESS_TOKEN im Authorization-Header Task-ID in URL &lt;id&gt; AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac= ausführen.
</requirement>

<!-- A_19240 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-130" title="PS verordnende LEI: E-Rezept löschen - E-Rezept-Token löschen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Konformitätsbestätigung"/>
    </actor>
     Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden löschen" für das zu löschende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept löschen" die Task-ID und den AccessCode im PS löschen.
</requirement>
