Query API: Task

Die Query API fuer Task beschreibt den lesenden Zugriff auf Tasks. Der
Kostentraeger ermittelt E-Rezepte des Flowtype 162 und ruft Tasks mit
Rezept-ID und AccessCode ab.

## GET /Task (Suche)
- Rueckgabe der E-Rezepte eines Versicherten mit Flowtype 162
- Filterung auf Status "offen" fuer den Abruf durch Kostentraeger

## GET /Task/<id> (Details)
- Abruf eines konkreten E-Rezepts mit Rezept-ID und AccessCode
- Statusuebergang auf "in Abgabe (gesperrt)" gem. Basis-Workflow
