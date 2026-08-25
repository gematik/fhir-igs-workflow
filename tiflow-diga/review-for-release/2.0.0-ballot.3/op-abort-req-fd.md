# Anforderungen an den TI-Flow-Fachdienst für die $abort-Operation - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $abort**](op-abort.md)
* **Anforderungen an den TI-Flow-Fachdienst für die $abort-Operation**

## Anforderungen an den TI-Flow-Fachdienst für die $abort-Operation

Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$abort`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Löschen eines Tasks mit Flowtype 162 mittels HTTP-POST/$abort-Operation auf den in der URL referenzierten/Task/<id> die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle
* oid_versicherter
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_krankenhaus
* oid_praxis_psychotherapeut
* oid_institution-vorsorge-reha
die Operation am Fachdienst aufrufen, und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit die Verordnung nicht durch einen Unberechtigten gelöscht werden kann.

