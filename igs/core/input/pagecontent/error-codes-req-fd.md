Diese Seite listet und beschreibt Anforderungen zu Fehlercodes und -konstellationen im TI-Flow-Fachdienst.

### Allgemeine Anforderungen zur Fehlerbehandlung

<!-- A_19514-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-340" title="TI-Flow-Fachdienst - Fehlerbehandlung - Http-Status-Codes" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf einer Operation im Http-Response-Header einen HTTP-Status-Codes gemäß [RFC7231] zurückgeben.
</requirement>


<!-- A_22103 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-341" title="TI-Flow-Fachdienst - Fehlerbehandlung - Fehlerdetails in OperationOutcome" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS im Fehlerfall (http-Statuscodes &gt;= 400) Hinweise zur Fehlerursache 
     
     <ul>
        <li>im der inneren http-Response-Body als FHIR-Ressource OperationOutcome bei FHIR-Schnittstellen</li>
        <li>im der inneren http-Response-Body in einer JSON-Struktur mit den Feldern `errorCode` und `errorDetail` bei non FHIR-Schnittstellen</li>
        <li>falls keine innere VAU-Response existiert, in einem "äußeren" http-Response-Body in einer JSON-Struktur mit den Feldern `errorCode` und `errorDetail`</li>
     </ul>
      
      an den Client zurückgeben, ohne Implementierungsdetails (z.B. kein Stacktrace) preiszugeben und dabei sicherstellen, dass personenbezogene oder medizinische Daten, falls für die qualifizierte Fehlerbeschreibung notwendig, ausschließlich in der VAU-verschlüsselten inneren http-Response übertragen werden.
</requirement>

### Anforderungen zu Endpunt-übergreifenden Fehlercodes

Der TI-Flow-Fachdienst muss allgemeine Anforderungen zu Fehlercodes umsetzen, um wiederkehrende Fehlerszenarien umzusetzen.

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-421" title="TI-Flow-Fachdienst - Fehlerbehandlung - HTTP Formatfehler" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS an den Schnittstellen prüfen, dass der HTTP-Request well-formed ist und andernfalls die Anfrage mit dem folgenden Fehler:
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
            <td>MSG_BAD_FORMAT</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Invalid request format</td>
        </tr>
      </table>
      abbrechen, damit nur korrekt formattierte Requests verarbeitet werden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-422" title="TI-Flow-Fachdienst - Fehlerbehandlung - HTTP-Timeoutfehler" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS für den Fall, dass ein Request in einen Timeout läuft die Anfrage mit folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>408 - Request Timeout</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>timeout</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_TIMEOUT</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>The request timed out.</td>
        </tr>
      </table>
      abbrechen, damit Clients über Timeouts informiert werden und entsprechend reagieren können.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-423" title="TI-Flow-Fachdienst - Fehlerbehandlung - Serverfehler" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS im Falle eines internen Serverfehlers die Anfrage mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>500 - Internal Server Error</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>transient</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_INTERNAL_ERROR</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Internal Server Error</td>
        </tr>
      </table>
      abbrechen, damit Clients über transiente Serverfehler informiert werden und eine Wiederholung in Erwägung ziehen können.
</requirement>

### Anforderungen zu Fehlercodes in Query- und Operation-APIs

Die folgenden Anforderungen definieren spezifische Fehlercodes, die in verschiedenen Fehlerkonstellationen bei Query- und Operation-API Endpunkten verwendet werden.

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-424" title="TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_UNKNOWN_TYPE" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS im Falle, dass ein unbekannter Ressourcentyp angefragt wird, die Anfrage mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>404 - Not Found</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>not-found</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>MSG_UNKNOWN_TYPE</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Unknown resource type</td>
        </tr>
      </table>
      abbrechen, damit Clients eindeutig identifizieren können, dass der angeforderte Ressourcentyp nicht bekannt ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-425" title="TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_RESOURCE_ID_FAIL" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS im Falle, dass eine unbekannte Ressource-ID angefragt wird, die Anfrage mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>404 - Not Found</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>not-found</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>MSG_RESOURCE_ID_FAIL</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Resource is not known</td>
        </tr>
      </table>
      abbrechen, damit Clients erkennen können, dass eine Ressource mit der angeforderten ID nicht existiert.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-426" title="TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_DELETED" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS im Falle, dass auf eine gelöschte Ressource zugegriffen wird, die Anfrage mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>410 - Gone</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>not-found</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>MSG_DELETED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Resource was deleted</td>
        </tr>
      </table>
      abbrechen, damit Clients erkennen können, dass eine Ressource dauerhaft gelöscht wurde.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-427" title="TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_PARAM_UNKNOWN" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS im Falle, dass ein unbekannter Suchparameter verwendet wird, die Anfrage mit dem folgenden Fehler:
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
            <td>MSG_PARAM_UNKNOWN</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Unknown search parameter</td>
        </tr>
      </table>
      abbrechen, damit Clients erkennen können, dass ein verwendeter Suchparameter nicht unterstützt wird.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-428" title="TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_BAD_SYNTAX" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS im Falle, dass ungültige Query-Parameter verwendet werden, die Anfrage mit dem folgenden Fehler:
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
            <td>MSG_BAD_SYNTAX</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Invalid query parameter(s)</td>
        </tr>
      </table>
      abbrechen, damit Clients erkennen können, dass die verwendeten Query-Parameter syntaktisch oder semantisch ungültig sind.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-429" title="TI-Flow-Fachdienst - Fehlerbehandlung - Fehlercode MSG_UNKNOWN_OPERATION" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
      Der TI-Flow-Fachdienst MUSS im Falle, dass eine unbekannte FHIR-Operation angefragt wird, die Anfrage mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>404 - Not Found</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>not-found</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>MSG_UNKNOWN_OPERATION</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>unknown FHIR http operation</td>
        </tr>
      </table>
      abbrechen, damit Clients erkennen können, dass die angeforderte FHIR-Operation nicht unterstützt wird.
</requirement>