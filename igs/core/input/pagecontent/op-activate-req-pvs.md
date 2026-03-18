{% assign use_cases = site.data['gen-use-cases'] %}

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.


<!-- A_19273-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-133" title="PS verordnende LEI: E-Rezept einstellen - Task auf Fachdienst aktivieren" version="0">
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

### Patientenausdruck

<!-- A_22503 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-134" title="PS verordnende LEI: E-Rezept einstellen - kein Patientenausdruck bei Fehler beim Aktivieren" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI DARF im Anwendungsfall "E-Rezept durch Verordnenden einstellen" NICHT einen Ausdruck für den Versicherten erstellen, wenn der E-Rezept-Fachdienst im Response der Operation POST /Task/&lt;id&gt;/$activate mit einem Fehler antwortet.
</requirement>

Für den Patientenausdruck gelten vorrangig die Regelungen zum Ausdruck eines E-Rezepts aus den Bundesmantelverträgen [BMV] und [BMV-Z].
<!-- ToDo: Können in den workflow-spezifischen Modulen weitere Hinweise geben? rx und diga haben unterschiedliche vorgaben durch die KBV -->

<!-- A_22423 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-372" title="PS verordnende LEI: E-Rezept einstellen - separater Patientenausdruck je Flowtype" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS sicherstellen, dass für jeden Flowtype ein separater Patientenausdruck erfolgt, sofern der Nutzer Verordnungen mit unterschiedlichen Flowtypes einstellt und für diese Patientenausdrucke erzeugen möchte.
</requirement>

<!-- A_19279 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-135" title="PS verordnende LEI: E-Rezept einstellen - E-Rezept-Token erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, einen E-Rezept-Token erstellen.
</requirement>

Für die Spezifikation des E-Rezept-Token siehe [gemSpec_DM_eRp#2.3].
<!-- ToDo: Referenz korrigieren -->

<!-- A_19280 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-136" title="PS verordnende LEI: E-Rezept einstellen - Datamatrix-Code erstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_verordnend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden einstellen", wenn ein Patientenausdruck erstellt werden soll, Datamatrix-Codes erstellen und für den Patientenausdruck verwenden.
</requirement>

Für die Spezifikation des Datamatrix-Code für E-Rezept-Token siehe [gemSpec_DM_eRp#2.3].
<!-- ToDo: Referenz korrigieren -->
