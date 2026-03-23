Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$reject`.

<!-- A_19250 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-344" title="CS Kostenträger: Verordnung zurückgeben - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für die zurückzugebende Verordnung die HTTP-Operation POST /Task/&lt;id&gt;/$reject mit 
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>Geheimnis in URL-Parameter ?secret=</li>
  </ul>
  ausführen.
</requirement>

<!-- A_19251 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-345" title="CS Kostenträger: Verordnung zurückgeben - Verordnung löschen" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Eine Verordnung zurückweisen" die Daten zu Verordnung, E-Rezept-Token und das Geheimnis im CS löschen.
</requirement>