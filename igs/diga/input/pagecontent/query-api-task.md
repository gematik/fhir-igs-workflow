Query API: Task

Die Query API für Task beschreibt den lesenden Zugriff auf Tasks. Der
Kostenträger ermittelt Verordnungen des Flowtype 162 und ruft Tasks mit
Rezept-ID und AccessCode ab.

## GET /Task (Suche)
- Rückgabe der Verordnungen eines Versicherten mit Flowtype 162
- Filterung auf Status "offen" für den Abruf durch Kostenträger

## GET /Task/<id> (Details)
- Abruf einer konkreten Verordnung mit Rezept-ID und AccessCode
- Statusübergang von "offen" auf "in Abgabe (gesperrt)" gemäß Basis-Workflow
