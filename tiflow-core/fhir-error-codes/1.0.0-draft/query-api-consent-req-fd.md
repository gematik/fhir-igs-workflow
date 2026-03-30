# Server-Anforderungen: Consent-Query - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Consent**](query-api-consent.md)
* **Server-Anforderungen: Consent-Query**

## Server-Anforderungen: Consent-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Consent-Endpunkt.

Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Consent mittels der HTTP-Operationen PUT, PATCH, oder HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zur Einwilligung ausgeführt werden können.
### POST /Consent

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abrechen, damit eine Einwilligung nicht durch Unberechtigte erteilt werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass die KVNR im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests und die KVNR in Consent.patient.identifier übereinstimmen, damit eine Einwilligung für einen Versicherten nicht durch Dritte erteilt werden kann. Im Fehlerfall muss der Http-Request mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: FHIR Profile Validation Failed

abgewiesen werden.

Der TI-Flow-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource Consent übertragene Consent Ressource gegen das FHIR-Profil Consent prüfen und bei Nicht-Konformität das Anlegen der Ressource im TI-Flow-Fachdienst mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

ablehnen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst hochgeladen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass noch keine Consent Ressource für die KVNR im ACCESS_TOKEN und Consent.category.coding.code = <Einwilligungstyp> aus URL-Parameter category gespeichert ist, um maximal eine Einwilligung für den Versicherten für jeden Einwilligungstypen zu speichern. Im Fehlerfall muss der HTTP-Request mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 409 - Conflict: error
* HTTP-Code: Code
  * 409 - Conflict: invalid
* HTTP-Code: Details Code
  * 409 - Conflict: TIFLOW_CONSENT_ALREADY_EXISTS
* HTTP-Code: Details Text
  * 409 - Conflict: -

abgewiesen werden.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent den Zeitpunkt des erfolgreichen Operationsaufrufs in der Consent-Ressource unter .dateTime mit Sekundengenauigkeit hinterlegen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent – falls bei den Prüfungen keine Fehler aufgetreten sind, welche zum Abbruch der Operation führen – die übermittelte Ressource persistieren.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent, falls bei den Prüfungen keine Fehler aufgetreten sind, welche zum Abbruch der Operation führen, die übermittelte Ressource persistieren.
### GET /Consent

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abrechen, damit die Information zur Einwilligung nicht durch Unberechtigte ausgelesen werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent die dem Versicherten zugeordneten Consent-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und in den Response aufnehmen, die in Consent.Patient.identifier die entsprechende KVNR des Versicherten referenziert haben, damit ausschließlich Versicherte ihre eigenen Information zu Einwilligungen einsehen können.
### DELETE /Consent

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent ohne Angabe ?category mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 405 - Method Not Allowed: error
* HTTP-Code: Code
  * 405 - Method Not Allowed: invalid
* HTTP-Code: Details Code
  * 405 - Method Not Allowed: TIFLOW_CONSENT_CATEGORY_REQUIRED
* HTTP-Code: Details Text
  * 405 - Method Not Allowed: -

ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am TI-Flow-Fachdienst aufrufen dürfen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abrechen, damit die Information zur Einwilligung nicht durch Unberechtigte gelöscht werden kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent prüfen, dass der für ?category angegebene Wert in den CodeSystemen
* https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType
* https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType
enthalten ist und bei fehlerhafter Prüfung den Request mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_CONSENT_CATEGORY_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, damit nur Löschrequests für definierte Consent Typen ausgeführt werden.
Es bestehen anwendungsfall-spezifische Anforderungen, welche Inhalte beim Widerruf einer Einwilligung zu löschen sind. 

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Ressource löschen, bei der Consent.patient.identifier der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests sowie Consent.category.coding.code dem in ?category übermittelten Wert entspricht.

