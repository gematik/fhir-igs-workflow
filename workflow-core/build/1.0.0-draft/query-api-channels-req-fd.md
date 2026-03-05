# FD-Anforderungen: channels-Query - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: channels**](query-api-channels.md)
* **FD-Anforderungen: channels-Query**

## FD-Anforderungen: channels-Query

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den channels-Endpunkt.

Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Channels mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden, damit keine unzulässigen Operationen auf den Daten ausgeführt werden können.

Der E-Rezept-Fachdienst MUSS die API mit den Endpunkten GET /channels, GET /channels/{pushkey} und POST /channels/{pushkey} gemäß [OpenAPI_FD] bereitstellen.
### GET /channels

Mit der Operation GET /channels können die verfügbaren Channels abgefragt werden.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /channels die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
Mit der Operation GET /channels/{pushkey} können die Channels und deren Konfiguration für eine spezifische FdV-Instanz abgefragt werden.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
### POST /channels

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle
* oid_versicherter
die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.

