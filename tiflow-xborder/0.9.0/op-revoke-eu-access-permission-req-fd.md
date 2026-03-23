# FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung löschen**](op-revoke-eu-access-permission.md)
* **FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen**

## FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen

### Anforderungen der Schnittstelle aus diesem Modul

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit die Information zur Zugriffsberechtigung nicht durch Unberechtigte gelöscht werden kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission die KVNR des Versicherten im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und, falls vorhanden, zu dieser KVNR gespeicherte Zugriffsberechtigungen löschen.

