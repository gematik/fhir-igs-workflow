# FD-Anforderungen $abort - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **FD-Anforderungen $abort**

## FD-Anforderungen $abort

# FD-Anforderungen: Operation $abort

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$abort`.

Der E-Rezept-Fachdienst MUSS das Loeschen eines E-Rezepts mit dem Flowtype 169 oder 209 ueber den mittels der <id> adressierten /Task/<id>/$abort verhindern und die Operation mit dem HTTP-Fehlercode 403 abweisen, wenn der Status des adressierten Tasks ungleich "completed" ist und die Rolle des aufrufenden Nutzers oid_versicherter entspricht, damit kein Versicherter ein E-Rezept aus einem Workflow mit Workflowsteuerung durch Leistungserbringer (169, 209) loescht, das nicht bereits beliefert wurde.

Der E-Rezept-Fachdienst MUSS beim Loeschen eines E-Rezepts mittels POST /Task/{id}/$abort durch eine verordnende oder abgebende Leistungserbringerinstitution die Daten fuer die Loeschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS beim Loeschen eines E-Rezepts mittels POST /Task/$abort durch einen Versicherten, wenn Task.status = ready, die Daten fuer die Loeschinformation des Verordnungsdatensatzes fuer die Uebermittlung in den ePA Medication Service bereitstellen.

