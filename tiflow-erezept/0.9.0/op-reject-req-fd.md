# FD-Anforderungen $reject - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **FD-Anforderungen $reject**

## FD-Anforderungen $reject

Diese Seite enthält die workflowtyp-spezifischen normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$reject`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "in-progress" ist, damit die Verordnung nur zurückgegeben werden kann, wenn sich die Verordnung in Belieferung befindet.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject die externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret löschen und den Status des referenzierten Tasks auf Task.status = ready setzen, damit nachfolgende Zugriffe auf diesen Datensatz durch Berechtigte in Kenntnis des AccessCodes erfolgen können.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI löschen.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.reject" und den Versicherten mit der KVNR = Task.for initiieren.
### Modulspezifische Anforderungen

Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am Fachdienst aufrufen, damit das E-Rezept nicht durch einen Unberechtigten zurückgewiesen werden kann.

Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject die Dispensierinformationen, falls welche vorhanden sind, löschen:
* Medication, die aus der MedicationDispense referenziert wird --> löschen
* MedicationDispense zum dazugehörigen Task --> löschen
* Task.extension:lastMedicationDispense --> löschen

Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject, wenn bereits Dispensierinformationen im E-Rezept-Fachdienst zum Task gespeichert wurden, die Daten für die Löschinformation dieser Dispensierinformationen für die Übermittlung in den ePA Medication Service bereitstellen.

