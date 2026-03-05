{% assign use_cases = site.data['use-cases'] %}

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.

<br>

<!-- Ablaufdiagramm Anwendungsfall -->
{% assign use_case = use_cases | where: "title", "UC 4.1 - E-Rezept durch Abgebenden abrufen" | first %}

{% include use-case-diagram.html diagram=use_case.diagram title=use_case.title %}

<br>

<!-- A_19272 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-301" title="PS verordnende LEI: E-Rezept durch Verordnenden einstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Konformitätserklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS den Anwendungsfall "UC 2.3 - E-Rezept einstellen" gemäß TAB_ILFERP_003 umsetzen. 
  <table>
    <tr> 
		<th>Name</th>
		<th>E-Rezept durch Verordnenden einstellen</th>
	</tr>
	<tr> 
		<td>Auslöser</td>
		<td>
            <ul>
                <li>Aufruf des Anwendungsfalls in der GUI</li>
                <li>kann durch "E-Rezept durch Verordnenden erstellen" getriggert werden</li>
            </ul>
        </td>
	</tr>
    <tr> 
		<td>Akteur</td>
		<td>Leistungserbringer, Mitarbeiter der verordnenden LEI</td>
	</tr>
    <tr> 
		<td>Vorbedingung</td>
		<td>
            <ul>
                <li>Das E-Rezept wurde erstellt. (Anwendungsfall "E-Rezept erstellen"). Es stehen ein QES-signiertes E-Rezept-Bundle als PKCS#7-Datei bereit.</li>
                <li>Die LEI hat sich gegenüber der TI authentisiert.</li>
            </ul>
        </td>
	</tr>
    <tr> 
		<td>Nachbedingung</td>
		<td>Das E-Rezept ist auf dem E-Rezept-Fachdienst gespeichert. Es kann durch den Versicherten oder einen Apotheker in Kenntnis der Einlöseinformationen (Task-ID + AccessCode) abgerufen werden. Der Workflow hat den Status "ready".</td>
	</tr>
    <tr> 
		<td>Standardablauf</td>
		<td>
            <ol>
                <li>Task auf dem E-Rezept-Fachdienst aktivieren</li>
                <li>
                    optional, wenn der Patientenausdruck ausgedruckt werden soll:
                    <ol>
                        <li>E-Rezept-Token erzeugen</li>
                        <li>Patientenausdruck erstellen</li>
                    </ol>
                </li>
            </ol>
        </td>
	</tr>
  </table>
  <div><figcaption><strong>Tabelle: </strong>TAB_ILFERP_003 - E-Rezept durch Verordnenden einstellen</figcaption></div>
</requirement>

<!-- A_19273-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-302" title="PS verordnende LEI: E-Rezept einstellen - Task auf Fachdienst aktivieren" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Konformitätserklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen" für das E-Rezept die HTTP-Operation POST /Task/&lt;id&gt;/$activate mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>AccessCode in X-AccessCode - Header oder URL-Parameter ?ac=</li>
    <li>QES signiertes E-Rezept-Bundle im http-Body des Aufrufs als data</li>
  </ul>
  ausführen.
</requirement>

Hinweis: Für den Fall, dass das Clientsystem beim Aufruf der Operation keinen Response erhält, soll der Aufruf wiederholt werden. Wenn im Response des zweiten Aufrufs ein
Fehler 403 mit dem OperationOutcome "Task not in status draft but in status ready" zurückkommt, wurde der erste Aufruf bereits erfolgreich durch den E-Rezept-Fachdienst verarbeitet. Wenn eine Response mit dem Status 200 zurückkommt, war der zweite Aufruf erfolgreich.

<!-- A_22503 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-303" title="PS verordnende LEI: E-Rezept einstellen - kein Patientenausdruck bei Fehler beim Aktivieren" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI DARF im Anwendungsfall "E-Rezept durch Verordnenden einstellen" NICHT einen Ausdruck für den Versicherten erstellen, wenn der E-Rezept-Fachdienst im Response der Operation POST /Task/&lt;id&gt;/$activate mit einem Fehler antwortet.
</requirement>

Für den Patientenausdruck gelten vorrangig die Regelungen zum Ausdruck eines E-Rezepts aus den Bundesmantelverträgen [BMV] und [BMV-Z].
<!-- ToDo: Können in den workflow-spezifischen Modulen weitere Hinweise geben? rx und diga haben unterschiedliche vorgaben durch die KBV -->

<!-- A_19279 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-304" title="PS verordnende LEI: E-Rezept einstellen - E-Rezept-Token erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, einen E-Rezept-Token erstellen.
</requirement>

Für die Spezifikation des E-Rezept-Token siehe [gemSpec_DM_eRp#2.3].
<!-- ToDo: Referenz korrigieren -->

<!-- A_19280 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-305" title="PS verordnende LEI: E-Rezept einstellen - Datamatrix-Code erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, Datamatrix-Codes erstellen und für den Patientenausdruck verwenden.
</requirement>

Für die Spezifikation des Datamatrix-Code für E-Rezept-Token siehe [gemSpec_DM_eRp#2.3].
<!-- ToDo: Referenz korrigieren -->
