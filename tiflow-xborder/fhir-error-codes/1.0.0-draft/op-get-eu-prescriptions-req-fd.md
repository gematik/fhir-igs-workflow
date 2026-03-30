# FD-Anforderungen: E-Rezepte zur Einlösung im EU-Ausland abrufen - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen**](op-get-eu-prescriptions.md)
* **FD-Anforderungen: E-Rezepte zur Einlösung im EU-Ausland abrufen**

## FD-Anforderungen: E-Rezepte zur Einlösung im EU-Ausland abrufen

### Anforderungen der Schnittstelle aus diesem Modul

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions sicherstellen, dass ausschließlich Nutzer in der Rolle: oid_ncpeh, die Operation am Fachdienst aufrufen dürfen und die Rolle professionOID des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader Authorization feststellen, und bei Abweichungen mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abrechen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden können.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD das im http-Body des Requests enthaltene Parameter-Objekt gegen das Profil [GEM_ERP_PR_PAR_EU_GET_Prescription_EU_Input] prüfen und im Fehlerfall die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass für die in Parameters.parameter:requestData.part:kvnr übermittelte KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = EUDISPCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_CONSENT_REQUIRED
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit nur Verordnungsdaten für Versicherte übermittelt werden, die eine Einwilligung erteilt haben.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass zu dem in Parameters.parameter:requestData.part:kvnr, Parameters.parameter:requestData.part:accessCode und Parameters.parameter:requestData.part:countryCode übermittelte Tripple von KVNR, Zugriffs- und Ländercode eine zeitliche gültige Zugriffsberechtigung im TI-Flow-Fachdienst existiert und bei fehlgeschlagener Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_ACCESS_PERMISSION_INVALID
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit nur Verordnungsdaten für Versicherte übermittelt werden, wenn eine gültige Zugriffsberechtigung vorliegt.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass nur Ressourcen eines Tasks bereitgestellt werden, die folgende Kriterien erfüllen: Task.for = KVNR für die KVNR aus Parameters.parameter:requestData.part:kvnr Task.ExpiryDate nicht vor dem aktuellen Datum Falls MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true, dann MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start nicht nach dem aktuellen Datum Task.extension:eu-isRedeemableByProperties = true Task.extension:eu-isRedeemableByPatientAuthorization = true damit eine Apotheke im europäischen Ausland nur einlösbare E-Rezepte abrufen kann.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions?_count=1 durch den NCPeH-FD sicherstellen, dass nur eine Ressource eines Tasks bereitgestellt wird, die folgendes Kriterium erfüllt: Task.status = ready.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass wenn Parameters.parameter:requestData.part:prescription-id leer ist, nur Ressourcen eines Tasks bereitgestellt werden, die folgendes Kriterium erfüllen: Task.status = ready.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, nur Ressourcen eines Tasks bereitgestellt werden, die folgendes Kriterium erfüllen: Task.status = ready ODER (Task.status = in-progress UND Task.owner = Telematik-ID aus dem ACCESS_TOKEN).

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass die FHIR-Ressourcen zu einlösbaren Verordnungen in einem übergreifenden FHIR-Bundle gruppiert werden, absteigend sortiert nach dem medicationrequest.authored-on Datum, wobei das Bundle pro Verordnung ein FHIR-Bundle vom Typ https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle enthält, mit der unter https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId abgelegten Task-ID sowie den im MedicationRequest referenzierten Ressourcen MedicationRequest, Medication, Patient, Practitioner und Coverage.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions?_count=1 durch den NCPeH-FD sicherstellen, dass die Ressourcen der zuletzt ausgestellten einlösbaren Verordnung zurückgegeben werden und falls keine Verordnung vorliegt, mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 404 - Not Found: error
* HTTP-Code: Code
  * 404 - Not Found: invalid
* HTTP-Code: Details Code
  * 404 - Not Found: TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND
* HTTP-Code: Details Text
  * 404 - Not Found: -

antworten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass wenn Parameters.parameter:requestData.part:prescription-id leer ist, die Ressourcen aller einlösbaren Verordnung zurückgegeben werden und falls keine Verordnung vorliegt, mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 404 - Not Found: error
* HTTP-Code: Code
  * 404 - Not Found: invalid
* HTTP-Code: Details Code
  * 404 - Not Found: TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND
* HTTP-Code: Details Text
  * 404 - Not Found: -

antworten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD sicherstellen, dass wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, die Ressourcen aller einlösbaren Verordnung zurückgegeben werden, deren Task-IDs in Parameters.parameter:requestData.part:prescription-id enthalten sind, und falls keine Verordnung vorliegt, mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 404 - Not Found: error
* HTTP-Code: Code
  * 404 - Not Found: invalid
* HTTP-Code: Details Code
  * 404 - Not Found: TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND
* HTTP-Code: Details Text
  * 404 - Not Found: -

antworten.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD, wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, für alle Tasks deren Task-IDs in Parameters.parameter:requestData.part:prescription-id enthalten sind, den Status auf Task.status = in-progress setzen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD, wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, für alle Tasks deren Task-IDs in Parameters.parameter:requestData.part:prescription-id enthalten sind, eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:Secret als [Identifier Profile for Secret (GEM_ERP_PR_Secret)] hinzufügen.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD, wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, für alle Tasks deren Task-IDs in Parameters.parameter:requestData.part:prescription-id enthalten sind, die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD bei erfolgreichem Abschluss der Operation, wenn Parameters.parameter:requestData.part:prescription-id leer ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.eu.prescription.get" und den Versicherten mit der KVNR = Task.for für jeden Task initiieren.

Der TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation des Endpunkts /$get-eu-prescriptions durch den NCPeH-FD bei erfolgreichem Abschluss der Operation, wenn Parameters.parameter:requestData.part:prescription-id nicht leer ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.eu.prescription.redeem" und den Versicherten mit der KVNR = Task.for für jeden Task initiieren.

