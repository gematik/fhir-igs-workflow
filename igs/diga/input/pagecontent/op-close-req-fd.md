
Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gematik.de/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/op-close-req-fd.html)

### Modulspezifische Anforderungen

#### Anforderungen zur Validierung



#### Anforderungen zur Geschäftslogik

<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A137" title="TI-Flow-Fachdienst - Task schließen - Flowtype 162 - Ausführung der OperationDefinition" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS die Operation <i>Task schließen</i> gemäß der FHIR OperationDefinition <a href="./OperationDefinition-tiflow-diga-close-op.html">TIFlow-DIGA-OP-Close</a> ausführen. Die Verarbeitung und Validierung der Daten MUSS entsprechend den in der OperationDefinition festgelegten Regeln und Strukturen erfolgen und bei Abweichung die Operation mit folgendem Fehler:
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
   abbrechen.
</requirement>

<!-- E-Rezept_26_2 C_12832 -->
<!-- A_28129-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-A136" title="TI-Flow-Fachdienst - Task schließen - Flowtype 162 - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 162 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$close, wenn eine MedicationDispense Ressource übermittelt wird und die Operation erfolgreich abgeschlossen werden kann, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.close" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>