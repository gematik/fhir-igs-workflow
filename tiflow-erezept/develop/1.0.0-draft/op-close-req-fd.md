# FD-Anforderungen $close - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $close (Task schließen)**](op-close.md)
* **FD-Anforderungen $close**

## FD-Anforderungen $close

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$close das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_SECRET_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$close den im referenzierten Task gespeicherten Status Task.status prüfen und, wenn Task.status ungleich "in-progress" ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abbrechen, damit der Workflow nur abgeschlossen werden kann, wenn sich die Verordnung in Belieferung befindet.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close das im HTTP-Body des Requests enthaltene Parameters-Objekt gegen das Profil https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input prüfen, insbesondere bei der darin enthaltenen MedicationDispense:
* die Korrektheit der Rezept-ID https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId als MedicationDispense.identifier,
* die KVNR des Versicherten im referenzierten Task (Task.for) gegen KVNR in MedicationDispense.subject:identifier und
* ob die Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in MedicationDispense.performer.actor:identifier übereinstimmt
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

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close die Referenz auf den aufgerufenen Task Task/<id> als MedicationDispense.supportingInformation übernehmen und die MedicationDispense, sowie die in MedicationDispense.medication referenzierte Medication, speichern.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close den Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) anlegen und speichern, wenn ein MedicationDispense Objekt im Aufruf übergeben wird.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close für den referenzierten Task die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen können.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$close, wenn eine MedicationDispense Ressource übermittelt wird und die Operation erfolgreich abgeschlossen werden kann, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.close" und den Versicherten mit der KVNR = Task.for initiieren.

Der TI-Flow-Fachdienst MUSS die zulässige Beendigung eines Tasks mittels /Task/<id>/$close-Operation im StatusTask.status = "completed" vollziehen, damit der Workflow für den Versicherten als beendet und die Verordnung somit als eingelöst dargestellt wird.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close ein Quittungsbundle gemäß des FHIR-Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle mit folgenden Informationen erstellen:
* Telematik-ID der aufrufenden Apotheke als Beneficiary in die GEM_ERP_PR_Composition
* Zeitstempel des Statuswechsel des Tasks "in-progress" in event.period.start
* aktueller Zeitstempel in event.period.end
* Identifier PrescriptionID des Task als identifier des Quittungs-Bundle
* Device-Ressource mit Fachdienstinformationen als Autor der Signatur
* Base64Binary-Ressource mit Binary.data = <base64-codierter Hashwert aus der QES Signatur des dem Task zugrunde liegenden Verordnungsdatensatzes> und contentTpe = "application/octet-stream"
und dieses Quittungs-Bundle mit der Signaturidentität des Fachdienstes ID.FD.OSIG gemäß [RFC5652] mit Profil CAdES-BES ([CAdES]) im Enveloping signieren. In die Signatur wird die letzte OCSP-Antwort der regelmäßigen Statusprüfung des Signaturzertifikats C.FD.OSIG eingebettet. Das Signatur-Ergebnis wird als dss:Base64Signature-Objekt in Bundle.signature eingebettet und dieses Quittungs-Bundle mit Referenz in Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 gespeichert sowie als Response des http-Requests an den Aufrufer zurückgeben, damit die abgebende LEI einen Nachweis über den ordnungsgemäßen Abschluss des E-Rezept-Workflows als Quittung erhält.

Der TI-Flow-Fachdienst MUSS, falls keine OCSP-Response für das Signaturzertifikat der Quittung vorliegt bzw. die letzte vorliegende OCSP-Response älter als 24h ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 503 - Service Unavailable: error
* HTTP-Code: Code
  * 503 - Service Unavailable: transient
* HTTP-Code: Details Code
  * 503 - Service Unavailable: TIFLOW_SIGNATURE_NO_OCSP_RESPONSE
* HTTP-Code: Details Text
  * 503 - Service Unavailable: -

abbrechen.
### Modulspezifische Anforderungen

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am Fachdienst aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> mit Flowtype 160, 166, 169, 200, oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht, und andernfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_MEDICATION_DISPENSE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für Arzneimittel zulässig

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close erlauben, dass der Aufruf ohne Übergabe einer MedicationDispense im Request Body stattfindet.Der E-Rezept-Fachdienst MUSS in dem Fall sicherstellen, dass eine MedicationDispense für diesen Task existiert.

Der E-Rezept-Fachdienst MUSS, falls keine MedicationDispense zum dazugehörigen Task existiert, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_MEDICATION_DISPENSE_MISSING
* HTTP-Code: Details Text
  * 403 - Forbidden: Abschluss des Workflows konnte nicht durchgeführt werden. Dispensierinformationen wurden nicht bereitgestellt.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn der Client im Aufruf eine neue MedicationDispense übermittelt, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close auch die Übergabe mehrerer MedicationDispense-Objekte in einem validen GEM_ERP_PR_PAR_CloseOperation_Input-Objekt im http-Body des Requests ermöglichen.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "completed" für die Übermittlung in den ePA Medication Service bereitstellen.

Der TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.
Der Implementation Guide zur Übermittlung des digitalen Durchschlags an den BfArM Webdienst ist im [gemIG_TIFlow_bfarm] beschrieben.

