# Server-Anforderungen $reject - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **Server-Anforderungen $reject**

## Server-Anforderungen $reject

Diese Seite enthält die workflowtyp-spezifischen normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$reject`.

Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am Fachdienst aufrufen, damit das E-Rezept nicht durch einen Unberechtigten zurückgewiesen werden kann.

Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject die Dispensierinformationen, falls welche vorhanden sind, löschen:
* Medication, die aus der MedicationDispense referenziert wird --> löschen
* MedicationDispense zum dazugehörigen Task --> löschen
* Task.extension:lastMedicationDispense --> löschen

Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject, wenn bereits Dispensierinformationen im E-Rezept-Fachdienst zum Task gespeichert wurden, die Daten für die Löschinformation dieser Dispensierinformationen für die Übermittlung in den ePA Medication Service bereitstellen.

