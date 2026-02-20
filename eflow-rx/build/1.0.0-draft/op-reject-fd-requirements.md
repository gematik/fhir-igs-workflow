# FD-Anforderungen $reject - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **FD-Anforderungen $reject**

## FD-Anforderungen $reject

# FD-Anforderungen: Operation $reject

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$reject`.

Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks fuer ein E-Rezept mittels HTTP-POST/$reject-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschliesslich abgebende Institutionen in der Rolle oid_oeffentliche_apotheke, oid_krankenhausapotheke, oid_kostentraeger die Operation am Fachdienst aufrufen duerfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit das E-Rezept nicht durch einen Unberechtigten zurueckgewiesen werden kann.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$reject das im URL-Parameter "?secret=..." uebertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = in-progress pruefen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.

Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks mittels HTTP-POST-Operation ueber /Task/<id>/$reject, wenn bereits Dispensierinformationen im E-Rezept-Fachdienst zum Task gespeichert wurden, die Daten fuer die Loeschinformation dieser Dispensierinformationen fuer die Uebermittlung in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks mittels HTTP-POST-Operation ueber /Task/<id>/$reject die externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret loeschen und den Status des referenzierten Tasks auf Task.status = ready setzen, damit nachfolgende Zugriffe auf diesen Datensatz durch Berechtigte in Kenntnis des AccessCodes erfolgen koennen.

Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks mittels HTTP-POST-Operation ueber /Task/<id>/$reject die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI loeschen.

Der E-Rezept-Fachdienst MUSS beim Zurueckweisen eines Tasks fuer ein E-Rezept mittels POST /Task/<id>/$reject die Dispensierinformationen, falls welche vorhanden sind, loeschen: Medication, die aus der MedicationDispense referenziert wird; MedicationDispense zum dazugehoerigen Task; Task.extension:lastMedicationDispense.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/<id>/$reject bei erfolgreichem Abschluss der Operation den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.reject" und den Versicherten mit der KVNR = Task.for initiieren.

