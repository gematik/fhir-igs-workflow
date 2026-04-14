### Anforderungen aus der Core Spezifikation

{% include core.query-api-task-req-fd.md %}

### Modulspezifische Anforderungen


#### PATCH /Task

<!-- A_27551 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-21" title="TI-Flow-Fachdienst -Task markieren -Versicherter - FHIR-Validierung Parameters" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten auf die Ressource übertragene Parameters Ressource gegen das FHIR-Profil GEM_ERPEU_PR_PAR_PATCH_Task_Input prüfen und bei Nicht-Konformität die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>400 - Bad Request</td>
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
            <td>SVC_VALIDATION_FAILED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>FHIR Profile Validation Failed</td>
        </tr>
    </table> 
    abbrechen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst akzeptiert werden.
</requirement>

<!-- A_28500 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-22" title="TI-Flow-Fachdienst -Task markieren -Versicherter - nur einlösbare E-Rezepte" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten prüfen, ob der adressierte Task in Task.extension:eu-isRedeemableByProperties.valueBoolean = true gesetzt ist und anderfalls mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>409 - Conflict</td>
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
            <td>TIFLOW_XBORDER_NOT_ACTIVATED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_27552 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-23" title="TI-Flow-Fachdienst -Task markieren -Versicherter - Änderung Markierung Task Ressource" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten, den im Parameter `eu-isRedeemableByPatientAuthorization` enthaltenen boolschen Wert in `Task.extension:eu-isRedeemableByPatientAuthorization.valueBoolean` setzen.
</requirement>
