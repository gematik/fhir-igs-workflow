# FD-Anforderungen $accept - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $accept (Task akzeptieren)**](op-accept.md)
* **FD-Anforderungen $accept**

## FD-Anforderungen $accept

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$accept`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/<id> die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_AUTH_ROLE_NOT_ALLOWED
* HTTP-Code: Details Text
  * 403 - Forbidden: Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern

abbrechen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden können.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zu einem späteren Zeitpunkt als das aktuelle Datum liegt, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: invalid
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_EREZEPT_MVO_NOT_VALID
* HTTP-Code: Details Text
  * 403 - Forbidden: Teilverordnung zur Mehrfachverordnung %1 ist ab %2 einlösbar.

abbrechen, da Teilverordnungen von Mehrfachverordnungen erst ab Beginn der Einlösefrist abgerufen werden dürfen. Im Falle dieses Fehlers ist im OperationOutcome des Response der Beginn der Einlösefrist wie folgt anzugeben: "Teilverordnung zur Mehrfachverordnung <MVO Referenz> ist ab <Datum> einlösbar.", wobei <MVO Referenz> der Wert MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value sowie <Datum> der Wert MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start im Format "dd.mm.yyyy" ist.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept, wenn der Verordnungsdatensatz Coverage.type.coding.code = "PKV" enthält und für die KVNR des begünstigten Versicherten (Task.for) eine Consent Ressource mit Consent.patient.identifier = KVNR und Consent.category.coding.code = "CHARGCONS" existiert, das Response Bundle um die Consent Ressource ergänzen, um der abgebenden LEI die Information zu übermitteln, dass der Versicherte eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem TI-Flow-Fachdienst erteilt hat.

