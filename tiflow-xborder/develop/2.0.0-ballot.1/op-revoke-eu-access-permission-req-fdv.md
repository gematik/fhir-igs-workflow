# FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.1

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung löschen**](op-revoke-eu-access-permission.md)
* **FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen**

## FdV-Anforderungen Anforderungen: Zugriffsberechtigung löschen

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$revoke-eu-access-permission`-Endpunktes.

Das E-Rezept-FdV MUSS es dem Nutzer im Anwendungsfall “Zugriffsberechtigung löschen” ermöglichen den Löschwunsch einzugeben.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" zum Löschen der Information auf dem TI-Flow-Fachdienst die HTTP-Operation DELETE /$revoke-eu-access-permission ausführen.

funkt. Eignung: HerstellererklärungDas E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung löschen" die lokal gespeicherten Informationen zur Zugriffsberechtigung löschen.

