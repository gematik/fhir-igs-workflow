# FD-Anforderungen: Zugriffsberechtigung einsehen - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung einsehen**](op-read-eu-access-permission.md)
* **FD-Anforderungen: Zugriffsberechtigung einsehen**

## FD-Anforderungen: Zugriffsberechtigung einsehen

### Anforderungen der Schnittstelle aus diesem Modul

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /$read-eu-access-permission die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit die Information zur Einwilligung nicht durch Unberechtigte ausgelesen werden kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /$read-eu-access-permission die KVNR des Versicherten im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und im Response falls vorhanden eine Ressource des Profils [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] mit zur KVNR gespeicherte zeitlich gültige Zugriffsberechtigung übermitteln.

