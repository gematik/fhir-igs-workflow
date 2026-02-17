# Client-Anforderungen: Operation `$activate`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$activate`.

## Normative Client-Anforderungen (Auszug)

- A_19273-01: Das Primaersystem MUSS `POST /Task/<id>/$activate` mit `Authorization`, `Task-ID`, `AccessCode` und QES-signiertem Payload ausfuehren.
- A_19279: Das Primaersystem MUSS bei Ausdruckbedarf einen E-Rezept-Token erzeugen.
- A_19280: Das Primaersystem MUSS bei Ausdruckbedarf den Datamatrix-Code samt Zusatzinformationen ausgeben.

## Hinweise zur Nutzung

- Wenn beim ersten `$activate`-Aufruf keine Response eintrifft, soll der Client den Aufruf wiederholen.
- Liefert der zweite Aufruf `403` mit "Task not in status draft but in status ready", war der erste Aufruf bereits erfolgreich.
- Der Client soll `OperationOutcome`-Hinweise nutzerverstaendlich ausgeben.
