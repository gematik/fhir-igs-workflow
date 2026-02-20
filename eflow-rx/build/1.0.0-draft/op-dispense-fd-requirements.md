# Server-Anforderungen $dispense - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $dispense (Dispensierinformationen bereitstellen)**](op-dispense.md)
* **Server-Anforderungen $dispense**

## Server-Anforderungen $dispense

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$dispense`.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschließlich abgebende Leistungserbringer in der Rolle oid_oeffentliche_apotheke oid_krankenhausapotheke die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit Dispensierinformationen nicht durch einen Unberechtigten eingestellt werden kann.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL- Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense auf Task.status = in-progress prüfen und bei Ungleichheit mit dem HTTP-Fehlercode 403 abbrechen.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense das im http-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_DispenseOperation_Input prüfen, insbesondere bei der darin enthaltenen MedicationDispense: die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und ob die Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier übereinstimmt und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn bereits bestehende MedicationDispense(s) zum E-Rezept vorhanden sind, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense die Referenz auf den aufgerufenen Task /Task/<id> als MedicationDispense.supportingInformation übernehmen und die MedicationDispense, sowie die in MedicationDispense.medication referenzierte Medication, speichern.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense auch die Übergabe mehrerer MedicationDispense-Objekte in einem validen Standard- FHIR-Bundle im http-Body des Requests ermöglichen.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense , wenn die übermittelten Dispensierinformationen sich von den ggf. bereits zuvor zum Task gespeicherten Dispensierinformationen unterscheiden und die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "in Progress" für die Übermittlung in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels HTTP-POST-Operation über /Task/<id>/$dispense bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.dispense" und den Versicherten mit der KVNR = Task.for initiieren.

Der E-Rezept-Fachdienst DARF bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense den Status des Task bei Aufrufen der POST /Task/<id>/$dispense Operation NICHT verändern.

