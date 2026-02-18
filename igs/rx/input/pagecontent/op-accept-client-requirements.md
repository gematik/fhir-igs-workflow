# Client-Anforderungen: Operation `$accept`

Diese Seite beschreibt die Anforderungen an Clients zur Nutzung von `$accept`.

## Normative Client-Anforderungen (Auszug)

- A_19558-01: Das AVS MUSS `POST /Task/<id>/$accept` mit `Authorization`, `Task-ID` und `AccessCode` aufrufen.
- A_19900: Das AVS MUSS den Verordnungsdatensatz aus der empfangenen PKCS#7-Struktur extrahieren.
- A_19901: Das AVS MUSS Verordnungsdaten und `Secret` lokal speichern.

## Hinweise zur Nutzung

- Bei Mehrfachverordnungen kann ein Abruf vor Beginn der Einloesefrist mit `403` fehlschlagen; das Datumsfeld aus `OperationOutcome` ist dem Nutzer anzuzeigen.
- Fuer Flowtype 200/209 kann im Response zusaetzlich eine `Consent`-Information enthalten sein.
