# FD-Anforderungen $accept - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $accept (Task akzeptieren)**](op-accept.md)
* **FD-Anforderungen $accept**

## FD-Anforderungen $accept

# FD-Anforderungen: Operation $accept

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$accept`.

Der E-Rezept-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschliesslich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden koennen.

Der E-Rezept-Fachdienst MUSS beim Abrufen eines Tasks mit Flowtype 162 fuer ein E-Rezept mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschliesslich abgebende Institutionen in der Rolle oid_kostentraeger die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte abgerufen werden koennen.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept den im HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." uebertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode pruefen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept die Operation mit dem HTTP-Fehlercode 409 abbrechen, wenn der Status Task.status = "completed", Task.status = "in-progress" oder Task.status = "draft" ist, damit ein bereits in Abgabe befindliches oder beliefertes E-Rezept nicht durch eine zweite Apotheke bearbeitet werden kann. Im OperationOutcome werden weitere Informationen gegeben: "Task has invalid status completed", "Task has invalid status in-progress" bzw. "Task has invalid status draft". Der E-Rezept-Fachdienst MUSS in OperationOutcome zusaetzlich die Information "Task is processed by requesting institution" ergaenzen, wenn Task.status = in-progress und die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI mit der Telematik-ID aus dem ACCESS_TOKEN uebereinstimmt.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept die Operation mit dem Fehlercode 403 abbrechen, wenn das Ende der Einloesefrist (Task.ExpiryDate) zu einem frueherem Zeitpunkt als das aktuelle Datum liegt, da Verordnungen nur bis Ende der Einloesefrist abgerufen werden duerfen. Im Falle dieses Fehlers ist im OperationOutcome des Response das Ende der Einloesefrist wie folgt anzugeben: "Verordnung bis <Datum> einloesbar.", wobei <Datum> der Wert Task.ExpiryDate im Format "dd.mm.yyyy" ist.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept die Operation mit dem Fehlercode 403 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der Beginn der Einloesefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zu einem spaeteren Zeitpunkt als das aktuelle Datum liegt, da Teilverordnungen von Mehrfachverordnungen erst ab Beginn der Einloesefrist abgerufen werden duerfen. Im Falle dieses Fehlers ist im OperationOutcome des Response der Beginn der Einloesefrist wie folgt anzugeben: "Teilverordnung zur Mehrfachverordnung <MVO Referenz> ist ab <Datum> einloesbar.", wobei <MVO Referenz> der Wert MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value sowie <Datum> der Wert MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start im Format "dd.mm.yyyy" ist.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept den Status des Tasks auf Task.status = in-progress setzen, eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret hinzufuegen und den Task im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurueckgeben, damit das E-Rezept fuer die nachfolgende Bearbeitung durch den abrufenden Apotheker reserviert ist.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept, wenn der Verordnungsdatensatz Coverage.type.coding.code = "PKV" enthaelt und fuer die KVNR des beguenstigten Versicherten (Task.for) eine Consent Ressource mit Consent.patient.identifier = KVNR und Consent.category.coding.code = "CHARGCONS" existiert, das Response Bundle um die Consent Ressource ergaenzen, um der abgebenden LEI die Information zu uebermitteln, dass der Versicherte eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt hat.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept fuer den referenzierten Task die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen koennen.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept die Operation mit dem HTTP-Fehlercode 410 abbrechen, wenn der referenzierte /Task/<id> existiert, jedoch kein AccessCode im Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode vorhanden ist oder der Status Task.status = cancelled ist, damit ein Apotheker den Versicherten ueber die zwischenzeitliche Loeschung des Datensatzes in Kenntnis setzen kann.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$accept bei erfolgreichem Abschluss der Operation den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.accept" und den Versicherten mit der KVNR = Task.for initiieren.

