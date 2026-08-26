Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das PVS für die Nutzung der Operation `$abort`.

Das PS der verordnenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Löschen auf dem Fachdienst auszuwählen.

Das PS der verordnenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept gelöscht werden soll und die Möglichkeit geben, das Löschen abzubrechen.

<!-- A_19239-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A314" title="PS verordnende LEI: E-Rezept löschen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_verordnend" description="PS-Schnittstelle für TI-Flow/verordnendes System">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden löschen" für das zu löschende E-Rezept die HTTP-Operation POST /TASK/&lt;id&gt;/$abort mit 
    <ul>
        <li>Task-ID in URL &lt;id&gt; </li>
        <li>AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac= </li>
    </ul>
    ausführen.
</requirement>

<!-- A_19240 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A315" title="PS verordnende LEI: E-Rezept löschen - E-Rezept-Token löschen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_verordnend" description="PS-Schnittstelle für TI-Flow/verordnendes System">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
     Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden löschen" für das zu löschende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept löschen" die Task-ID und den AccessCode im PS löschen.
</requirement>
