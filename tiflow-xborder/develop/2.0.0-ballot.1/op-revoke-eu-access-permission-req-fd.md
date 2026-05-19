# FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.1

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung löschen**](op-revoke-eu-access-permission.md)
* **FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen**

## FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen

### Anforderungen der Schnittstelle aus diesem Modul

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen, damit die Information zur Zugriffsberechtigung nicht durch Unberechtigte gelöscht werden kann.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission die KVNR des Versicherten im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und, falls vorhanden, zu dieser KVNR gespeicherte Zugriffsberechtigungen löschen.

