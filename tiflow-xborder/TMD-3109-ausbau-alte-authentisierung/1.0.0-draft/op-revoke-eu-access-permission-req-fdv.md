# FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung löschen**](op-revoke-eu-access-permission.md)
* **FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen**

## FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$revoke-eu-access-permission`-Endpunktes.

Das E-Rezept-FdV MUSS es dem Nutzer im Anwendungsfall “Zugriffsberechtigung löschen” ermöglichen den Löschwunsch einzugeben.

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" zum Löschen der Information auf dem TI-Flow-Fachdienst die HTTP-Operation DELETE /$revoke-eu-access-permission mit:
* ACCESS_TOKEN im Authorization-Header
ausführen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" die lokal gespeicherten Informationen zur Zugriffsberechtigung löschen.

