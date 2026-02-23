# Client-Anforderungen $dispense - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $dispense (Dispensierinformationen bereitstellen)**](op-dispense.md)
* **Client-Anforderungen $dispense**

## Client-Anforderungen $dispense

Diese Seite enthält die normativen Anforderungen an den Client des E-Rezept-Fachdienst für die Operation `$dispense`.

Mit diesem Anwendungsfall stellt das PS der abgebenden LEI Dispensierinformationen für den Versicherten bereit, die dann vom Versicherten auf seinem E-Rezept-FdV heruntergeladen werden können. Das E-Rezept-FdV kann dem Versicherten außerdem darstellen, dass das E-Rezept beliefert wurde bevor der Workflow des E-Rezepts durch den Anwendungsfall “Quittung abrufen” beendet wird.

Dieser Anwendungsfall kann so lange wiederholt werden, so lange sich der Task zum E-Rezept im Status “in Abgabe (gesperrt)” befindet. Bei der wiederholten Übermittlung wird die zuvor übermittelte Dispensierinformation überschrieben. D.h. es muss immer die vollständige Dispensierinformation übermittelt werden.

A_24289 A_24290 A_24291-01 A_26346

