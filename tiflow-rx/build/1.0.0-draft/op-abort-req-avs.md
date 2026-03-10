# AVS-Anforderungen $abort - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **AVS-Anforderungen $abort**

## AVS-Anforderungen $abort

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das AVS für die Nutzung der Operation `$abort`.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, ein E-Rezept zum Löschen auf dem Fachdienst auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept gelöscht werden soll, und die Möglichkeit geben, das Löschen abzubrechen.

Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.3 - E-Rezept durch Abgebenden löschen" aus [gemSysL_eRp] gemäß TAB_ILFERP_009 umsetzen. Tabelle # : TAB_ILFERP_009 – E-Rezept durch Abgebenden löschen Name E-Rezept durch Abgebenden löschen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat das E-Rezept vom E-Rezept-Fachdienst heruntergeladen. Der Nutzer hat ein E-Rezept zum Löschen markiert und das Löschen bestätigt. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Das ausgewählte E-Rezept ist vom E-Rezept-Fachdienst unwiederbringlich gelöscht. Standardablauf Task-ID und Geheimnis des E-Rezepts bestimmen E-Rezept auf Fachdienst löschen E-Rezept-Token in PS löschen

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden löschen" für das zu löschende E-Rezept die HTTP-Operation POST /Task/<id>/$abort mit ACCESS_TOKEN im Authorization-Header Task-ID in URL <id> Geheimnis in URL Parameter ?secret= ausführen.

Das PS der abgebenden LEI MUSS im Anwendungsfall "E-Rezept durch Abgebenden löschen" für das zu löschende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept löschen" die Daten zum E-Rezept-Token und das Geheimnis im PS löschen.
### Modulspezifische Anforderungen

