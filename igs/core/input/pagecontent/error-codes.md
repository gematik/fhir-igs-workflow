Der TI-Flow-Fachdienst stellt eine http-Schnittstelle für den Aufruf durch Clientsysteme bereit. Das Ergebnis der Operation wird in der Verwendung von Http-Status-Codes [HTTP-STATUS-CODES] mitgeteilt. Die folgende Tabelle listet die vom TI-Flow-Fachdienst genutzten Http-Status-Codes auf.

<!-- A_19514-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-340" title="TI-Flow-Fachdienst - Http-Status-Codes" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf einer Operation im Http-Response-Header einen HTTP-Status-Codes gemäß [RFC7231] zurückgeben.
</requirement>

# HTTP Status Codes – TI-Flow-Fachdienst

<!-- A_22103 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-341" title="TI-Flow-Fachdienst - Fehlerdetails in OperationOutcome" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS im Fehlerfall (http-Statuscodes &gt;= 400) Hinweise zur Fehlerursache 
     
     <ul>
        <li>im der inneren http-Response-Body als FHIR-Ressource OperationOutcome</li>
        <li>falls keine innere VAU-Response existiert, in einem "äußeren" http-Response-Body in einer JSON-Struktur mit `"x-request-id", (http-)"status", "error"-Text, "message"-Details`</li>
     </ul>
      
      an den Client zurückgeben, ohne Implementierungsdetails (z.B. kein Stacktrace) preiszugeben und dabei sicherstellen, dass personenbezogene oder medizinische Daten, falls für die qualifizierte Fehlerbeschreibung notwendig, ausschließlich in der VAU-verschlüsselten inneren http-Response übertragen werden.
</requirement>

Die Fehlermeldung beinhaltet bei fachlichen Fehlern einen VAU-verschlüsselten inneren http-Response. In diesem inneren Response werden ggf. ausschliesslich personenbezogene oder medizinische Daten an den aufrufenden Client übermittelt, welche bereits im VAU-verschlüsselten inneren http-Request, welcher zum Fehler führte, enthalten waren. Das kann bspw. bei Fehlern bei der Prüfung der FHIR Konformität von Datensätzen auftreten.

Die Details des OperationOutcomes werden in den Anforderungen mit einer Tabelle wie unten beschrieben:
<table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
    <tr>
        <th>HTTP-Code</th>
        <td>HTTP-Status-Code</td>
    </tr>
    <tr>
        <th>Severity</th>
        <td>OperationOutcome.issue.severity</td>
    </tr>
    <tr>
        <th>Code</th>
        <td>OperationOutcome.issue.code</td>
    </tr>
    <tr>
        <th>Details Code</th>
        <td>OperationOutcome.issue.details.coding.code</td>
    </tr>
    <tr>
        <th>Details Text</th>
        <td>OperationOutcome.issue.details.coding.display / OperationOutcome.issue.details.text</td>
    </tr>
</table>

Bei nicht FHIR-Fehlern werden ein HTTP Status Code und ein Fehlercode im Media Type <i>application/json</i> nach folgendem Schema zurückgegeben:
<pre><code>
{
    "errorCode": "beispielFehlerCode"
}
</code></pre>
Die Details werden in den Anforderungen mit einer Tabelle wie unten beschrieben dargestellt:
<table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
    <tr>
        <th>HTTP-Code</th>
        <td>HTTP-Status-Code</td>
    </tr>
    <tr>
        <th>Error Code</th>
        <td>beispielFehlerCode</td>
    </tr>
    <tr>
        <th>Error Details</th>
        <td>Beispiel Fehler</td>
    </tr>
</table>

Treten Fehler beim VAU-Transport (bspw. innerer http-Request kann nicht entschlüsselt werden) auf, beinhaltet die Fehlermeldung keinen inneren http-Response.
