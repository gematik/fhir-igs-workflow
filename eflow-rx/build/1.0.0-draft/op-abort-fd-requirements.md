# Server-Anforderungen $abort - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **Server-Anforderungen $abort**

## Server-Anforderungen $abort

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$abort`.

Der E-Rezept-Fachdienst MUSS das Löschen eines E-Rezepts mit dem Flowtype 169 oder 209 über den mittels der <id> adressierten /Task/<id>/$abort verhindern und die Operation mit dem HTTP-Fehlercode 403 abweisen, wenn der Status des adressierten Tasks ungleich "completed" ist und die Rolle des aufrufenden Nutzers der folgenden Rollen entspricht: oid_versicherter damit kein Versicherter ein E-Rezept aus einem Workflow mit Workflowsteuerung durch Leistungserbringer (169, 209) löscht, das nicht bereits beliefert wurde.

Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/<id>/$abort durch eine verordnende oder abgebende Leistungserbringerinstitution die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/$abort durch einen Versicherten, wenn Task.status = ready, die Daten für die Löschinformation des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.

