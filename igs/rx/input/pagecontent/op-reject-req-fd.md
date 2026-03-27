Diese Seite enthält die workflowtyp-spezifischen normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

{% include core.op-reject-req-fd.md %}

### Modulspezifische Anforderungen

<!-- A_19170-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-13" title="TI-Flow-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Rollenprüfung" version="1">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  <ul>
    <li>oid_oeffentliche_apotheke</li>
    <li>oid_krankenhausapotheke</li>
  </ul>
  die Operation am Fachdienst aufrufen, und bei Abweichungen mit dem folgenden Fehler:
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
    abrechen, damit das E-Rezept nicht durch einen Unberechtigten zurückgewiesen werden kann.
</requirement>

<!-- A_24286-02 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-14" title="TI-Flow-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Dispensierinformationen löschen" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject die Dispensierinformationen, falls welche vorhanden sind, löschen: 
  <ul>
    <li>Medication, die aus der MedicationDispense referenziert wird --> löschen</li>
    <li>MedicationDispense zum dazugehörigen Task --> löschen</li>
    <li>Task.extension:lastMedicationDispense --> löschen</li>
  </ul>
</requirement>

<!-- A_25926 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-15" title="TI-Flow-Fachdienst - Task zurückweisen - Flowtype 160/169/200/209 - Löschmarkierungen Medikationsliste bereitstellen (Dispensierinformationen)" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$reject, wenn bereits Dispensierinformationen im TI-Flow-Fachdienst zum Task gespeichert wurden, die Daten für die Löschinformation dieser Dispensierinformationen für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>
