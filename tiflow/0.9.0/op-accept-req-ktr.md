# KTR-Anforderungen $accept - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $accept (Task akzeptieren)**](op-accept.md)
* **KTR-Anforderungen $accept**

## KTR-Anforderungen $accept

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.

Das Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung abrufen" zum Herunterladen des E-Rezepts die HTTP-Operation POST /Task/<id>/$accept mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id>
* AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac=
ausführen.

