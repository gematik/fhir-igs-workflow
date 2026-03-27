### Anforderungen der Schnittstelle aus diesem Modul

<!-- A_27088 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-56" title="TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen, damit eine Zugriffsberechtigte nicht durch Unberechtigte erteilt werden kann.
</requirement>

<!-- A_27089 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-57" title="TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Einwillung für KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission die KVNR des Versicherten im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = EUDISPCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_CONSENT_REQUIRED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Das Erstellen einer Zugriffsberechtigung ist erst zulässig, wenn eine Einwilligung durch den Nutzer zum Einlösen von E-Rezepten im europäischen Ausland erteilt wurde.</td>
        </tr>
    </table> 
    abbrechen, damit nur Versicherte eine Zugriffsberechtigung schreiben, die eine Einwilligung erteilt haben.
</requirement>

<!-- A_27090 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-58" title="TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Ländercode" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, dass der im Request übermittelte Ländercode (Parameters.parameter:countryCode) einem Land entspricht, welches die Anwendung ePrescription/eDispensation Szenario Land A unterstützt und bei fehlschlagender Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_XBORDER_COUNTRY_CODE_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Für das angefragte Land ist Einlösen von E-Rezepten nicht möglich.</td>
        </tr>
    </table> 
    abbrechen, damit der Versicherte nur für zulässige europäische Länder eine Zugriffsberechtigung erteilt.
</requirement>

<!-- A_27091 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-59" title="TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Prüfung Zugriffscode" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, dass der im Request übermittelte Zugriffscode (Parameters.parameter:accessCode) das korrekte Format hat und bei fehlschlagender Prüfung die Operation mit dem folgenden Fehler:
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
            <td>TIFLOW_ACCESS_CODE_INVALID</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Der übermittelte Zugriffscode ist nicht zulässig.</td>
        </tr>
    </table> 
    abbrechen.
</requirement>

<!-- A_27092 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-60" title="TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Löschen bestehender Zugriffsberechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission prüfen, ob für die im Request übermittelte KVNR Zugriffsberechtigungen gespeichert sind und falls ja, diese löschen.
</requirement>

<!-- A_27093 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-61" title="TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Neue Zugriffsberechtigung speichern" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission mit dem im Request übermittelten KVNR, Zugriffscode und Ländercode eine neue Zugriffsberechtigung speichern und den Wert valid_until auf aktuellen Zeitpunkt + 1h setzen.
</requirement>

<!-- A_27094 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-62" title="TI-Flow-Fachdienst - Zugriffsberechtigung schreiben - Response" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS im Response zu einem Aufruf der HTTP-POST-Operation auf den Endpunkt /$grant-eu-access-permission eine Ressource des Profils [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] mit den Daten des gespeicherten Datensatz zur Zugriffsberechtigung übermitteln.
</requirement>




<!-- ToDo: Die Afo soll an einen geeigneten Ort verschoben werden. -->

<!-- A_27083 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-63" title="TI-Flow-Fachdienst - Zugriffsberechtigung - periodische Bereinigung" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS periodisch prüfen, dass keine zeitlich ungültigen Zugriffsberechtigungen gespeichert sind.
</requirement>
