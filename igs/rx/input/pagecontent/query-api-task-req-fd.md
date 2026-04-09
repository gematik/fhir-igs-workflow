Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

{% include core.query-api-task-req-fd.md %}

### Modulspezifische Anforderungen

#### GET /Task

##### Workflowspezifische Anforderungen

<!-- A_21360-01 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-34" title="TI-Flow-Fachdienst - Liste Task abrufen - Flowtype 169 / 209 - Versicherter keine Einlöseinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst DARF den AccessCode beim Zugriff durch den Versicherten NICHT an das E-Rezept-Frontend des Versicherten herausgeben, wenn der Flowtype des Tasks den Wert für die Workflowsteuerung durch Leistungserbringer enthält (169, 209).
</requirement>

<!-- ToDo: Dubliziern A_21360-01 für einzelabruf -->

#### GET /Task/<id>

##### Workflowspezifische Anforderungen

<!-- A_26148 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-35" title="TI-Flow-Fachdienst - Task abrufen - Flowtype 169/209 - Nicht verfügbar bei KVNR-Mismatch" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; durch einen Versicherten, wenn Task.extension:flowType = 169 oder 209 und die KVNR des Aufrufenden (KVNR des ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests) ungleich der KVNR in Task.for ist, die Operation mit dem folgenden Fehler:
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
            <td>SVC_IDENTITY_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)</td>
        </tr>
    </table> 
    abbrechen.
</requirement>
