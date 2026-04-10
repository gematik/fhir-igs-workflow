# FD-Anforderungen: Abgabe von E-Rezepten im EU-Ausland - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: Abgabe von E-Rezepten im EU-Ausland**](op-eu-close.md)
* **FD-Anforderungen: Abgabe von E-Rezepten im EU-Ausland**

## FD-Anforderungen: Abgabe von E-Rezepten im EU-Ausland

### Anforderungen der Schnittstelle aus diesem Modul

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close sicherstellen, dass ausschließlich Nutzer in der Rolle: oid_ncpeh, die Operation am Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader Authorization feststellen, und bei Abweichungen die Operationmit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit der E-Rezept-Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD das im http-Body des Requests enthaltene Parameter-Objekt gegen das Profil [GEM_ERP_PR_PAR_EU_CloseOperation_Input] prüfen und im Fehlerfall die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass für die in Parameters.parameter:requestData.part:kvnr übermittelte KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = EUDISPCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_CONSENT_MISSING
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit nur Dispensierinformationen für Versicherte übermittelt werden, die eine Einwilligung erteilt haben.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass zu dem in Parameters.parameter:requestData.part:kvnr, Parameters.parameter:requestData.part:accessCode und Parameters.parameter:requestData.part:countryCode übermittelte Tripple von KVNR, Zugriffs- und Ländercode eine zeitliche gültige Zugriffsberechtigung im TI-Flow-Fachdienst existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_ACCESS_PERMISSION_INVALID
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit nur Dispensierinformationen übermittelt werden, wenn eine gültige Zugriffsberechtigung vorliegt.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass Task.status = in-progress ist und bei Ungleichheit die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass der Zeitpunkt des Aufrufes in Task.extension:lastMedicationDispense im Format "YYYY-MM-DDThh:mm:ss+zz:zz" (FHIR-instant) angelegt und gespeichert wird.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD sicherstellen, dass die zulässige Beendigung eines übermittelten Tasks im Status Task.status = completed vollzogen wird, damit der Workflow für den Versicherten als beendet und das E-Rezept somit als eingelöst dargestellt wird.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /Task/<id>/$eu-close durch den NCPeH-FD bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.eu.prescription.close" und den Versicherten mit der KVNR = Task.for initiieren.

