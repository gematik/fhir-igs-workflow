# FD-Anforderungen $close - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $close (Task schließen)**](op-close.md)
* **FD-Anforderungen $close**

## FD-Anforderungen $close

# FD-Anforderungen: Operation $close

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$close`.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks fuer ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschliesslich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke, oid_kostentraeger die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit der E-Rezept-Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation ueber /Task/<id>/$close das im URL-Parameter "?secret=..." uebertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = in-progress pruefen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks fuer ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> mit Flowtype 160, 166, 169, 200 oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulaessige Abgabeinformationen: Fuer diesen Workflow sind nur Abgabeinformationen fuer Arzneimittel zulaessig." zurueckgegeben werden.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks fuer ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> mit Flowtype 162 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulaessige Abgabeinformationen: Fuer diesen Workflow sind nur Abgabeinformationen fuer digitale Gesundheitsanwendungen zulaessig." zurueckgegeben werden.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close erlauben, dass der Aufruf ohne Uebergabe einer MedicationDispense im Request Body stattfindet. Der E-Rezept-Fachdienst MUSS in dem Fall sicherstellen, dass eine MedicationDispense fuer diesen Task existiert. Der E-Rezept-Fachdienst MUSS, falls keine MedicationDispense zum dazugehoerigen Task existiert, mit dem Fehler 403 abbrechen. Im Fehlerfall ist die Meldung "Abschluss des Workflows konnte nicht durchgefuehrt werden. Dispensierinformationen wurden nicht bereitgestellt." im OperationOutcome zu uebermitteln.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close das im HTTP-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input pruefen, insbesondere bei der darin enthaltenen MedicationDispense: die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier, die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und ob die Telematik-ID der Apotheke gemaess ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier uebereinstimmt, und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications geloescht werden, wenn der Client im Aufruf eine neue MedicationDispense uebermittelt, sodass nach Abschluss der Operation nur die neu uebermittelten MedicationDispenses gespeichert sind.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close die Referenz auf den aufgerufenen Task /Task/<id> als MedicationDispense.supportingInformation uebernehmen und die MedicationDispense, sowie die in MedicationDispense.medication referenzierte Medication, speichern.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close auch die Uebergabe mehrerer MedicationDispense-Objekte in einem validen Standard-FHIR-Bundle im HTTP-Body des Requests ermoeglichen.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern, wenn ein MedicationDispense Objekt im Aufruf uebergeben wird.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "completed" fuer die Uebermittlung in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation ueber /Task/<id>/$close, wenn eine MedicationDispense Ressource uebermittelt wird und die Operation erfolgreich abgeschlossen werden kann, den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.close" und den Versicherten mit der KVNR = Task.for initiieren.

Der E-Rezept-Fachdienst MUSS die zulaessige Beendigung eines Tasks mittels /Task/<id>/$close-Operation im Status Task.status = completed vollziehen, damit der Workflow fuer den Versicherten als beendet und das E-Rezept somit als eingeloest dargestellt wird.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close ein Quittungsbundle gemaess des FHIR-Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle mit folgenden Informationen erstellen: Telematik-ID der aufrufenden Apotheke als Beneficiary in die erxComposition, Zeitstempel des Statuswechsel des Tasks "in-progress" in event.period.start, aktueller Zeitstempel in event.period.end, Identifier PrescriptionID des Task als identifier des Quittungs-Bundle, Device-Ressource mit Fachdienstinformationen als Autor der Signatur, Base64Binary-Ressource mit Binary.data = <base64-codierter Hashwert aus der QES-Signatur des dem Task zugrunde liegenden Verordnungsdatensatzes> und contentType = "application/octet-stream". Dieses Quittungs-Bundle MUSS mit der Signaturidentitaet des Fachdienstes ID.FD.OSIG gemaess RFC5652 mit Profil CAdES-BES im Enveloping signiert werden. In die Signatur wird die letzte OCSP-Antwort der regelmaessigen Statuspruefung des Signaturzertifikats C.FD.OSIG eingebettet. Das Signatur-Ergebnis wird als dss:Base64Signature-Objekt in Bundle.signature eingebettet und dieses Quittungs-Bundle mit Referenz in Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 gespeichert sowie als Response des HTTP-Requests an den Aufrufer zurueckgegeben, damit der Apotheker einen Nachweis ueber den ordnungsgemaessen Abschluss des E-Rezept-Workflows als Quittung erhaelt.

Der E-Rezept-Fachdienst MUSS, falls keine OCSP-Response fuer das Signaturzertifikat der Quittung vorliegt bzw. die letzte vorliegende OCSP-Response aelter als 24 h ist, die Operation mit dem Fehler 503 abbrechen.

