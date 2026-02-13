# Client-Anforderungen: Operation `$reject`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$reject`.

## Normative Client-Anforderungen (Auszug)

- A_19250: Das AVS MUSS `POST /Task/<id>/$reject` mit `Authorization`, `Task-ID` und `secret` aufrufen.
- A_19251: Nach erfolgreichem `$reject` MUSS das AVS E-Rezept-Daten, Token und `secret` lokal loeschen.

## Hinweise zur Nutzung

- Rueckweisen und direktes erneutes Abrufen (`$accept`) soll nicht als Uebergabemechanismus verwendet werden.
- Diese Folge erzeugt zusaetzliche Protokolleintraege und zukuenftige Notifications fuer Versicherte, die fachlich oft nicht nachvollziehbar sind.
