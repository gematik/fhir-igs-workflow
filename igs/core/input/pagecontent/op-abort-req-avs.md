Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$abort`.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Löschen auf dem Fachdienst auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept gelöscht werden soll, und die Möglichkeit geben, das Löschen abzubrechen.

<!-- A_19244 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A171" title="PS abgebende LEI: E-Rezept löschen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
    Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden löschen" für das zu löschende E-Rezept die HTTP-Operation POST /Task/&lt;id&gt;/$abort mit 
    <ul>
        <li>Task-ID in URL &lt;id&gt;</li>
        <li>Geheimnis in URL Parameter ?secret=</li> 
    </ul>
    ausführen.
</requirement>

<!-- A_19245 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A172" title="PS abgebende LEI: E-Rezept löschen - E-Rezept-Token löschen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Konformitätsbestätigung">funkt. Eignung: Konformitätsbestätigung</testProcedure>
    </actor>
     Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden löschen" für das zu löschende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept löschen" die Daten zum E-Rezept-Token und das Geheimnis im PS löschen.
</requirement>
