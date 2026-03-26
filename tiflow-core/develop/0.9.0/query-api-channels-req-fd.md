# Server-Anforderungen: Channels-Query - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Channels**](query-api-channels.md)
* **Server-Anforderungen: Channels-Query**

## Server-Anforderungen: Channels-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den channels-Endpunkt.

Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Channels mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden, damit keine unzulässigen Operationen auf den Daten ausgeführt werden können.

Der TI-Flow-Fachdienst MUSS die API mit den Endpunkten GET /channels, GET /channels/{pushkey} und POST /channels/{pushkey} gemäß [OpenAPI_FD] bereitstellen.
### GET /channels

Mit der Operation GET /channels können die verfügbaren Channels abgefragt werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
Mit der Operation GET /channels/{pushkey} können die Channels und deren Konfiguration für eine spezifische FdV-Instanz abgefragt werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
### POST /channels

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.

