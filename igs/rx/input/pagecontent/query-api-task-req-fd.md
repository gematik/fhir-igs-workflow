Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### GET /Task (Liste)

##### Workflowspezifische Anforderungen

<!-- A_21360-01 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-A34" title="TI-Flow-Fachdienst - Liste Task abrufen - Flowtype 169 / 209 - Versicherter keine Einlöseinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst DARF NICHT beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task durch einen Versicherten, im Response für Tasks mit Task.extension:flowType = 169 oder 209 den AccessCode übermitteln.
</requirement>

#### GET /Task/&#60;id&#62; (Einzelne Verordnung)

##### Workflowspezifische Anforderungen

<!-- A_26148 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A35" title="TI-Flow-Fachdienst - Task abrufen - Flowtype 169/209 - Nicht verfügbar bei KVNR-Mismatch" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; durch einen Versicherten, wenn Task.extension:flowType = 169 oder 209 und der zeta-user-info.identifier des Nutzers (KVNR) ungleich der KVNR in Task.for ist, die Operation mit dem folgenden Fehler:
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

<!-- A_21360-01 -->
<requirement conformance="SHALL NOT" key="" title="TI-Flow-Fachdienst - Task abrufen - Flowtype 169/209 - Versicherter keine Einlöseinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst DARF NICHT beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; durch einen Versicherten, wenn Task.extension:flowType = 169 oder 209 ist, im Response den AccessCode zum Task übermitteln.
</requirement>

#### PATCH /Task

<!-- A_27551 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A244" title="TI-Flow-Fachdienst - Task markieren - Versicherter - FHIR-Validierung Parameters" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
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
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A245" title="TI-Flow-Fachdienst - Task markieren - Versicherter - nur einlösbare E-Rezepte" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
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
            <td>TIFLOW_EREZEPT_NOT_ACTIVATED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_27552 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A246" title="TI-Flow-Fachdienst - Task markieren - Versicherter - Änderung Markierung Task Ressource" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über &lt;id&gt; adressierte /Task/&lt;id&gt; Ressource durch einen Versicherten, den im Parameter `eu-isRedeemableByPatientAuthorization` enthaltenen boolschen Wert in `Task.extension:eu-isRedeemableByPatientAuthorization.valueBoolean` setzen.
</requirement>
