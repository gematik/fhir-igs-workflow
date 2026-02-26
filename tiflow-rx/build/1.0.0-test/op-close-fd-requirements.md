# Server-Anforderungen $close - E-Rezept für Arzneimittel v1.0.0-test

E-Rezept für Arzneimittel

Version 1.0.0-test - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $close (Task schließen)**](op-close.md)
* **Server-Anforderungen $close**

## Server-Anforderungen $close

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$close`.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> sicherstellen, dass ausschließlich abgebende Institutionen in der Rolle
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit der Workflow nicht durch einen Unberechtigten abgeschlossen werden kann.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> mit Flowtype 160, 166, 169, 200, oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für Arzneimittel zulässig." zurückgegeben werden.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels POST /Task/<id>/$close erlauben, dass der Aufruf ohne Übergabe einer MedicationDispense im Request Body stattfindet.Der E-Rezept-Fachdienst MUSS in dem Fall sicherstellen, dass eine MedicationDispense für diesen Task existiert.

Der E-Rezept-Fachdienst MUSS, falls keine MedicationDispense zum dazugehörigen Task existiert, mit dem Fehler 403 abbrechen. Im Fehlerfall ist die Meldung "Abschluss des Workflows konnte nicht durchgeführt werden. Dispensierinformationen wurden nicht bereitgestellt." im OperationOutcome zu übermitteln.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close sicherstellen, dass alle vorhandenen MedicationDispenses und ihre referenzierten Medications gelöscht werden, wenn der Client im Aufruf eine neue MedicationDispense übermittelt, sodass nach Abschluss der Operation nur die neu übermittelten MedicationDispenses gespeichert sind.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close auch die Übergabe mehrerer MedicationDispense-Objekte in einem validen Standard-FHIR Bundle im http-Body des Requests ermöglichen.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten der Dispensierinformationen mit Status = "completed" für die Übermittlung in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.
Der Implementation Guide zur Übermittlung des digitalen Durchschlags an den BfArM Webdienst ist im [gemIG_TIFlow_bfarm] beschrieben.

