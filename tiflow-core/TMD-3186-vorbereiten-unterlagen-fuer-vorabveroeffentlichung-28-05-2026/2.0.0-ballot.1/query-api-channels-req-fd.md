# Server-Anforderungen: Channels-Query - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Additional API**](menu-schnittstellen-additional-api.md)
* [**Query API: Channels**](query-api-channels.md)
* **Server-Anforderungen: Channels-Query**

## Server-Anforderungen: Channels-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den channels-Endpunkt.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Channels mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden und mit dem folgenden Fehler:

* HTTP-Code: Error Code
  * 405 - Method Not Allowed: methodNotAllowed
* HTTP-Code: Error Details
  * 405 - Method Not Allowed: Die verwendete HTTP-Methode ist für diese Ressource nicht zulässig

abbrechen, damit keine unzulässigen Operationen ausgeführt werden können.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS die API mit den Endpunkten GET /channels, GET /channels/{pushkey} und POST /channels/{pushkey} gemäß [OpenAPI_FD] bereitstellen.
### GET /channels

Mit der Operation GET /channels können die verfügbaren Channels abgefragt werden.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Error Code
  * 403 - Forbidden: invalidOid
* HTTP-Code: Error Details
  * 403 - Forbidden: -

abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
Mit der Operation GET /channels/{pushkey} können die Channels und deren Konfiguration für eine spezifische FdV-Instanz abgefragt werden.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Error Code
  * 403 - Forbidden: invalidOid
* HTTP-Code: Error Details
  * 403 - Forbidden: -

abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
### POST /channels

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Error Code
  * 403 - Forbidden: invalidOid
* HTTP-Code: Error Details
  * 403 - Forbidden: -

abbrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} das Payload gegen das Schema in [OpenAPI_FD] validieren und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Error Code
  * 400 - Bad Request: malformedRequest
* HTTP-Code: Error Details
  * 400 - Bad Request: Ungültiger http-Request

abbrechen, damit kein Schadcode und keine "fachfremden" Daten in den TI-Flow-Fachdienst hochgeladen werden.

