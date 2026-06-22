# KTR-Anforderungen $accept - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $accept (Task akzeptieren)**](op-accept.md)
* **KTR-Anforderungen $accept**

## KTR-Anforderungen $accept

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an Clientsysteme für die Nutzung der Operation `$activate`.

funkt. Eignung: HerstellererklärungDas Clientsystem Kostenträger MUSS im Anwendungsfall "Verordnung abrufen" zum Herunterladen der Verordnung die HTTP-Operation POST /Task/<id>/$accept mit
* Task-ID in URL <id>
* AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac=
ausführen.

