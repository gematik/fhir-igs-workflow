# FdV-Anforderungen $abort - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **FdV-Anforderungen $abort**

## FdV-Anforderungen $abort

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an das E-Rezept-FdV für die Nutzung der Operation `$abort`.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen" dem Nutzer einen Hinweis geben, wie sich das Löschen auf die Informationen zum E-Rezept in der elektronischen Patientenakte auswirkt.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen" es dem Nutzer ermöglichen, ein E-Rezept zum Löschen auszuwählen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen", falls das E-Rezept-FdV die Funktionalität für Abrechnungsinformationen unterstützt, wenn der Nutzer ein E-Rezept mit Kostenträgertyp (Coverage.type.coding.code) "PKV" zum Löschen ausgewählt hat und für das E-Rezept noch keine Abrechnungsinformationen bereitgestellt wurden, eine Warnung anzeigen, dass ein Bereitstellen der Abrechnungsinformationen zum E-Rezept nach dem Löschen des E-Rezepts nicht mehr möglich ist.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen" vom Nutzer eine Bestätigung einholen, dass das ausgewählte E-Rezept gelöscht werden soll und die Möglichkeit geben, das Löschen abzubrechen.

Das E-Rezept-FdV MUSS den Anwendungsfall "UC 3.2 - E-Rezept durch Versicherten löschen" aus [gemSysL_eRp] gemäß TAB_FdVERP_008 umsetzen. Tabelle # : TAB_FdVERP_008 – E-Rezept löschen Name E-Rezept löschen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Versicherter Vorbedingung Der Nutzer hat ein zum Löschen markiert und das Löschen bestätigt. Der Nutzer hat sich gegenüber der TI authentisiert. Nachbedingung Das ausgewählte E-Rezept ist vom E-Rezept-Fachdienst unwiederbringlich gelöscht. Standardablauf Task-ID und AccessCode des E-Rezepts bestimmen E-Rezept löschen E-Rezept-Token löschen

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte löschen" für das zu löschende E-Rezept die HTTP-Operation POST /Task/<id>/$abort des E-Rezept-Fachdienstes mit ACCESS_TOKEN im Authorization-Header Task-ID in URL <id> optional: AccessCode im x-AccessCode-Header ausführen.

Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept löschen" für das zu löschende E-Rezept nach erfolgreichem Aufruf der Operation "Ein E-Rezept löschen" die Daten zum E-Rezept-Token lokal löschen.

