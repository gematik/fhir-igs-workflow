# Client-Anforderungen: Operation `$abort`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$abort`.

## Normative Client-Anforderungen (Auszug)

- A_19244: Das AVS MUSS `POST /Task/<id>/$abort` mit `Authorization`, `Task-ID` und `secret` ausführen.
- A_19245: Nach erfolgreichem `$abort` MUSS das AVS Token- und Secret-bezogene lokale Daten löschen.

## Hinweise zur Nutzung

- Vor dem Löschen ist eine explizite Nutzerbestätigung im Client vorzusehen.
- Fehlerantworten (`403`, `410`) sind nutzerverständlich anzuzeigen, da sie den Status des Workflows erklaeren.
