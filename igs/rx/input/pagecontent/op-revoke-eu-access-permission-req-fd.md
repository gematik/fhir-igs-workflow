### Modulspezifische Anforderungen

#### Anforderungen zur Validierung

<requirement conformance="SHALL" title="TI-Flow-Fachdienst - Zugriffsberechtigung löschen - Ausführung der OperationDefinition" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS die Operation <i>EU-Zugriffsberechtigung löschen</i> gemäß der FHIR OperationDefinition <a href="./OperationDefinition-revoke-eu-access-permission.html">RevokeEUAccessPermission</a> ausführen. Die Verarbeitung und Validierung der Daten MUSS entsprechend den in der OperationDefinition festgelegten Regeln und Strukturen erfolgen und bei Abweichung die Operation mit folgendem Fehler:
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

#### Anforderungen zur Geschäftslogik

<!-- A_27085 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A279" title="TI-Flow-Fachdienst - Zugriffsberechtigung löschen - Löschen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission den zeta-user-info.identifier des Nutzers (KVNR) bestimmen und, falls vorhanden, zu dieser KVNR gespeicherte Zugriffsberechtigungen löschen.
</requirement>

