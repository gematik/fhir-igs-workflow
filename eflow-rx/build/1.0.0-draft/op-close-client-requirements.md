# Client-Anforderungen $close - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $close (Task schließen)**](op-close.md)
* **Client-Anforderungen $close**

## Client-Anforderungen $close

# Client-Anforderungen: Operation $close

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$close`.

## Normative Client-Anforderungen (Auszug)

* A_19289-02: Das AVS MUSS `POST /Task/<id>/$close` mit `Authorization`, `Task-ID`, `secret` und optionaler `MedicationDispense` ausführen.
* A_19288-03: Wenn Dispensierinformationen mitgeliefert werden, MUESSEN sie nach den fachlichen Vorgaben erstellt sein.
* A_25643: Für jedes beliefertes E-Rezept MUSS `$close` ausgeführt werden, um den Workflow abzuschliessen.
* A_25220 / A_25221: Bei Stapelverarbeitung MUESSEN Lastverteilungsregeln (zufälliger Startzeitpunkt, Pausen) eingehalten werden.

## Hinweise zur Nutzung

* Wenn in `$close` keine `MedicationDispense` übergeben wird, muss zuvor mindestens ein erfolgreicher `$dispense`-Aufruf erfolgt sein.
* Nach erfolgreichem `$close` sind Dispensierinformationen für diesen Task nicht mehr aenderbar.
* Die Quittung kann bei Bedarf über `GET /Task/<id>?secret=...` erneut abgerufen werden.

