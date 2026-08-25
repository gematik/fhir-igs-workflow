# Anforderungen an den TI-Flow-Fachdienst für die $close-Operation - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $close**](op-close.md)
* **Anforderungen an den TI-Flow-Fachdienst für die $close-Operation**

## Anforderungen an den TI-Flow-Fachdienst für die $close-Operation

Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$close`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 162 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/<id< die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_kostentraeger
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
</br>

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 162 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten/Task/<id> sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense_DiGA entspricht und anderenfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_MEDICATION_DISPENSE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig.

abbrechen.

