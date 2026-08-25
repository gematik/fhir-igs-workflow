# FD-Anforderungen $close - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $close (Task schließen)**](op-close.md)
* **FD-Anforderungen $close**

## FD-Anforderungen $close

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in einer der Rollen
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
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> mit Flowtype 160, 166, 169, 200, oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht, und andernfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_MEDICATION_DISPENSE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für Arzneimittel zulässig

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close erlauben, dass der Aufruf ohne Übergabe einer MedicationDispense im Request Body stattfindet. Der TI-Flow-Fachdienst MUSS in dem Fall sicherstellen, dass eine MedicationDispense für diesen Task existiert.

Der TI-Flow-Fachdienst MUSS, falls keine MedicationDispense zum dazugehörigen Task existiert, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_MEDICATION_DISPENSE_MISSING
* HTTP-Code: Details Text
  * 403 - Forbidden: Abschluss des Workflows konnte nicht durchgeführt werden. Dispensierinformationen wurden nicht bereitgestellt.

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn der Client im Aufruf eine neue MedicationDispense übermittelt, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "completed" für die Übermittlung in den ePA Medication Service bereitstellen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.
Der Implementation Guide zur Übermittlung des digitalen Durchschlags an den BfArM Webdienst ist im [gemIG_TIFlow_bfarm] beschrieben.

