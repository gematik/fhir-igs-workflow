Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den channels-Endpunkt.

<!-- A_28121 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-55" title="TI-Flow-Fachdienst - unzulässige Operationen Channels" version="1">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Channels mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden und mit dem folgenden Fehler:
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>405 - Method Not Allowed</td>
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
            <td>SVC_METHOD_NOT_ALLOWED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>-</td>
        </tr>
    </table> 
  abbrechen, damit keine unzulässigen Operationen auf den Daten ausgeführt werden können.
</requirement>
<!-- ToDo Hendre: Fehlercode (Detailed code) einfügen Http Fehler 405 -->

<!-- A_28117 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-56" title="TI-Flow-Fachdienst - Push Notifications - Channels- OpenApi_Notification_Fachdienst" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS die API mit den Endpunkten GET /channels, GET /channels/{pushkey} und POST /channels/{pushkey} gemäß [OpenAPI_FD] bereitstellen.
</requirement>

<!-- ToDo: [OpenAPI_FD] auflösen -->

### GET /channels
Mit der Operation GET /channels können die verfügbaren Channels abgefragt werden.

<!-- A_28118 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-57" title="TI-Flow-Fachdienst - Push Notifications - Channels abrufen - Rollenprüfung" version="1">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Error Code</th>
            <td>invalidOid</td>
        </tr>
        <tr>
            <th>Error Details</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>

Mit der Operation GET /channels/{pushkey} können die Channels und deren Konfiguration für eine spezifische FdV-Instanz abgefragt werden.

<!-- A_28119 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-58" title="TI-Flow-Fachdienst - Push Notifications - Channels einer Instanz abrufen - Rollenprüfung" version="1">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Error Code</th>
            <td>invalidOid</td>
        </tr>
        <tr>
            <th>Error Details</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>
<!-- ToDo Hendre: Warum lautet der FehlerCode bei vergleichbaren Afos TIFLOW_AUTH_ROLE_NOT_ALLOWED? -->


### POST /channels

<!-- A_28120 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-59" title="TI-Flow-Fachdienst - Push Notifications - Channels konfigurieren - Rollenprüfung" version="1">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Error Code</th>
            <td>invalidOid</td>
        </tr>
        <tr>
            <th>Error Details</th>
            <td>-</td>
        </tr>
    </table> 
    abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>
<!-- ToDo Hendre: Warum lautet der FehlerCode bei vergleichbaren Afos TIFLOW_AUTH_ROLE_NOT_ALLOWED? -->