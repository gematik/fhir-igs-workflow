# FdV-Anforderungen: Zugriffsberechtigung einsehen - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung einsehen**](op-read-eu-access-permission.md)
* **FdV-Anforderungen: Zugriffsberechtigung einsehen**

## FdV-Anforderungen: Zugriffsberechtigung einsehen

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$read-eu-access-permission`-Endpunktes.

Das E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung abrufen" zum Abrufen der Information vom TI-Flow-Fachdienst die HTTP-Operation GET /$read-eu-access-permission mit:
* ACCESS_TOKEN im Authorization-Header
ausführen.
In der Response kann ein Zugriffsberechtigungsdatensatz [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] enthalten sein.

