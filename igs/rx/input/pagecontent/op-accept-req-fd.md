Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$accept`.

### Anforderungen aus der Core Spezifikation

{% include core.op-accept-req-fd.md %}

### Modulspezifische Anforderungen

<!-- A_19166-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-104" title="TI-Flow-Fachdienst - Task akzeptieren - Flowtype 160/166/169/200/209 - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle
    <ul>
      <li>oid_oeffentliche_apotheke</li> 
      <li>oid_krankenhausapotheke</li>
    </ul>
    die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_AUTH_ROLE_NOT_ALLOWED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abrechen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden können.
</requirement>

<!-- A_22635-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-105" title="TI-Flow-Fachdienst - Task akzeptieren - Mehrfachverordnung - Beginn Einlösefrist prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_EREZEPT_MVO_NOT_VALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Teilverordnung zur Mehrfachverordnung %1 ist ab %2 einlösbar.</td>
        </tr>
    </table> 
    abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zu einem späteren Zeitpunkt als das aktuelle Datum liegt, da Teilverordnungen von Mehrfachverordnungen erst ab Beginn der Einlösefrist abgerufen werden dürfen. Im Falle dieses Fehlers ist im OperationOutcome des Response der Beginn der Einlösefrist wie folgt anzugeben: "Teilverordnung zur Mehrfachverordnung &lt;MVO Referenz&gt; ist ab &lt;Datum&gt; einlösbar.", wobei &lt;MVO Referenz&gt; der Wert MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value sowie &lt;Datum&gt; der Wert MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start im Format "dd.mm.yyyy" ist.
</requirement>

<!-- A_22110-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-106" title="TI-Flow-Fachdienst - Task akzeptieren - Coverage PKV - Einwilligung Abrechnungsinformation ermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept, wenn der Verordnungsdatensatz Coverage.type.coding.code = "PKV" enthält und für die KVNR des begünstigten Versicherten (Task.for) eine Consent Ressource mit Consent.patient.identifier = KVNR und Consent.category.coding.code = "CHARGCONS" existiert, das Response Bundle um die Consent Ressource ergänzen, um der abgebenden LEI die Information zu übermitteln, dass der Versicherte eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem TI-Flow-Fachdienst erteilt hat.
</requirement>