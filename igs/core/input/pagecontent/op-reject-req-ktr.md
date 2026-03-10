Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$reject`.


<!-- A_19249 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-282" title="CS Kostenträger: Verordnung durch Abgebenden zurückgeben" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem MUSS den Anwendungsfall "UC 4.2 - E-Rezept durch Abgebenden zurückgeben" gemäß TAB_ILFERP_008 umsetzen.
  <table>
    <tr> 
		<th>Name</th>
		<th>Verordnung durch Abgebenden zurückgeben</th>
	</tr>
	<tr> 
		<td>Auslöser</td>
		<td>Aufruf des Anwendungsfalls in der UI oder automatisierte Verarbeitung</td>
	</tr>
    <tr> 
		<td>Akteur</td>
		<td>Mitarbeiter des Kostenträgers</td>
	</tr>
    <tr> 
		<td>Vorbedingung</td>
		<td>
            <ul>
                <li>Der Kostenträger hat die Verordnung vom Fachdienst heruntergeladen und es befindet sich im Status "in-progress".</li>
                <li>Der Nutzer hat die Verordnung zum Zurückgeben markiert und das Zurückgeben bestätigt.</li>
                <li>Das Clientsystem hat sich gegenüber der TI authentisiert.</li>
            </ul>
        </td>
	</tr>
    <tr> 
		<td>Nachbedingung</td>
		<td>Der Workflow der Verordnung hat auf dem Fachdienst den Status "ready"</td>
	</tr>
    <tr> 
		<td>Standardablauf</td>
		<td>
            <ol>
                <li>Task-ID und Geheimnis der Verordnung bestimmen</li>
                <li>Verordnung Status auf Fachdienst ändern</li>
                <li>Verordnung und E-Rezept-Token im CS löschen</li>
            </ol>
        </td>
	</tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>TAB_ILFERP_008 - Verordnung durch Clientsystem zurückgeben</figcaption></div>
</requirement>

<!-- A_19250 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-283" title="CS Kostenträger: Verordnung zurückgeben - Statusrequest" version="0">
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-284" title="CS Kostenträger: Verordnung zurückgeben - Verordnung löschen" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Eine Verordnung zurückweisen" die Daten zu Verordnung, E-Rezept-Token und das Geheimnis im CS löschen.
</requirement>