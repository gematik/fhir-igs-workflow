# Anforderungen zur Fehlerbehandlung - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Fehlercodes**](error-codes.md)
* **Anforderungen zur Fehlerbehandlung**

## Anforderungen zur Fehlerbehandlung

Diese Seite listet und beschreibt Anforderungen zu Fehlercodes und -konstellationen im TI-Flow-Fachdienst.

### Allgemeine Anforderungen zur Fehlerbehandlung

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst MUSS beim Aufruf einer Operation im Http-Response-Header einen HTTP-Status-Codes gemäß [RFC7231] zurückgeben.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS im Fehlerfall (http-Statuscodes >= 400) Hinweise zur Fehlerursache
* im der inneren http-Response-Body als FHIR-Ressource OperationOutcome bei FHIR-Schnittstellen
* im der inneren http-Response-Body in einer JSON-Struktur mit den Feldern `errorCode` und `errorDetail` bei non FHIR-Schnittstellen
* falls keine innere VAU-Response existiert, in einem "äußeren" http-Response-Body in einer JSON-Struktur mit den Feldern `errorCode` und `errorDetail`
an den Client zurückgeben, ohne Implementierungsdetails (z.B. kein Stacktrace) preiszugeben und dabei sicherstellen, dass personenbezogene oder medizinische Daten, falls für die qualifizierte Fehlerbeschreibung notwendig, ausschließlich in der VAU-verschlüsselten inneren http-Response übertragen werden.
### Anforderungen zu Endpunt-übergreifenden Fehlercodes

Der TI-Flow-Fachdienst muss allgemeine Anforderungen zu Fehlercodes umsetzen, um wiederkehrende Fehlerszenarien umzusetzen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS an den Schnittstellen prüfen, dass der HTTP-Request well-formed ist und andernfalls die Anfrage mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: MSG_BAD_FORMAT
* HTTP-Code: Details Text
  * 400 - Bad Request: Invalid request format

abbrechen, damit nur korrekt formattierte Requests verarbeitet werden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS für den Fall, dass ein Request in einen Timeout läuft die Anfrage mit folgenden Fehler:

* HTTP-Code: Severity
  * 408 - Request Timeout: error
* HTTP-Code: Code
  * 408 - Request Timeout: timeout
* HTTP-Code: Details Code
  * 408 - Request Timeout: TIFLOW_TIMEOUT
* HTTP-Code: Details Text
  * 408 - Request Timeout: The request timed out.

abbrechen, damit Clients über Timeouts informiert werden und entsprechend reagieren können.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS im Falle eines internen Serverfehlers die Anfrage mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 500 - Internal Server Error: error
* HTTP-Code: Code
  * 500 - Internal Server Error: transient
* HTTP-Code: Details Code
  * 500 - Internal Server Error: TIFLOW_INTERNAL_ERROR
* HTTP-Code: Details Text
  * 500 - Internal Server Error: Internal Server Error

abbrechen, damit Clients über transiente Serverfehler informiert werden und eine Wiederholung in Erwägung ziehen können.
### Anforderungen zu Fehlercodes in Query- und Operation-APIs

Die folgenden Anforderungen definieren spezifische Fehlercodes, die in verschiedenen Fehlerkonstellationen bei Query- und Operation-API Endpunkten verwendet werden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS im Falle, dass ein unbekannter Ressourcentyp angefragt wird, die Anfrage mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 404 - Not Found: error
* HTTP-Code: Code
  * 404 - Not Found: not-found
* HTTP-Code: Details Code
  * 404 - Not Found: MSG_UNKNOWN_TYPE
* HTTP-Code: Details Text
  * 404 - Not Found: Unknown resource type

abbrechen, damit Clients eindeutig identifizieren können, dass der angeforderte Ressourcentyp nicht bekannt ist.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS im Falle, dass eine unbekannte Ressource-ID angefragt wird, die Anfrage mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 404 - Not Found: error
* HTTP-Code: Code
  * 404 - Not Found: not-found
* HTTP-Code: Details Code
  * 404 - Not Found: MSG_RESOURCE_ID_FAIL
* HTTP-Code: Details Text
  * 404 - Not Found: Resource is not known

abbrechen, damit Clients erkennen können, dass eine Ressource mit der angeforderten ID nicht existiert.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS im Falle, dass auf eine gelöschte Ressource zugegriffen wird, die Anfrage mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 410 - Gone: error
* HTTP-Code: Code
  * 410 - Gone: not-found
* HTTP-Code: Details Code
  * 410 - Gone: MSG_DELETED
* HTTP-Code: Details Text
  * 410 - Gone: Resource was deleted

abbrechen, damit Clients erkennen können, dass eine Ressource dauerhaft gelöscht wurde.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS im Falle, dass ein unbekannter Suchparameter verwendet wird, die Anfrage mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: MSG_PARAM_UNKNOWN
* HTTP-Code: Details Text
  * 400 - Bad Request: Unknown search parameter

abbrechen, damit Clients erkennen können, dass ein verwendeter Suchparameter nicht unterstützt wird.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS im Falle, dass ungültige Query-Parameter verwendet werden, die Anfrage mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: MSG_BAD_SYNTAX
* HTTP-Code: Details Text
  * 400 - Bad Request: Invalid query parameter(s)

abbrechen, damit Clients erkennen können, dass die verwendeten Query-Parameter syntaktisch oder semantisch ungültig sind.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS im Falle, dass eine unbekannte FHIR-Operation angefragt wird, die Anfrage mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 404 - Not Found: error
* HTTP-Code: Code
  * 404 - Not Found: not-found
* HTTP-Code: Details Code
  * 404 - Not Found: MSG_UNKNOWN_OPERATION
* HTTP-Code: Details Text
  * 404 - Not Found: unknown FHIR http operation

abbrechen, damit Clients erkennen können, dass die angeforderte FHIR-Operation nicht unterstützt wird.

