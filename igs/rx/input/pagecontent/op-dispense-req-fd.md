Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$dispense`.

### Anforderungen aus der Core Spezifikation

Für diese Seite bestehen keine Anforderungen aus der Core Spezifikation.

### Modulspezifische Anforderungen

<!-- A_24279 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-36" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Rollenprüfung Abgebender stellt Dispensierinformationen bereit" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense auf den in der URL referenzierten /Task/&lt;id&gt; sicherstellen, dass ausschließlich abgebende Leistungserbringer in einer der Rollen
        <ul> 
        <li>oid_oeffentliche_apotheke</li>
        <li>oid_krankenhausapotheke</li>
        </ul>
        die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen die Operation mit dem folgenden Fehler:
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
    abbrechen, damit Dispensierinformationen nicht durch einen Unberechtigten eingestellt werden kann.
</requirement>

<!-- A_24280 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-37" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Prüfung Secret" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL- Parameters die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_SECRET_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<!-- A_24298 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-38" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Prüfung Status" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense auf Task.status = in-progress prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:
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

<!-- A_24281-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-39" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Schemaprüfung MedicationDispense" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense das im http-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_DispenseOperation_Input prüfen, insbesondere bei der darin enthaltenen MedicationDispense: die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und ob die Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier übereinstimmt und im Fehlerfall die Operation mit dem folgenden Fehler:
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

<!-- A_26482 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-40" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Überschreiben vorheriger MedicationDispenses" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn bereits bestehende MedicationDispense(s) zum E-Rezept vorhanden sind, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.
</requirement>

<!-- A_28667 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-41" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - MedicationDispense speichern" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense eine oder mehrere vom Client bereitgestellten MedicationDispenses, sowie die in MedicationDispense.medication referenzierte Medication, speichern.
</requirement>

<!-- A_25933 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-43" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Daten Medikationsliste bereitstellen (Dispensierinformationen)" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense , wenn die übermittelten Dispensierinformationen sich von den ggf. bereits zuvor zum Task gespeicherten Dispensierinformationen unterscheiden und die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "in Progress" für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>

<!-- A_24285-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-44" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Zeitstempel MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern.
</requirement>

<!-- A_28410 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-45" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Telematik-ID der abgebenden LEI speichern" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$dispense für den referenzierten Task die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen können.
</requirement>

<!-- A_28130 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-46" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$dispense bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.dispense" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

<!-- A_24284 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-ERP-47" title="TI-Flow-Fachdienst - Dispensierinformationen bereitstellen - Keine Statusänderung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
        Der TI-Flow-Fachdienst DARF bei der Bereitstellung von Dispensierinformationen mittels POST /Task/&lt;id&gt;/$dispense den Status des Task bei Aufrufen der POST /Task/&lt;id&gt;/$dispense Operation NICHT verändern.
</requirement>
