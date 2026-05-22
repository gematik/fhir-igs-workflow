# AVS-Anforderungen $reject - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **AVS-Anforderungen $reject**

## AVS-Anforderungen $reject

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$reject`.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Zurückgeben auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept zurückgegeben werden soll und die Möglichkeit geben, das Zurückgeben abzubrechen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden zurückgeben" für das zurückzugebende E-Rezept die HTTP-Operation POST /Task/<id>/$reject mit
* ACCESS_TOKEN im Authorization-Header
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret=
ausführen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden zurückgeben" für das zurückzugebende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept zurückweisen" die Daten zum E-Rezept, E-Rezept-Token und das Geheimnis im PS löschen.

