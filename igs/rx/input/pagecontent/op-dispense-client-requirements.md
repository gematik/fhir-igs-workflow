# Client-Anforderungen: Operation `$dispense`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$dispense`.

## Normative Client-Anforderungen (Auszug)

- A_24289: Das AVS MUSS ein E-Rezept fuer die Bereitstellung von Dispensierinformationen auswaehlbar machen.
- A_24290: Das AVS MUSS den Anwendungsfall "Dispensierinformationen bereitstellen" gemaess ILF umsetzen.
- A_24291-01: Das AVS MUSS Dispensierinformationen profilkonform erstellen.
- A_26346: Das AVS MUSS `POST /Task/<id>/$dispense` mit `Authorization`, `Task-ID`, `secret` und `MedicationDispense` ausfuehren.

## Hinweise zur Nutzung

- Wiederholte `$dispense`-Aufrufe ueberschreiben vorherige Dispensierinformationen; deshalb stets die vollstaendige, aktuelle Fassung senden.
- Fuer die Dosierung sind die Flowtype-spezifischen Vorgaben einzuhalten.
