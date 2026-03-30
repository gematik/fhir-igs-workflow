# PVS-Anforderungen $abort - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **PVS-Anforderungen $abort**

## PVS-Anforderungen $abort

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das PVS für die Nutzung der Operation `$abort`.

Das PS der verordnenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Löschen auf dem Fachdienst auszuwählen.

Das PS der verordnenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept gelöscht werden soll und die Möglichkeit geben, das Löschen abzubrechen.

Das PS der verordnenden LEI MUSS den Anwendungsfall "UC 2.5 - E-Rezept durch Verordnenden löschen" aus [gemSysL_eRp] gemäß TAB_ILFERP_004 umsetzen. Tabelle # : TAB_ILFERP_004 – E-Rezept durch Verordnenden löschen Name E-Rezept durch Verordnenden löschen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter verordnende LEI Vorbedingung Der Nutzer hat ein E-Rezept zum Löschen markiert und das Löschen bestätigt. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Das ausgewählte E-Rezept ist vom TI-Flow-Fachdienst unwiederbringlich gelöscht. Standardablauf Task-ID und AccessCode des E-Rezepts bestimmen E-Rezept auf TI-Flow-Fachdienst löschen E-Rezept-Token in PS löschen

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden löschen" für das zu löschende E-Rezept die HTTP-Operation POST /TASK/<id>/$abort mit ACCESS_TOKEN im Authorization-Header Task-ID in URL <id> AccessCode im X-AccessCode-Header oder als URL-Parameter ?ac= ausführen.

Das PS der verordnenden LEI MUSS im Anwendungsfall "E-Rezept durch Verordnenden löschen" für das zu löschende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept löschen" die Task-ID und den AccessCode im PS löschen.
### Modulspezifische Anforderungen

