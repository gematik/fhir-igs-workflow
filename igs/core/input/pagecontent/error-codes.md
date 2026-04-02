Der TI-Flow-Fachdienst stellt eine http-Schnittstelle für den Aufruf durch Clientsysteme bereit. Das Ergebnis der Operation wird in der Verwendung von Http-Status-Codes [HTTP-STATUS-CODES] mitgeteilt. Die folgende Tabelle listet die vom TI-Flow-Fachdienst genutzten Http-Status-Codes auf.

<!-- A_19514-03 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-340" title="TI-Flow-Fachdienst - Http-Status-Codes" version="0">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf einer Operation im Http-Response-Header einen HTTP-Status-Codes gemäß [RFC7231] zurückgeben.
</requirement>

### Struktur der Fehlerrückgabe

Die Fehlermeldung beinhaltet bei fachlichen Fehlern einen VAU-verschlüsselten inneren http-Response. In diesem inneren Response werden ggf. ausschliesslich personenbezogene oder medizinische Daten an den aufrufenden Client übermittelt, welche bereits im VAU-verschlüsselten inneren http-Request, welcher zum Fehler führte, enthalten waren. Das kann bspw. bei Fehlern bei der Prüfung der FHIR Konformität von Datensätzen auftreten.

<!-- A_22103 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-341" title="TI-Flow-Fachdienst - Fehlerdetails in OperationOutcome" version="1">
    <meta lockversion="false"/>
    <actor name="TI_Flow_FD">
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

### Fehlerstruktur bei FHIR-Schnittstellen

Da der TI-Flow-Fachdienst FHIR als grundlegenedes Austauschformat für den überwiegenden Teil der API verwendet, werden alle FHIR-Schnittstellen im Fehlerfall mit einer [TIFlow-OperationOutcome](./StructureDefinition-tiflow-operation-outcome.html) quittiert:

{% include StructureDefinition-tiflow-operation-outcome-snapshot-by-mustsupport.xhtml %}

Folgende Felder der OperationOutcome sind für den Client bei der Auswertung relevant:

<table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
    <tr>
        <th>HTTP-Code</th>
        <td>HTTP-Status-Code</td>
        <td>Beschreibung</td>
    </tr>
    <tr>
        <th>Severity</th>
        <td>OperationOutcome.issue.severity</td>
        <td>Gibt an, um welche Schwere des Fehlers es sich handelt: Warnung oder Fehler</td>
    </tr>
    <tr>
        <th>Code</th>
        <td>OperationOutcome.issue.code</td>
        <td>Gibt an, um welche Art des Fehlers es sich handelt, bspw. ob es ein Validierungs- oder ein inhaltlicher Verarbeitungsfehler ist.</td>
    </tr>
    <tr>
        <th>Details</th>
        <td>OperationOutcome.issue.details</td>
        <td>Gibt eine genauere Beschreibung des Fehlers in einer kodierten Art und Weise an. Dabei sind textuelle und kodierte Inhalte vorhanden</td>
    </tr>
    <tr>
        <th>Details Code</th>
        <td>OperationOutcome.issue.details.coding.code</td>
        <td>Gibt einen Fehlercode, der in diesem IG beschrieben ist an</td>
    </tr>
    <tr>
        <th>Details Text</th>
        <td>OperationOutcome.issue.details.text</td>
        <td>Gibt eine textuelle Repräsentation des Fehlers an.</td>
    </tr>
</table>

#### Terminologie von issue.details

Wichtig für die Auswertung sind die Terminologien von `issue.details`. Dieses Feld ist ein FHIR [CodeableConcept](http://hl7.org/fhir/R4/datatypes.html#CodeableConcept) und kann daher nur eine definierte Anzahl an Terminologien enthalten.

Das ValueSet, was referenziert ist wird im jeweiligen IG beschrieben. So entält das ValueSet `tiflow-erezept-operation-outcome-details-vs` alle Fehlercodes, die in [gemIG_TIFlow_erezept] definiert sind.

#### Quellen von Fehlercodes

Dabei können Fehler aus den folgenden Quellen definiert sein:

|Quelle|Beschreibung|Beispiel|
|---|---|---|
|[HL7 OperationOutcome Codes](https://hl7.org/fhir/R4/codesystem-operation-outcome.html)|FHIR übergreifende Fehlercodes definiert in der FHIR-Spezifikation.|MSG_ID_INVALID - invalid id of the FHIR-Resource|
|[TI-Common OperationOutcomeDetailsCS](https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes)|TI-weite Fehlercodes, die für FHIR Systeme der TI gelten.|SVC_INVALID_ACCESS_TOKEN - Ungültiges ACCESS_TOKEN|
|[TI-Flow OperationOutcomeDetailsCS](./CodeSystem-tiflow-operation-outcome-details-cs.html)|Fehlercodes, die für die TIFlow-Anwendungen gelten.|TIFLOW_AUTH_ROLE_NOT_ALLOWED - Rolle für den Endpunkt nicht autorisiert|
|TI-Flow Modul OperationOutcomeDetailsCS|Fehlercodes, die für das konkrete TI-Flow Modul definiert wurden.|TIFLOW_EREZEPT_PZN_INVALID - Invalide PZN|

<div><figcaption><strong>Tabelle: </strong>Quellen von OperationOutcome Terminologien</figcaption></div>

Der jeweilige IG bindet ein ValueSet an das OperationOutcome wodurch die Liste der für diesen IG möglichen Fehlercodes definiert ist.

### Beschreibung von Fehlercodes im IG

In den IGs der TI-Flow Anwendungen sind die Schnittstellen jeweils beschrieben (ref. [Query API](./menu-schnittstellen-query-api.html)). Jede dieser Seiten enthält eine farblich gekennzeichnete API Beschreibung mit möglichen HTTP-Headern, Query-Parametern, Beispiele für Request- und Response-Body, sowie eine Auflistung der Fehlercodes, die dieser Endpunkt zurückgeben kann.

Die Liste an möglichen Fehlercodes, die ein Endpunkt zurückgibt, ergibt sich dabei aus

- den Anforderungen für den Server, der Prüfungen an dem Endpunkt durchzuführen hat
- der Systematik von Fehlercodes, die generell für die Art des Endpunktes gelten.

Zum besseren Verständnis der Prüfung, können die Server-Anforderungen nach dem Fehlercode durchsucht werden, um die entsprechende Anforderung anzuschauen.

#### Systematik der Fehlercodes

FHIR definiert grundsätzlich zwei Arten von Endpunkten: `Query-Endpunkte`, welche sich nach dem Muster `[baseUrl]/<FHIR-Ressource>` bilden, sowie `Operation-Endpunkte`, die durch ein `$` gekennzeichnet werden, bspw. `[baseUrl]/Task/$<FHIR-Operation>`.

FHIR definiert dabei für Query Endpunkte bestimmte Interaktions Arten: [RESTful API](https://hl7.org/fhir/R4/http.html). Für diese Arten gelten für die IGs der TIFlow-Anwendungen jeweils folgende Fehlercodes:

##### Endpunkt-übergreifende Fehlercodes

Die folgenden Fehlercodes können ungeachtet des Endpunktes auftreten und gelten damit global für alle Endpunkte der TI-Flow Anwendungen:

<table id="global-error-codes">
    <thead>
        <tr>
            <th>API Interaktion</th>
            <th>Mögliche Fehlercodes</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Any</td>
            <td>
                <ul>
                    <li>MSG_AUTH_REQUIRED - Authentication required</li>
                    <li>MSG_BAD_FORMAT - Invalid request format</li>
                    <li>MSG_OP_NOT_ALLOWED - Method or Operation not allowed</li>
                    <li>MSG_TIMEOUT - Request timeout</li>
                    <li>MSG_RATE_LIMIT - Too many requests</li>
                    <li>MSG_INTERNAL_ERROR - Internal server error</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Globale Fehlercodes</figcaption></div>


##### Query-API

Für die Ressourcen-Endpunkte in FHIR gelten die folgenden übergreifenden Fehlercodes. Diese sind jeweils für die FHIR-Interaktionen definiert:

<table id="query-api-error-codes">
    <thead>
        <tr>
            <th>API Interaktion</th>
            <th>Mögliche Fehlercodes</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Instance - <a href="https://hl7.org/fhir/R4/http.html#read">read</a></td>
            <td>
                <ul>
                    <li>MSG_UNKNOWN_TYPE - Unknown resource type</li>
                    <li>MSG_RESOURCE_ID_FAIL - Resource is not known</li>
                    <li>MSG_DELETED - Resource was deleted</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Instance - <a href="https://hl7.org/fhir/R4/http.html#update">update</a></td>
            <td>
                <ul>
                    <li>MSG_UNKNOWN_TYPE - Unknown resource type</li>
                    <li>MSG_RESOURCE_ID_FAIL - Resource is not known</li>
                    <li>MSG_DELETED - Resource was deleted</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Instance - <a href="https://hl7.org/fhir/R4/http.html#patch">patch</a></td>
            <td>
                <ul>
                    <li>MSG_UNKNOWN_TYPE - Unknown resource type</li>
                    <li>MSG_RESOURCE_ID_FAIL - Resource is not known</li>
                    <li>MSG_DELETED - Resource was deleted</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Instance - <a href="https://hl7.org/fhir/R4/http.html#delete">delete</a></td>
            <td>
                <ul>
                    <li>MSG_UNKNOWN_TYPE - Unknown resource type</li>
                    <li>MSG_RESOURCE_ID_FAIL - Resource is not known</li>
                    <li>MSG_DELETED - Resource was deleted</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Type - <a href="https://hl7.org/fhir/R4/http.html#create">create</a></td>
            <td>
                <ul>
                    <li>MSG_UNKNOWN_TYPE - Unknown resource type</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Type - <a href="https://hl7.org/fhir/R4/http.html#search">search</a></td>
            <td>
                <ul>
                    <li>MSG_PARAM_UNKNOWN - Unknown search parameter</li>
                    <li>MSG_BAD_SYNTAX - Invalid query parameter(s)</li>
                    <li>MSG_UNKNOWN_TYPE - Unknown resource type</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

<div><figcaption><strong>Tabelle: </strong>Fehlercodes für Query-API</figcaption></div><br>

##### Operation-API

FHIR definiert drei Ebenen auf denen Operationen ausgeführt werden können:

|Ebene|Beispiel|
|---|---|
|System Level|[baseUrl]/$operation|
|Type Level|[baseUrl]/Task/$operation|
|Instance Level|[baseUrl]/Task/<id>/$operation|

<div><figcaption><strong>Tabelle: </strong>Ebenen von FHIR Operationen</figcaption></div><br>

Hierfür gelten für die TIFlow-Anwendungen die folgenden Fehlercodes für Operationen:

<table id="query-api-error-codes">
    <thead>
        <tr>
            <th>API Interaktion</th>
            <th>Mögliche Fehlercodes</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>System Operationen</td>
            <td>
                <ul>
                    <li>MSG_UNKNOWN_OPERATION - unknown FHIR http operation</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Type Operationen</td>
            <td>
                <ul>
                    <li>MSG_UNKNOWN_OPERATION - unknown FHIR http operation</li>
                    <li>MSG_OP_NOT_ALLOWED - Operation not allowed for resource</li>
                    <li>MSG_UNKNOWN_TYPE - Unknown resource type</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Instance Operationen</td>
            <td>
                <ul>
                    <li>MSG_RESOURCE_ID_FAIL - Resource is not known</li>
                    <li>MSG_DELETED - Resource was deleted</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

### Struktur von Fehlern bei Nicht-FHIR APIs

Der TI-Flow-Fachdienst bietet Schnittstellen, deren Austauschformat nicht nach FHIR modelliert wurde. Bspw. [Push-API: Pusher](./query-api-pushers.md). 

Diese Schnittstellen haben eine eigens definierte JSON Struktur von Fehlern, die in der jeweils referenzierten OpenAPI dokumentiert ist. Im Fehlerfall erhalten Clients eine HTTP Antwort mit HTTP Status Code und einem Response Body im Media Type <i>application/json</i>.

Im Folgenden, ein Beispiel:

```json
{
  "errorCode": "RESOURCE_NOT_FOUND",
  "errorDetail": "The requested pusher could not be found"
}
```
<br>

Treten Fehler beim VAU-Transport (bspw. innerer http-Request kann nicht entschlüsselt werden) auf, beinhaltet die Fehlermeldung keinen inneren http-Response.
