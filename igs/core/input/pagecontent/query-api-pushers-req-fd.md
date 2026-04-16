Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den pusher-Endpunkt.

<!-- A_28114 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-268" title="TI-Flow-Fachdienst - unzulässige Operationen Pushers" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Pushers mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden und mit mit dem HTTP-Code "405 - Method Not Allowed" abbrechen, damit keine unzulässigen Operationen ausgeführt werden können.
</requirement>

<!-- A_28111 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-269" title="TI-Flow-Fachdienst - Push Notifications - Pushers - OpenApi_Notification_Fachdienst" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS die API mit den Endpunkten GET /pushers und POST /pushers/set gemäß [OpenAPI_FD] bereitstellen.
</requirement>


### GET /pushers
Mit der Operation GET /pushers können alle für den Nutzer registrierten FdV-Instanzen abgefragt werden.

<!-- A_28113 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-270" title="TI-Flow-Fachdienst - Push Notifications - App-Registrierungen abrufen - Rollenprüfung" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /pushers die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, und bei Abweichungen mit dem folgenden Fehler:
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

<!-- A_28530 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-271" title="TI-Flow-Fachdienst - Push Notifications - App-Registrierungen abrufen - Filter auf KVNR des Versicherten" version="0">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /pushers die dem Versicherten zugeordneten Pusher-Ressourcen anhand der KVNR des Versicherten aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, damit ausschließlich Versicherte ihre eigenen App-Registrierungen einsehen können.
</requirement>

### POST /pushers/set

<!-- A_28112 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-272" title="TI-Flow-Fachdienst - Push Notifications - App-Registrierungen - Rollenprüfung" version="1">
  <meta lockversion="false"/>
  <actor name="TI-Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /pushers/set die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, und bei Abweichungen mit dem folgenden Fehler:
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