# FD-Anforderungen: pushers-Query - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: pushers**](query-api-pushers.md)
* **FD-Anforderungen: pushers-Query**

## FD-Anforderungen: pushers-Query

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den pusher-Endpunkt.

Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Pushers mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden, damit keine unzulässigen Operationen auf den Daten ausgeführt werden können.

Der E-Rezept-Fachdienst MUSS die API mit den Endpunkten GET /pushers und POST /pushers/set gemäß [OpenAPI_FD] bereitstellen.
### GET /pushers

Mit der Operation GET /pushers können alle für den Nutzer registrierten FdV-Instanzen abgefragt werden.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /pushers die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /pushers die dem Versicherten zugeordneten Pusher-Ressourcen anhand der KVNR des Versicherten aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, damit ausschließlich Versicherte ihre eigenen App-Registrierungen einsehen können.
### POST /pushers/set

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /pushers/set die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.

