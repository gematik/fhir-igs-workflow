
Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gematik.de/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/op-close-req-fd.html)

### Modulspezifische Anforderungen


<!-- A_19230-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A3" title="TI-Flow-Fachdienst - Task schliessen - Flowtype 162 - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 162 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/&#60;id&#60; die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle
  <ul>
    <li>oid_kostentraeger</li>
  </ul>
  die Operation am Fachdienst aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:
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
            <td>-</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.
</requirement>

</br>

  <!-- A_26003-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A4" title="TI-Flow-Fachdienst - Task schließen - Flowtype 162 - Profilprüfung MedicationDispense" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 162 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/&#60;id&#62; sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht und anderenfalls die Operation mit dem folgenden Fehler:
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
    abbrechen.
</requirement>

#### Anforderungen zur Validierung

<requirement conformance="SHALL" title="TI-Flow-Fachdienst - Task schließen - Flowtype 162 - Ausführung der OperationDefinition" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS die Operation <i>Task schließen</i> gemäß der FHIR OperationDefinition <a href="./OperationDefinition-tiflow-diga-close-op.html">TIFlow-DIGA-OP-Close</a> ausführen. Die Verarbeitung und Validierung der Daten MUSS entsprechend den in der OperationDefinition festgelegten Regeln und Strukturen erfolgen und bei Abweichung die Operation mit folgendem Fehler abbrechen:
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
            <td>FHIR Profile validation failed</td>
        </tr>
    </table>
</requirement>