# FdV-Anforderungen: Zugriffsberechtigung einsehen - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Zugriffsberechtigung einsehen**](op-read-eu-access-permission.md)
* **FdV-Anforderungen: Zugriffsberechtigung einsehen**

## FdV-Anforderungen: Zugriffsberechtigung einsehen

Diese Seite beschreibt Anforderungen für das E-Rezept-FdV zur Nutzung des `$read-eu-access-permission`-Endpunktes.

funkt. Eignung: Test Produkt/FADas E-Rezept-FdV MUSS im Anwendungsfall "Zugriffsberechtigung abrufen" zum Abrufen der Information vom TI-Flow-Fachdienst die HTTP-Operation GET /$read-eu-access-permission ausführen.
In der Response kann ein Zugriffsberechtigungsdatensatz [GEM_ERP_PR_PAR_EU_Access_Authorization_Response] enthalten sein.

