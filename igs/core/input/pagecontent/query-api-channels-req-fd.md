Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den channels-Endpunkt.

<!-- A_28121 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A55" title="TI-Flow-Fachdienst - unzulässige Operationen Channels" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Channels mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden und mit dem folgenden Fehler:
      <table id="error-code-json" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>405 - Method Not Allowed</td>
        </tr>
        <tr>
            <th>Error Code</th>
            <td>methodNotAllowed</td>
        </tr>
        <tr>
            <th>Error Details</th>
            <td>Die verwendete HTTP-Methode ist für diese Ressource nicht zulässig</td>
        </tr>
    </table> 
    abbrechen, damit keine unzulässigen Operationen ausgeführt werden können.
</requirement>

<!-- A_28117 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A56" title="TI-Flow-Fachdienst - Push Notifications - Channels- OpenApi_Notification_Fachdienst" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS die API mit den Endpunkten GET /channels, GET /channels/{pushkey} und POST /channels/{pushkey} gemäß [OpenAPI_FD] bereitstellen.
</requirement>

<!-- ToDo: [OpenAPI_FD] auflösen -->

### GET /channels
Mit der Operation GET /channels können die verfügbaren Channels abgefragt werden.

<!-- A_28118 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A57" title="TI-Flow-Fachdienst - Push Notifications - Channels abrufen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
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
    abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>

Mit der Operation GET /channels/{pushkey} können die Channels und deren Konfiguration für eine spezifische FdV-Instanz abgefragt werden.

<!-- A_28119 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A58" title="TI-Flow-Fachdienst - Push Notifications - Channels einer Instanz abrufen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels/{pushkey} die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
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
    abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>
<!-- ToDo Hendre: Warum lautet der FehlerCode bei vergleichbaren Afos TIFLOW_AUTH_ROLE_NOT_ALLOWED? -->


### POST /channels

<!-- A_28120 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A59" title="TI-Flow-Fachdienst - Push Notifications - Channels konfigurieren - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
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
    abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>
<!-- ToDo Hendre: Warum lautet der FehlerCode bei vergleichbaren Afos TIFLOW_AUTH_ROLE_NOT_ALLOWED? -->

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A430" title="TI-Flow-Fachdienst - Push Notifications - Channels konfigurieren - Schemavalidierung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} das Payload gegen das Schema in [OpenAPI_FD] validieren und bei Abweichungen mit dem folgenden Fehler:
      <table id="error-code-json" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>400 - Bad Request</td>
        </tr>
        <tr>
            <th>Error Code</th>
            <td>malformedRequest</td>
        </tr>
        <tr>
            <th>Error Details</th>
            <td>Ungültiger http-Request</td>
        </tr>
    </table> 
    abbrechen, damit kein Schadcode und keine "fachfremden" Daten in den TI-Flow-Fachdienst hochgeladen werden.
</requirement>