# FD-Anforderungen: Task-Query - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Task**](query-api-task.md)
* **FD-Anforderungen: Task-Query**

## FD-Anforderungen: Task-Query

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die `Task`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-query-api.html)

### Modulspezifische Anforderungen

#### GET /Task

##### Workflowspezifische Anforderungen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst DARF den AccessCode beim Zugriff durch den Versicherten NICHT an das E-Rezept-Frontend des Versicherten herausgeben, wenn der Flowtype des Tasks den Wert für die Workflowsteuerung durch Leistungserbringer enthält (169, 209).
#### GET /Task/

##### Workflowspezifische Anforderungen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/<id> durch einen Versicherten, wenn Task.extension:flowType = 169 oder 209 und der zeta-user-info.identifier des Nutzers (KVNR) ungleich der KVNR in Task.for ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: SVC_IDENTITY_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)

abbrechen.
#### PATCH /Task

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /Task/<id> Ressource durch einen Versicherten auf die Ressource übertragene Parameters Ressource gegen das FHIR-Profil GEM_ERPEU_PR_PAR_PATCH_Task_Input prüfen und bei Nicht-Konformität die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: SVC_VALIDATION_FAILED
* HTTP-Code: Details Text
  * 400 - Bad Request: FHIR Profile Validation Failed

abbrechen, damit nur FHIR-valide Ressourcen in den TI-Flow-Fachdienst akzeptiert werden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /Task/<id> Ressource durch einen Versicherten prüfen, ob der adressierte Task in Task.extension:eu-isRedeemableByProperties.valueBoolean = true gesetzt ist und anderfalls mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 409 - Conflict: error
* HTTP-Code: Code
  * 409 - Conflict: invalid
* HTTP-Code: Details Code
  * 409 - Conflict: TIFLOW_EREZEPT_NOT_ACTIVATED
* HTTP-Code: Details Text
  * 409 - Conflict: -

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /Task/<id> Ressource durch einen Versicherten, den im Parameter `eu-isRedeemableByPatientAuthorization` enthaltenen boolschen Wert in `Task.extension:eu-isRedeemableByPatientAuthorization.valueBoolean` setzen.

