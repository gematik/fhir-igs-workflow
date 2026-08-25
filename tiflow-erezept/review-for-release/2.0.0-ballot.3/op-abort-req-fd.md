# FdV-Anforderungen $abort - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $abort (Task abbrechen)**](op-abort.md)
* **FdV-Anforderungen $abort**

## FdV-Anforderungen $abort

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$abort`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Löschen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$abort-Operation auf den in der URL referenzierten/Task/<id> die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in einer der Rollen
* oid_versicherter
* oid_praxis_arzt
* oid_zahnarztpraxis
* oid_krankenhaus
* oid_institution-vorsorge-reha
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

abbrechen, damit die Verordnung nicht durch einen Unberechtigten gelöscht werden kann.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort verhindern und die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abweisen, wenn der Status des adressierten Tasks gleich "in-progress" ist und die Rolle des aufrufenden Nutzers nicht einer der folgenden Rollen entspricht:
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
damit Nutzer außerhalb der Apotheke keine Rezepte löschen, die sich aktuell in Belieferung befinden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort verhindern, wenn der Status des adressierten Tasks ungleich "in-progress" ist und die Rolle des aufrufenden Nutzers einer der folgenden Rollen entspricht:
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
, und die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abbrechen, damit kein Apotheker ein Rezept löscht, das ihm nicht ausdrücklich zugewiesen wurde.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts über den mittels der <id> adressierten /Task/<id>/$abort durch abgebende Leistungserbringer (Apotheken) das im URL-Parameter "?secret=..." übertragene Geheimnis gegen das im referenzierten Task enthaltene Secret in Task.identifier prüfen und bei Missmatch oder Fehlen des URL-Parameters die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_SECRET_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: -

abbrechen, damit ausschließlich Apotheker in Kenntnis des Secret als Berechtigte ein E-Rezept löschen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS das Löschen eines E-Rezepts mit dem Flowtype 169 oder 209 über den mittels der <id> adressierten /Task/<id>/$abort verhindern, wenn der Status des adressierten Tasks ungleich "completed" ist und die Rolle des aufrufenden Nutzers der folgenden Rolle entspricht:
* oid_versicherter
, und die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_TASK_STATUS_MISMATCH
* HTTP-Code: Details Text
  * 403 - Forbidden: Task has invalid status.

abweisen, damit kein Versicherter ein E-Rezept aus einem Workflow mit Workflowsteuerung durch Leistungserbringer (169, 209) löscht, das nicht bereits beliefert wurde.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/<id>/$abort durch eine verordnende oder abgebende Leistungserbringerinstitution die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/$abort durch einen Versicherten, wenn Task.status = ready, die Daten für die Löschinformation des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.

