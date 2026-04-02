# Fehlercodes - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Fehlercodes**

## Fehlercodes

Der TI-Flow-Fachdienst stellt eine http-Schnittstelle für den Aufruf durch Clientsysteme bereit. Das Ergebnis der Operation wird in der Verwendung von Http-Status-Codes [HTTP-STATUS-CODES] mitgeteilt. Die folgende Tabelle listet die vom TI-Flow-Fachdienst genutzten Http-Status-Codes auf.

Der TI-Flow-Fachdienst MUSS beim Aufruf einer Operation im Http-Response-Header einen HTTP-Status-Codes gemäß [RFC7231] zurückgeben.
### Struktur der Fehlerrückgabe

Die Fehlermeldung beinhaltet bei fachlichen Fehlern einen VAU-verschlüsselten inneren http-Response. In diesem inneren Response werden ggf. ausschliesslich personenbezogene oder medizinische Daten an den aufrufenden Client übermittelt, welche bereits im VAU-verschlüsselten inneren http-Request, welcher zum Fehler führte, enthalten waren. Das kann bspw. bei Fehlern bei der Prüfung der FHIR Konformität von Datensätzen auftreten.

Der TI-Flow-Fachdienst MUSS im Fehlerfall (http-Statuscodes >= 400) Hinweise zur Fehlerursache
* im der inneren http-Response-Body als FHIR-Ressource OperationOutcome bei FHIR-Schnittstellen
* im der inneren http-Response-Body in einer JSON-Struktur mit den Feldern `errorCode` und `errorDetail` bei non FHIR-Schnittstellen
* falls keine innere VAU-Response existiert, in einem "äußeren" http-Response-Body in einer JSON-Struktur mit den Feldern `errorCode` und `errorDetail`
an den Client zurückgeben, ohne Implementierungsdetails (z.B. kein Stacktrace) preiszugeben und dabei sicherstellen, dass personenbezogene oder medizinische Daten, falls für die qualifizierte Fehlerbeschreibung notwendig, ausschließlich in der VAU-verschlüsselten inneren http-Response übertragen werden.
### Fehlerstruktur bei FHIR-Schnittstellen

Da der TI-Flow-Fachdienst FHIR als grundlegenedes Austauschformat für den überwiegenden Teil der API verwendet, werden alle FHIR-Schnittstellen im Fehlerfall mit einer [TIFlow-OperationOutcome](./StructureDefinition-tiflow-operation-outcome.md) quittiert:

Folgende Felder der OperationOutcome sind für den Client bei der Auswertung relevant:

* HTTP-Code: Severity
  * HTTP-Status-Code: OperationOutcome.issue.severity
  * Beschreibung: Gibt an, um welche Schwere des Fehlers es sich handelt: Warnung oder Fehler
* HTTP-Code: Code
  * HTTP-Status-Code: OperationOutcome.issue.code
  * Beschreibung: Gibt an, um welche Art des Fehlers es sich handelt, bspw. ob es ein Validierungs- oder ein inhaltlicher Verarbeitungsfehler ist.
* HTTP-Code: Details
  * HTTP-Status-Code: OperationOutcome.issue.details
  * Beschreibung: Gibt eine genauere Beschreibung des Fehlers in einer kodierten Art und Weise an. Dabei sind textuelle und kodierte Inhalte vorhanden
* HTTP-Code: Details Code
  * HTTP-Status-Code: OperationOutcome.issue.details.coding.code
  * Beschreibung: Gibt einen Fehlercode, der in diesem IG beschrieben ist an
* HTTP-Code: Details Text
  * HTTP-Status-Code: OperationOutcome.issue.details.text
  * Beschreibung: Gibt eine textuelle Repräsentation des Fehlers an.

#### Terminologie von issue.details

Wichtig für die Auswertung sind die Terminologien von `issue.details`. Dieses Feld ist ein FHIR [CodeableConcept](http://hl7.org/fhir/R4/datatypes.html#CodeableConcept) und kann daher nur eine definierte Anzahl an Terminologien enthalten.

Das ValueSet, was referenziert ist wird im jeweiligen IG beschrieben. So entält das ValueSet `tiflow-erezept-operation-outcome-details-vs` alle Fehlercodes, die in [gemIG_TIFlow_erezept] definiert sind.

#### Quellen von Fehlercodes

Dabei können Fehler aus den folgenden Quellen definiert sein:

| | | |
| :--- | :--- | :--- |
| [HL7 OperationOutcome Codes](https://hl7.org/fhir/R4/codesystem-operation-outcome.html) | FHIR übergreifende Fehlercodes definiert in der FHIR-Spezifikation. | MSG_ID_INVALID - invalid id of the FHIR-Resource |
| [TI-Common OperationOutcomeDetailsCS](https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes) | TI-weite Fehlercodes, die für FHIR Systeme der TI gelten. | SVC_INVALID_ACCESS_TOKEN - Ungültiges ACCESS_TOKEN |
| [TI-Flow OperationOutcomeDetailsCS](./CodeSystem-tiflow-operation-outcome-details-cs.md) | Fehlercodes, die für die TIFlow-Anwendungen gelten. | TIFLOW_AUTH_ROLE_NOT_ALLOWED - Rolle für den Endpunkt nicht autorisiert |
| TI-Flow Modul OperationOutcomeDetailsCS | Fehlercodes, die für das konkrete TI-Flow Modul definiert wurden. | TIFLOW_EREZEPT_PZN_INVALID - Invalide PZN |

**Tabelle: **Quellen von OperationOutcome Terminologien

Der jeweilige IG bindet ein ValueSet an das OperationOutcome wodurch die Liste der für diesen IG möglichen Fehlercodes definiert ist.

### Beschreibung von Fehlercodes im IG

In den IGs der TI-Flow Anwendungen sind die Schnittstellen jeweils beschrieben (ref. [Query API](./menu-schnittstellen-query-api.md)). Jede dieser Seiten enthält eine farblich gekennzeichnete API Beschreibung mit möglichen HTTP-Headern, Query-Parametern, Beispiele für Request- und Response-Body, sowie eine Auflistung der Fehlercodes, die dieser Endpunkt zurückgeben kann.

Die Liste an möglichen Fehlercodes, die ein Endpunkt zurückgibt, ergibt sich dabei aus

* den Anforderungen für den Server, der Prüfungen an dem Endpunkt durchzuführen hat
* der Systematik von Fehlercodes, die generell für die Art des Endpunktes gelten.

Zum besseren Verständnis der Prüfung, können die Server-Anforderungen nach dem Fehlercode durchsucht werden, um die entsprechende Anforderung anzuschauen.

#### Systematik der Fehlercodes

FHIR definiert grundsätzlich zwei Arten von Endpunkten: `Query-Endpunkte`, welche sich nach dem Muster `[baseUrl]/<FHIR-Ressource>` bilden, sowie `Operation-Endpunkte`, die durch ein `$` gekennzeichnet werden, bspw. `[baseUrl]/Task/$<FHIR-Operation>`.

FHIR definiert dabei für Query Endpunkte bestimmte Interaktions Arten: [RESTful API](https://hl7.org/fhir/R4/http.html). Für diese Arten gelten für die IGs der TIFlow-Anwendungen jeweils folgende Fehlercodes:

##### Endpunkt-übergreifende Fehlercodes

Die folgenden Fehlercodes können ungeachtet des Endpunktes auftreten und gelten damit global für alle Endpunkte der TI-Flow Anwendungen:

| | |
| :--- | :--- |
| Any | * MSG_AUTH_REQUIRED - Authentication required
* MSG_BAD_FORMAT - Invalid request format
* MSG_OP_NOT_ALLOWED - Method or Operation not allowed
* MSG_TIMEOUT - Request timeout
* MSG_RATE_LIMIT - Too many requests
* MSG_INTERNAL_ERROR - Internal server error
 |

**Tabelle: **Globale Fehlercodes

##### Query-API

Für die Ressourcen-Endpunkte in FHIR gelten die folgenden übergreifenden Fehlercodes. Diese sind jeweils für die FHIR-Interaktionen definiert:

| | |
| :--- | :--- |
| Instance -[read](https://hl7.org/fhir/R4/http.html#read) | * MSG_UNKNOWN_TYPE - Unknown resource type
* MSG_RESOURCE_ID_FAIL - Resource is not known
* MSG_DELETED - Resource was deleted
 |
| Instance -[update](https://hl7.org/fhir/R4/http.html#update) | * MSG_UNKNOWN_TYPE - Unknown resource type
* MSG_RESOURCE_ID_FAIL - Resource is not known
* MSG_DELETED - Resource was deleted
 |
| Instance -[patch](https://hl7.org/fhir/R4/http.html#patch) | * MSG_UNKNOWN_TYPE - Unknown resource type
* MSG_RESOURCE_ID_FAIL - Resource is not known
* MSG_DELETED - Resource was deleted
 |
| Instance -[delete](https://hl7.org/fhir/R4/http.html#delete) | * MSG_UNKNOWN_TYPE - Unknown resource type
* MSG_RESOURCE_ID_FAIL - Resource is not known
* MSG_DELETED - Resource was deleted
 |
| Type -[create](https://hl7.org/fhir/R4/http.html#create) | * MSG_UNKNOWN_TYPE - Unknown resource type
 |
| Type -[search](https://hl7.org/fhir/R4/http.html#search) | * MSG_PARAM_UNKNOWN - Unknown search parameter
* MSG_BAD_SYNTAX - Invalid query parameter(s)
* MSG_UNKNOWN_TYPE - Unknown resource type
 |

**Tabelle: **Fehlercodes für Query-API

##### Operation-API

FHIR definiert drei Ebenen auf denen Operationen ausgeführt werden können:

| | |
| :--- | :--- |
| System Level | [baseUrl]/$operation |
| Type Level | [baseUrl]/Task/$operation |
| Instance Level | [baseUrl]/Task//$operation |

**Tabelle: **Ebenen von FHIR Operationen

Hierfür gelten für die TIFlow-Anwendungen die folgenden Fehlercodes für Operationen:

| | |
| :--- | :--- |
| System Operationen | * MSG_UNKNOWN_OPERATION - unknown FHIR http operation
 |
| Type Operationen | * MSG_UNKNOWN_OPERATION - unknown FHIR http operation
* MSG_OP_NOT_ALLOWED - Operation not allowed for resource
* MSG_UNKNOWN_TYPE - Unknown resource type
 |
| Instance Operationen | * MSG_RESOURCE_ID_FAIL - Resource is not known
* MSG_DELETED - Resource was deleted
 |

### Struktur von Fehlern bei Nicht-FHIR APIs

Der TI-Flow-Fachdienst bietet Schnittstellen, deren Austauschformat nicht nach FHIR modelliert wurde. Bspw. [Push-API: Pusher](./query-api-pushers.md).

Diese Schnittstellen haben eine eigens definierte JSON Struktur von Fehlern, die in der jeweils referenzierten OpenAPI dokumentiert ist. Im Fehlerfall erhalten Clients eine HTTP Antwort mit HTTP Status Code und einem Response Body im Media Type *application/json*.

Im Folgenden, ein Beispiel:

```
{
  "errorCode": "RESOURCE_NOT_FOUND",
  "errorDetail": "The requested pusher could not be found"
}

```

Treten Fehler beim VAU-Transport (bspw. innerer http-Request kann nicht entschlüsselt werden) auf, beinhaltet die Fehlermeldung keinen inneren http-Response.

