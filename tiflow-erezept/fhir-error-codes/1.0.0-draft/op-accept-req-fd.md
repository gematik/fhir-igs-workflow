# FD-Anforderungen $accept - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $accept (Task akzeptieren)**](op-accept.md)
* **FD-Anforderungen $accept**

## FD-Anforderungen $accept

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$accept`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$accept`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept, wenn der referenzierte /Task/<id> existiert, jedoch kein AccessCode im Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode vorhanden ist oder der Status Task.status = cancelled ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 410 - Gone: error
* HTTP-Code: Code
  * 410 - Gone: invalid
* HTTP-Code: Details Code
  * 410 - Gone: TIFLOW_TASK_DELETED
* HTTP-Code: Details Text
  * 410 - Gone: -

abbrechen, damit die abgebende Institution den Versicherten über die zwischenzeitliche Löschung des Datensatzes in Kenntnis setzen kann.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept den im HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCodeTask.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_ACCESSCODE_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept, wenn der StatusTask.status = "completed", Task.status = "in-progress" oder Task.status = "draft" ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 409 - Conflict: error
* HTTP-Code: Code
  * 409 - Conflict: invalid
* HTTP-Code: Details Code
  * 409 - Conflict: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 409 - Conflict: %1

abbrechen, damit ein bereits in Abgabe befindliches oder beliefertes E-Rezept nicht durch eine zweite Apotheke bearbeitet werden kann.

Der TI-Flow-Fachdienst MUSS in OperationOutcome die Information zum Status angeben: "Task has invalid status completed", "Task has invalid status in-progress" bzw. "Task has invalid status draft".

Der TI-Flow-Fachdienst MUSS in OperationOutcome zusätzlich die Information "Task is processed by requesting institution" ergänzen, wenn Task.status = "in-progress" und die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI mit der Telematik-ID aus dem ACCESS_TOKEN übereinstimmt.
Hinweis: Die Informationen in OperationOutcome werden ggf. als mehrere Strings in einem Array übermittelt.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept, wenn das Ende der Einlösefrist (Task.ExpiryDate) zu einem früherem Zeitpunkt als das aktuelle Datum liegt, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_EXPIRED
* HTTP-Code: Details Text
  * 403 - Forbidden: Verordnung bis %d einlösbar.

abbrechen, da Verordnungen nur bis Ende der Einlösefrist abgerufen werden dürfen.

Der TI-Flow-Fachdienst MUSS im Falle dieses Fehlers im OperationOutcome des Response das Ende der Einlösefrist wie folgt anzugeben: "Verordnung bis <Datum> einlösbar.", wobei <Datum> der Wert Task.ExpiryDate im Format "dd.mm.yyyy" ist.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept den Status des Tasks auf Task.status = "in-progress" setzen, eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret hinzufügen und den Task im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurückgeben, damit das E-Rezept für die nachfolgende Bearbeitung durch den abrufenden Apotheker reserviert ist.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept für den referenzierten Task die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen kann.
Die Telematik-ID ist im Task wie folgt zu hinterlegen:

* Task.owner.identifier.system= “https://gematik.de/fhir/sid/telematik-id”
* Task.owner.identifier.value= $Telematik-ID der Apotheke gemäß https://simplifier.net/basisprofil-de-r4/identifiertelematikid

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept bei erfolgreichem Abschluss der Operation den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.accept" und den Versicherten mit der KVNR = Task.for initiieren.
### Modulspezifische Anforderungen

Der TI-Flow-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden können.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zu einem späteren Zeitpunkt als das aktuelle Datum liegt, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_EREZEPT_MVO_NOT_VALID
* HTTP-Code: Details Text
  * 403 - Forbidden: Teilverordnung zur Mehrfachverordnung %1 ist ab %2 einlösbar.

abbrechen, da Teilverordnungen von Mehrfachverordnungen erst ab Beginn der Einlösefrist abgerufen werden dürfen. Im Falle dieses Fehlers ist im OperationOutcome des Response der Beginn der Einlösefrist wie folgt anzugeben: "Teilverordnung zur Mehrfachverordnung <MVO Referenz> ist ab <Datum> einlösbar.", wobei <MVO Referenz> der Wert MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value sowie <Datum> der Wert MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start im Format "dd.mm.yyyy" ist.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept, wenn der Verordnungsdatensatz Coverage.type.coding.code = "PKV" enthält und für die KVNR des begünstigten Versicherten (Task.for) eine Consent Ressource mit Consent.patient.identifier = KVNR und Consent.category.coding.code = "CHARGCONS" existiert, das Response Bundle um die Consent Ressource ergänzen, um der abgebenden LEI die Information zu übermitteln, dass der Versicherte eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem TI-Flow-Fachdienst erteilt hat.

