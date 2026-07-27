# FD-Anforderungen $dispense - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $dispense (Dispensierinformationen bereitstellen)**](op-dispense.md)
* **FD-Anforderungen $dispense**

## FD-Anforderungen $dispense

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$dispense`.

### Anforderungen aus der Core Spezifikation

Für diese Seite bestehen keine Anforderungen aus der Core Spezifikation.

### Modulspezifische Anforderungen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense auf den in der URL referenzierten /Task/<id> die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in einer der Rollen
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit Dispensierinformationen nicht durch einen Unberechtigten eingestellt werden kann.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL- Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_SECRET_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense auf Task.status = in-progress prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense das im http-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_DispenseOperation_Input prüfen, insbesondere bei der darin enthaltenen MedicationDispense:
* die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier 
* die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier 
* und ob der zeta-user-info.identifier des Nutzers (Telematik-ID) mit dem Wert in MedicationDispense.performer.actor:identifier übereinstimmt 
und im Fehlerfall die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn bereits bestehende MedicationDispense(s) zum E-Rezept vorhanden sind, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense eine oder mehrere vom Client bereitgestellten MedicationDispenses, sowie die in MedicationDispense.medication referenzierte Medication, speichern.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense , wenn die übermittelten Dispensierinformationen sich von den ggf. bereits zuvor zum Task gespeicherten Dispensierinformationen unterscheiden und die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "in Progress" für die Übermittlung in den ePA Medication Service bereitstellen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$dispense für den referenzierten Task den zeta-user-info.identifier des Nutzers (Telematik-ID) in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen können.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei der Bereitstellung von Dispensierinformationen mittels HTTP-POST-Operation über /Task/<id>/$dispense bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.dispense" und den Versicherten mit der KVNR = Task.for initiieren.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst DARF bei der Bereitstellung von Dispensierinformationen mittels POST /Task/<id>/$dispense den Status des Task bei Aufrufen der POST /Task/<id>/$dispense Operation NICHT verändern.

