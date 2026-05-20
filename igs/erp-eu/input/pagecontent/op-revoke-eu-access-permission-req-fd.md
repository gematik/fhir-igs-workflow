### Anforderungen der Schnittstelle aus diesem Modul

<!-- A_27084 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-54" title="TI-Flow-Fachdienst - Zugriffsberechtigung löschen - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
    <ul>
    <li>oid_versicherter</li>
    </ul>
    die Operation am TI-Flow-Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:
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
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit die Information zur Zugriffsberechtigung nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<!-- A_27085 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-55" title="TI-Flow-Fachdienst - Zugriffsberechtigung löschen - Löschen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission den zeta-user-info.identifier des Nutzers (KVNR) bestimmen und, falls vorhanden, zu dieser KVNR gespeicherte Zugriffsberechtigungen löschen.
</requirement>
