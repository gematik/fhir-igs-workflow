Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$reject`.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Zurückgeben auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept zurückgegeben werden soll und die Möglichkeit geben, das Zurückgeben abzubrechen.

<!-- A_19250 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-254" title="PS abgebende LEI: E-Rezept zurückgeben - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden zurückgeben" für das zurückzugebende E-Rezept die HTTP-Operation POST /Task/&lt;id&gt;/$reject mit 
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>Geheimnis in URL-Parameter ?secret=</li>
  </ul>
  ausführen.
</requirement>

<!-- A_19251 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-255" title="PS abgebende LEI: E-Rezept zurückgeben - E-Rezept löschen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept zurückweisen" die Daten zum E-Rezept, E-Rezept-Token und das Geheimnis im PS löschen.
</requirement>