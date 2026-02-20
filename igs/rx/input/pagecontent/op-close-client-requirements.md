# Client-Anforderungen: Operation `$close`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$close`.

## Normative Client-Anforderungen (Auszug)

- A_19289-02: Das AVS MUSS `POST /Task/<id>/$close` mit `Authorization`, `Task-ID`, `secret` und optionaler `MedicationDispense` ausführen.
- A_19288-03: Wenn Dispensierinformationen mitgeliefert werden, MUESSEN sie nach den fachlichen Vorgaben erstellt sein.
- A_25643: Für jedes beliefertes E-Rezept MUSS `$close` ausgeführt werden, um den Workflow abzuschliessen.
- A_25220 / A_25221: Bei Stapelverarbeitung MUESSEN Lastverteilungsregeln (zufälliger Startzeitpunkt, Pausen) eingehalten werden.

## Hinweise zur Nutzung

- Wenn in `$close` keine `MedicationDispense` übergeben wird, muss zuvor mindestens ein erfolgreicher `$dispense`-Aufruf erfolgt sein.
- Nach erfolgreichem `$close` sind Dispensierinformationen für diesen Task nicht mehr aenderbar.
- Die Quittung kann bei Bedarf über `GET /Task/<id>?secret=...` erneut abgerufen werden.
