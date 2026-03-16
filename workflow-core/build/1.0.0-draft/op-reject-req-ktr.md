# KTR-Anforderungen $reject - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **KTR-Anforderungen $reject**

## KTR-Anforderungen $reject

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$reject`.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für die zurückzugebende Verordnung die HTTP-Operation POST /Task/<id>/$reject mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung durch Clientsystem zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Eine Verordnung zurückweisen" die Daten zu Verordnung, E-Rezept-Token und das Geheimnis im CS löschen.

