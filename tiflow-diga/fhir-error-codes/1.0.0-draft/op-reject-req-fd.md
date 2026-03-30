# Anforderungen an den TI-Flow-Fachdienst für die $reject-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $reject**](op-reject.md)
* **Anforderungen an den TI-Flow-Fachdienst für die $reject-Operation**

## Anforderungen an den TI-Flow-Fachdienst für die $reject-Operation

Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$reject`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: forbidden
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_SECRET_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: 

abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 412 - Precondition Failed: error
* HTTP-Code: Code
  * 412 - Precondition Failed: invalid
* HTTP-Code: Details Code
  * 412 - Precondition Failed: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 412 - Precondition Failed: Task has invalid status.

abbrechen, wenn Task.status ungleich "in-progress" ist, damit die Verordnung nur zurückgegeben werden kann, wenn sich die Verordnung in Belieferung befindet.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject die externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret löschen und den Status des referenzierten Tasks auf Task.status = ready setzen, damit nachfolgende Zugriffe auf diesen Datensatz durch Berechtigte in Kenntnis des AccessCodes erfolgen können.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI löschen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$reject bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.reject" und den Versicherten mit der KVNR = Task.for initiieren.
### Modulspezifische Anforderungen

Der TI-Flow-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 162 HTTP-POST-Operation über /Task/<id>/$reject die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
* oid_kostentraeger
die Operation am Fachdienst aufrufen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abrechen, damit die Verordnung nicht durch einen Unberechtigten zurückgewiesen werden kann.

