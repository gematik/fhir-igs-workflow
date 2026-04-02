# Server-Anforderungen: Pushers-Query - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Additional API**](menu-schnittstellen-additional-api.md)
* [**Query API: Pushers**](query-api-pushers.md)
* **Server-Anforderungen: Pushers-Query**

## Server-Anforderungen: Pushers-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den pusher-Endpunkt.

Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Pushers mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden, damit keine unzulässigen Operationen auf den Daten ausgeführt werden können.

Der TI-Flow-Fachdienst MUSS die API mit den Endpunkten GET /pushers und POST /pushers/set gemäß [OpenAPI_FD] bereitstellen.
### GET /pushers

Mit der Operation GET /pushers können alle für den Nutzer registrierten FdV-Instanzen abgefragt werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /pushers die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Error Code
  * 403 - Forbidden: invalidOid
* HTTP-Code: Error Details
  * 403 - Forbidden: -

abrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /pushers die dem Versicherten zugeordneten Pusher-Ressourcen anhand der KVNR des Versicherten aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, damit ausschließlich Versicherte ihre eigenen App-Registrierungen einsehen können.
### POST /pushers/set

Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /pushers/set die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Error Code
  * 403 - Forbidden: invalidOid
* HTTP-Code: Error Details
  * 403 - Forbidden: -

abrechen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.

