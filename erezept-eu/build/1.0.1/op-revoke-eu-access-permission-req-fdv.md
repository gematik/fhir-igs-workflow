# FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen - EU Zugriff E-Rezept v1.0.1

EU Zugriff E-Rezept

Version 1.0.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung löschen**](op-revoke-eu-access-permission.md)
* **FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen**

## FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$revoke-eu-access-permission`-Endpunktes.

Das E-Rezept-FdV MUSS es dem Nutzer im Anwendungsfall “Zugriffsberechtigung löschen” ermöglichen den Löschwunsch einzugeben.

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" zum Löschen der Information auf dem E-Rezept-Fachdienst die HTTP-Operation DELETE /$revoke-eu-access-permission mit:
* ACCESS_TOKEN im Authorization-Header
ausführen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" die lokal gespeicherten Informationen zur Zugriffsberechtigung löschen.

