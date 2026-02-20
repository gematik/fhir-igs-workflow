# Server-Anforderungen $accept - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $accept (Task akzeptieren)**](op-accept.md)
* **Server-Anforderungen $accept**

## Server-Anforderungen $accept

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$accept`.

Der E-Rezept-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke oid_krankenhausapotheke die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden können.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept die Operation mit dem Fehlercode 403 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zu einem späteren Zeitpunkt als das aktuelle Datum liegt, da Teilverordnungen von Mehrfachverordnungen erst ab Beginn der Einlösefrist abgerufen werden dürfen. Im Falle dieses Fehlers ist im OperationOutcome des Response der Beginn der Einlösefrist wie folgt anzugeben: „Teilverordnung zur Mehrfachverordnung <MVO Referenz> ist ab <Datum> einlösbar.“, wobei <MVO Referenz> der Wert MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value sowie <Datum> der Wert MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start im Format "dd.mm.yyyy" ist.

