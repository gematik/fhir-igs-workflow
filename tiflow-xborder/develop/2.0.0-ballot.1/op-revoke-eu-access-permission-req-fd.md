# FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.1

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung löschen**](op-revoke-eu-access-permission.md)
* **FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen**

## FD-Anforderungen Anforderungen: Zugriffsberechtigung löschen

### Anforderungen der Schnittstelle aus diesem Modul

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_versicherter
die Operation am TI-Flow-Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit die Information zur Zugriffsberechtigung nicht durch Unberechtigte gelöscht werden kann.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf den Endpunkt /$revoke-eu-access-permission den zeta-user-info.identifier des Nutzers (KVNR) bestimmen und, falls vorhanden, zu dieser KVNR gespeicherte Zugriffsberechtigungen löschen.

