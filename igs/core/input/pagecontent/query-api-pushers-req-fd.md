Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den pusher-Endpunkt.

<!-- A_28114 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A268" title="TI-Flow-Fachdienst - unzulässige Operationen Pushers" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Pushers mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden und mit dem folgenden Fehler:
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

<!-- A_28111 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A269" title="TI-Flow-Fachdienst - Push Notifications - Pushers - OpenApi_Notification_Fachdienst" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS die API mit den Endpunkten GET /pushers und POST /pushers/set gemäß [OpenAPI_FD] bereitstellen.
</requirement>


### GET /pushers
Mit der Operation GET /pushers können alle für den Nutzer registrierten FdV-Instanzen abgefragt werden.

<!-- A_28113 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A270" title="TI-Flow-Fachdienst - Push Notifications - App-Registrierungen abrufen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /pushers die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, und bei Abweichungen mit dem folgenden Fehler:
      <table id="error-code-json" style="border: 1px solid black; border-collapse: collapse;">
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

<!-- A_28530 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A271" title="TI-Flow-Fachdienst - Push Notifications - App-Registrierungen abrufen - Filter auf KVNR des Versicherten" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /pushers die dem Versicherten zugeordneten Pusher-Ressourcen anhand des zeta-user-info.identifier des Nutzers (KVNR) identifizieren, damit ausschließlich Versicherte ihre eigenen App-Registrierungen einsehen können.
</requirement>

### POST /pushers/set

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A431" title="TI-Flow-Fachdienst - Push Notifications - App-Registrierung - Schemavalidierung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /pushers/set das Payload gegen das Schema in [OpenAPI_FD] validieren und bei Abweichungen mit dem folgenden Fehler:
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

<!-- A_28112 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A272" title="TI-Flow-Fachdienst - Push Notifications - App-Registrierung - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /pushers/set die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, und bei Abweichungen mit dem folgenden Fehler:
      <table id="error-code-json" style="border: 1px solid black; border-collapse: collapse;">
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

<!-- A_28674 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A419" title="TI-Flow-Fachdienst - Push Notifications - App-Registrierung - Zeitstempel ändern" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
    <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /pushers/set, wenn eine neue App-Registrierung angelegt wird, den aktuellen Zeitpunkt als Zeitstempel des Anlegens mit der App-Registrierung verknüpft speichern.
</requirement>