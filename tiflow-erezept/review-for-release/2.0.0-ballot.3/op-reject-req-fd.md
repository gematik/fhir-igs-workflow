# FD-Anforderungen $reject - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **FD-Anforderungen $reject**

## FD-Anforderungen $reject

Diese Seite enthält die workflowtyp-spezifischen normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$reject`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle
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

abbrechen, damit das E-Rezept nicht durch einen Unberechtigten zurückgewiesen werden kann.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject die Dispensierinformationen, falls welche vorhanden sind, löschen:
* Medication, die aus der MedicationDispense referenziert wird --> löschen
* MedicationDispense zum dazugehörigen Task --> löschen
* Task.extension:lastMedicationDispense --> löschen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zurückweisen eines Tasks mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$reject, wenn bereits Dispensierinformationen im TI-Flow-Fachdienst zum Task gespeichert wurden, die Daten für die Löschinformation dieser Dispensierinformationen für die Übermittlung in den ePA Medication Service bereitstellen.

