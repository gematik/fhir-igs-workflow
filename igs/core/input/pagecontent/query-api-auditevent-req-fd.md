<!--> FD-Anforderungen: Query API AuditEvent -->

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die AuditEvent-Query-Endpunkte.

<!-- A_19402 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-135" title="TI-Flow-Fachdienst - unzulässige Operationen AuditEvent" version="1">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource AuditEvent mittels der HTTP-Operationen PUT, PATCH, HEAD, DELETE und POST unterbinden und mit mit dem folgenden Fehler:
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
  abbrechen, damit keine unzulässigen Operationen auf den Protokolldaten ausgeführt werden können.
</requirement>
<!-- ToDo Hendre: Fehlercode einfügen -->

### GET /AuditEvent

<!-- A_19395 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-136" title="TI-Flow-Fachdienst - AuditEvent lesen - Rollenprüfung" version="1">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent und auf einen konkreten über &lt;id&gt; adressierten /AuditEvent/&lt;id&gt; sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen die Operation mit dem folgenden Fehler:
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
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit Protokolleinträge nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<!-- A_19396 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-137" title="TI-Flow-Fachdienst - AuditEvent lesen - Filter KVNR" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent die dem Versicherten zugeordneten AuditEvent-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in AuditEvent.entity.name die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen Protokolleinträge einsehen können.
</requirement>

<!-- A_19397 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-138" title="TI-Flow-Fachdienst - AuditEvent lesen - Rückgabe im Bundle" version="0">
  <meta lockversion="false"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /AuditEvent die Ergebnisliste der AuditEvent-Ressourcen bei mehr als einem Eintrag als Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in das Zugriffsprotokoll erhält.
</requirement>
