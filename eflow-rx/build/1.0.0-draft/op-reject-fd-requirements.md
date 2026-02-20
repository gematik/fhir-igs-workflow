# Server-Anforderungen $reject - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $reject (Task zurückweisen)**](op-reject.md)
* **Server-Anforderungen $reject**

## Server-Anforderungen $reject

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$reject`.

Der E-Rezept-Fachdienst MUSS beim Zurückweisen eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$reject , wenn bereits Dispensierinformationen im E-Rezept-Fachdienst zum Task gespeichert wurden, die Daten für die Löschinformation dieser Dispensierinformationen für die Übermittlung in den ePA Medication Service bereitstellen.

