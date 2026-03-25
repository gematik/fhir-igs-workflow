
Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

{% include core.op-close-req-fd.md %}

### Modulspezifische Anforderungen


<!-- A_19230-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-3" title="TI-Flow-Fachdienst - Task schliessen - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/&#60;id&#60;  die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
  <ul>
    <li>oid_kostentraeger</li>
  </ul>
  die Operation am Fachdienst aufrufen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.
</requirement>

</br>

  <!-- A_26003-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-4" title="TI-Flow-Fachdienst - Task schließen - Flowtype 162 - Profilprüfung MedicationDispense" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/&#60;id&#62; mit Flowtype 162 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht. Andernfalls ist die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_MEDICATION_DISPENSE_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig.</td>
        </tr>
    </table>
  abzubrechen.
</requirement>