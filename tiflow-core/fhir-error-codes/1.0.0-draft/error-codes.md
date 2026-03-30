# Fehlercodes - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Fehlercodes**

## Fehlercodes

Der TI-Flow-Fachdienst stellt eine http-Schnittstelle für den Aufruf durch Clientsysteme bereit. Das Ergebnis der Operation wird in der Verwendung von Http-Status-Codes [HTTP-STATUS-CODES] mitgeteilt. Die folgende Tabelle listet die vom TI-Flow-Fachdienst genutzten Http-Status-Codes auf.

Der TI-Flow-Fachdienst MUSS beim Aufruf einer Operation im Http-Response-Header einen HTTP-Status-Codes gemäß [RFC7231] zurückgeben.
# HTTP Status Codes – TI-Flow-Fachdienst

Der TI-Flow-Fachdienst MUSS im Fehlerfall (http-Statuscodes >= 400) Hinweise zur Fehlerursache
* im der inneren http-Response-Body als FHIR-Ressource OperationOutcome
* falls keine innere VAU-Response existiert, in einem "äußeren" http-Response-Body in einer JSON-Struktur mit `"x-request-id", (http-)"status", "error"-Text, "message"-Details`
an den Client zurückgeben, ohne Implementierungsdetails (z.B. kein Stacktrace) preiszugeben und dabei sicherstellen, dass personenbezogene oder medizinische Daten, falls für die qualifizierte Fehlerbeschreibung notwendig, ausschließlich in der VAU-verschlüsselten inneren http-Response übertragen werden.
Die Fehlermeldung beinhaltet bei fachlichen Fehlern einen VAU-verschlüsselten inneren http-Response. In diesem inneren Response werden ggf. ausschliesslich personenbezogene oder medizinische Daten an den aufrufenden Client übermittelt, welche bereits im VAU-verschlüsselten inneren http-Request, welcher zum Fehler führte, enthalten waren. Das kann bspw. bei Fehlern bei der Prüfung der FHIR Konformität von Datensätzen auftreten.

Die Details des OperationOutcomes werden in den Anforderungen mit einer Tabelle wie unten beschrieben:

* HTTP-Code: Severity
  * HTTP-Status-Code: OperationOutcome.issue.severity
* HTTP-Code: Code
  * HTTP-Status-Code: OperationOutcome.issue.code
* HTTP-Code: Details Code
  * HTTP-Status-Code: OperationOutcome.issue.details.coding.code
* HTTP-Code: Details Text
  * HTTP-Status-Code: OperationOutcome.issue.details.coding.display / OperationOutcome.issue.details.text

Bei nicht FHIR-Fehlern werden ein HTTP Status Code und ein Fehlercode im Media Type *application/json* nach folgendem Schema zurückgegeben:

```

{
    "errorCode": "beispielFehlerCode"
}

```

Die Details werden in den Anforderungen mit einer Tabelle wie unten beschrieben dargestellt:

* HTTP-Code: Error Code
  * HTTP-Status-Code: beispielFehlerCode

Treten Fehler beim VAU-Transport (bspw. innerer http-Request kann nicht entschlüsselt werden) auf, beinhaltet die Fehlermeldung keinen inneren http-Response.

