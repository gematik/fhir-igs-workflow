Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$reject`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch. 

<!-- A_19171-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-39" title="TI-Flow-Fachdienst - Task zurückweisen - Prüfung Secret" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:
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
            <td>forbidden</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_SECRET_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td></td>
        </tr>
    </table> 
    abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<!-- A_19171-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-40" title="TI-Flow-Fachdienst - Task zurückweisen - Prüfung Status" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject den im referenzierten Task gespeicherten Status Task.status prüfen und, wenn Task.status ungleich "in-progress" ist, die Operation mit dem folgenden Fehler:
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>412 - Precondition Failed</td>
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
    abbrechen, damit die Verordnung nur zurückgegeben werden kann, wenn sich die Verordnung in Belieferung befindet.
</requirement>

<!-- A_19172-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-41" title="TI-Flow-Fachdienst - Task zurückweisen - Secret löschen und Status setzen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject die externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret löschen und den Status des referenzierten Tasks auf Task.status = ready setzen, damit nachfolgende Zugriffe auf diesen Datensatz durch Berechtigte in Kenntnis des AccessCodes erfolgen können.
</requirement>

<!-- A_24175 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-42" title="TI-Flow-Fachdienst - Task zurückweisen - Telematik-ID der abgebenden LEI löschen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI löschen.
</requirement>

<!-- A_28128 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-43" title="TI-Flow-Fachdienst - Task zurückweisen - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.reject" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

