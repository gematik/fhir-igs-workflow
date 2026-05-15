### Anforderungen der Schnittstelle aus diesem Modul

<!-- A_27068 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-38" title="TI-Flow-Fachdienst - Task schließen - EU - Rollenprüfung" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/&lt;id&gt;/$eu-close sicherstellen, dass ausschließlich Nutzer in der Rolle: oid_ncpeh, die Operation am Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader Authorization feststellen, und bei Abweichungen die Operationmit dem folgenden Fehler:
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
    abbrechen, damit der E-Rezept-Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.
</requirement>

<!-- A_27069 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-39" title="TI-Flow-Fachdienst - Task schließen - EU - Schemaprüfung" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/&lt;id&gt;/$eu-close durch den NCPeH-FD das im http-Body des Requests enthaltene Parameter-Objekt gegen das Profil [GEM_ERP_PR_PAR_EU_CloseOperation_Input] prüfen und im Fehlerfall die Operation mit dem folgenden Fehler:
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
    abbrechen.
</requirement>

<!-- A_27070 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-40" title="TI-Flow-Fachdienst - Task schließen - EU - Prüfung Einwilligung für KVNR" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/&lt;id&gt;/$eu-close durch den NCPeH-FD sicherstellen, dass für die in Parameters.parameter:requestData.part:kvnr übermittelte KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = EUDISPCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_CONSENT_MISSING</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit nur Dispensierinformationen für Versicherte übermittelt werden, die eine Einwilligung erteilt haben.
</requirement>

<!-- A_27071 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-41" title="TI-Flow-Fachdienst - Task schließen - EU - Prüfung Zugriffsberechtigung" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/&lt;id&gt;/$eu-close durch den NCPeH-FD sicherstellen, dass zu dem in Parameters.parameter:requestData.part:kvnr, Parameters.parameter:requestData.part:accessCode und Parameters.parameter:requestData.part:countryCode übermittelte Tripple von KVNR, Zugriffs- und Ländercode eine zeitliche gültige Zugriffsberechtigung im TI-Flow-Fachdienst existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_ACCESS_PERMISSION_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit nur Dispensierinformationen übermittelt werden, wenn eine gültige Zugriffsberechtigung vorliegt.
</requirement>

<!-- A_27072 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-42" title="TI-Flow-Fachdienst - Task schließen - EU - Statusprüfung" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/&lt;id&gt;/$eu-close durch den NCPeH-FD sicherstellen, dass Task.status = in-progress ist und bei Ungleichheit die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_TASK_STATUS_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Task has invalid status.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_27074 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-43" title="TI-Flow-Fachdienst - Task schließen - EU - Zeitstempel MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/&lt;id&gt;/$eu-close durch den NCPeH-FD sicherstellen, dass der Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) angelegt und gespeichert wird.
</requirement>

<!-- A_27075 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-44" title="TI-Flow-Fachdienst - Task schließen - EU - Status beenden" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/&lt;id&gt;/$eu-close durch den NCPeH-FD sicherstellen, dass die zulässige Beendigung eines übermittelten Tasks im Status Task.status = completed vollzogen wird, damit der Workflow für den Versicherten als beendet und das E-Rezept somit als eingelöst dargestellt wird.
</requirement>

<!-- A_28206 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-45" title="TI-Flow-Fachdienst - Task schließen - EU - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/&lt;id&gt;/$eu-close durch den NCPeH-FD bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.eu.prescription.close" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>