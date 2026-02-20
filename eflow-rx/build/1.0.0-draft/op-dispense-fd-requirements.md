# FD-Anforderungen $dispense - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $dispense (Dispensierinformationen bereitstellen)**](op-dispense.md)
* **FD-Anforderungen $dispense**

## FD-Anforderungen $dispense

# FD-Anforderungen: Operation $dispense

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$dispense`.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschliesslich abgebende Leistungserbringer in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit Dispensierinformationen nicht durch einen Unberechtigten eingestellt werden kann.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense das im URL-Parameter "?secret=..." uebertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret pruefen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense auf Task.status = in-progress pruefen und bei Ungleichheit mit dem HTTP-Fehlercode 403 abbrechen.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense das im HTTP-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_DispenseOperation_Input pruefen, insbesondere bei der darin enthaltenen MedicationDispense: die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier, die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und ob die Telematik-ID der Apotheke gemaess ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier uebereinstimmt, und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications geloescht werden, wenn bereits bestehende MedicationDispense(s) zum E-Rezept vorhanden sind, sodass nach Abschluss der Operation nur die neu uebermittelten MedicationDispenses gespeichert sind.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense die Referenz auf den aufgerufenen Task /Task/<id> als MedicationDispense.supportingInformation uebernehmen und die MedicationDispense, sowie die in MedicationDispense.medication referenzierte Medication, speichern.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense auch die Uebergabe mehrerer MedicationDispense-Objekte in einem validen Standard-FHIR-Bundle im HTTP-Body des Requests ermoeglichen.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense, wenn die uebermittelten Dispensierinformationen sich von den ggf. bereits zuvor zum Task gespeicherten Dispensierinformationen unterscheiden und die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "in Progress" fuer die Uebermittlung in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern.

Der E-Rezept-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels HTTP-POST-Operation ueber /Task/<id>/$dispense bei erfolgreichem Abschluss der Operation den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.dispense" und den Versicherten mit der KVNR = Task.for initiieren.

Der E-Rezept-Fachdienst DARF bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense den Status des Task bei Aufrufen der POST /Task/<id>/$dispense Operation NICHT veraendern.

