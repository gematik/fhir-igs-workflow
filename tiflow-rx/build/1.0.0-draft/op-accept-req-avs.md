# AVS-Anforderungen $accept - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $accept (Task akzeptieren)**](op-accept.md)
* **AVS-Anforderungen $accept**

## AVS-Anforderungen $accept

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$accept`.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept abrufen" zum Herunterladen des E-Rezepts die HTTP-Operation POST /Task/<id>/$accept mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id>
* AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac=
ausführen.
### Modulspezifische Anforderungen

