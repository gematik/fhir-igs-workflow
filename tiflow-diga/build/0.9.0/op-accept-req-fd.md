# Anforderungen an den TI-Flow-Fachdienst für die $accept-Operation - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $accept**](op-accept.md)
* **Anforderungen an den TI-Flow-Fachdienst für die $accept-Operation**

## Anforderungen an den TI-Flow-Fachdienst für die $accept-Operation

Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$accept`.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$accept`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept die Operation mit dem HTTP-Fehlercode 410 abbrechen, wenn der referenzierte /Task/<id> existiert, jedoch kein AccessCode im Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode vorhanden ist oder der Status Task.status = cancelled ist, damit die abgebende Institution den Versicherten über die zwischenzeitliche Löschung des Datensatzes in Kenntnis setzen kann.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept den im HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCodeTask.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept die Operation mit dem HTTP-Fehlercode 409 abbrechen, wenn der StatusTask.status = "completed", Task.status = "in-progress" oder Task.status = "draft" ist, damit ein bereits in Abgabe befindliches oder beliefertes E-Rezept nicht durch eine zweite Apotheke bearbeitet werden kann. Im OperationOutcome werden weitere Informationen gegeben: "Task has invalid status completed", "Task has invalid status in-progress" bzw. "Task has invalid status draft".

Der TI-Flow-Fachdienst MUSS in OperationOutcome zusätzlich die Information "Task is processed by requesting institution" ergänzen, wenn Task.status = "in-progress" und die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI mit der Telematik-ID aus dem ACCESS_TOKEN übereinstimmt.
Hinweis: Die Informationen in OperationOutcome werden ggf. als mehrere Strings in einem Array übermittelt.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept die Operation mit dem Fehlercode 403 abbrechen, wenn das Ende der Einlösefrist (Task.ExpiryDate) zu einem früherem Zeitpunkt als das aktuelle Datum liegt, da Verordnungen nur bis Ende der Einlösefrist abgerufen werden dürfen. Im Falle dieses Fehlers ist im OperationOutcome des Response das Ende der Einlösefrist wie folgt anzugeben: "Verordnung bis <Datum> einlösbar.", wobei <Datum> der Wert Task.ExpiryDate im Format "dd.mm.yyyy" ist.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept den Status des Tasks auf Task.status = "in-progress" setzen, eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret hinzufügen und den Task im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurückgeben, damit das E-Rezept für die nachfolgende Bearbeitung durch den abrufenden Apotheker reserviert ist.

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept für den referenzierten Task die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen kann.
Die Telematik-ID ist im Task wie folgt zu hinterlegen:

* Task.owner.identifier.system= “https://gematik.de/fhir/sid/telematik-id”
* Task.owner.identifier.value= $Telematik-ID der Apotheke gemäß https://simplifier.net/basisprofil-de-r4/identifiertelematikid

Der TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$accept bei erfolgreichem Abschluss der Operation den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.accept" und den Versicherten mit der KVNR = Task.for initiieren.
### Modulspezifische Anforderungen

Der TI-Flow-Fachdienst MUSS beim Abrufen eines Tasks für eine Verordnung mit Flowtype 162 mittels HTTP-POST/$accept-Operation auf den in der URL referenzierten/Task/<id> die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Institutionen in der Rolle
* oid_kostentraeger
die Operation am Fachdienst aufrufen, damit die Verordnung nicht durch einen Unberechtigten abgerufen werden kann.

