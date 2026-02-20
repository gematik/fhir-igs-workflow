# Server-Anforderungen $close - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $close (Task schließen)**](op-close.md)
* **Server-Anforderungen $close**

## Server-Anforderungen $close

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$close`.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/<id> mit Flowtype 160, 166, 169, 200, oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für Arzneimittel zulässig." zurückgegeben werden.

Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/<id>/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.

