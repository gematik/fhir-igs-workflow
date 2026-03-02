# Client-Anforderungen: Operation `$reject`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$reject`.

## Normative Client-Anforderungen (Auszug)

- A_19250: Das AVS MUSS `POST /Task/<id>/$reject` mit `Authorization`, `Task-ID` und `secret` aufrufen.
- A_19251: Nach erfolgreichem `$reject` MUSS das AVS E-Rezept-Daten, Token und `secret` lokal löschen.

## Hinweise zur Nutzung

- Rückweisen und direktes erneutes Abrufen (`$accept`) soll nicht als Übergabemechanismus verwendet werden.
- Diese Folge erzeugt zusätzliche Protokolleinträge und zukünftige Notifications für Versicherte, die fachlich oft nicht nachvollziehbar sind.
