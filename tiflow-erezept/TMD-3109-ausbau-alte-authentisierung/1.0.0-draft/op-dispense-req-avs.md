# AVS-Anforderungen $dispense - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $dispense (Dispensierinformationen bereitstellen)**](op-dispense.md)
* **AVS-Anforderungen $dispense**

## AVS-Anforderungen $dispense

Diese Seite enthält die normativen Anforderungen an das AVS für die Operation `$dispense`.

### Anforderungen aus der Core Spezifikation

Für diese Seite bestehen keine Anforderungen aus der Core Spezifikation.

### Modulspezifische Anforderungen

Mit diesem Anwendungsfall stellt das PS der abgebenden LEI Dispensierinformationen für den Versicherten bereit, die dann vom Versicherten auf seinem E-Rezept-FdV heruntergeladen werden können. Das E-Rezept-FdV kann dem Versicherten außerdem darstellen, dass das E-Rezept beliefert wurde bevor der Workflow des E-Rezepts durch den Anwendungsfall “Quittung abrufen” beendet wird.

Dieser Anwendungsfall kann so lange wiederholt werden, so lange sich der Task zum E-Rezept im Status “in-progress” befindet. Bei der wiederholten Übermittlung wird die zuvor übermittelte Dispensierinformation überschrieben. D.h. es muss immer die vollständige Dispensierinformation übermittelt werden.

Das PS der abgebenden LEI erzeugt die Dispensierinformationen nach den Vorgaben aus [Erstellen von Dispensierinformationen](./menu-technische-umsetzung-dispensierinformationen.md).

Das PS der abgebenden LEI MUSS im Anwendungsfall "Dispensierinformationen bereitstellen" für das abgegebene E-Rezept die HTTP-Operation POST /Task/<id>/$dispense mit
* ACCESS_TOKEN im Authorization-Header 
* Task-ID in URL <id> 
* Geheimnis in URL-Parameter ?secret= 
* GEM_ERP_PR_PAR_DispenseOperation_Input-Objekt 
ausführen.

