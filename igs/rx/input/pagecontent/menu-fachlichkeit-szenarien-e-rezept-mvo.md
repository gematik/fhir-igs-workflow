{% assign use_cases = site.data['use-cases'] %}

Das Szenario beschreibt die Mehrfachverordnung (MVO) fuer apothekenpflichtige Arzneimittel.
Eine MVO besteht aus mehreren Teilverordnungen, die jeweils als eigenes E-Rezept verarbeitet werden.

## Kontext und Zielbild

Mehrfachverordnungen sollen die kontinuierliche Arzneimittelversorgung vereinfachen, insbesondere bei Dauertherapien.
Aus einer MVO entstehen mehrere einzeln einloesbare Teilverordnungen.

Wesentliche Merkmale:

- Eine MVO umfasst mindestens 2 und maximal 4 Teilverordnungen.
- Jede Teilverordnung ist ein vollstaendiges E-Rezept mit eigener Rezept-ID, eigenem Task und eigenem E-Rezept-Token.
- Jede Teilverordnung kann separat eingeloest, beliefert, quittiert und abgerechnet werden.
- MVO ist fuer GKV und PKV anwendbar.

## Fachlicher Ablauf

1. Der Verordnende erstellt pro Teilverordnung ein E-Rezept-Bundle und kennzeichnet es als Teil einer MVO.
2. Pro Teilverordnung werden die MVO-Informationen gepflegt: laufende Nummer, Gesamtzahl, Beginn der Einloesfrist, optional Ende der Einloesfrist.
3. Jede Teilverordnung wird wie ein einzelnes E-Rezept signiert und ueber den Fachdienst aktiviert.
4. Die Apotheke ruft jede Teilverordnung einzeln ab und beliefert sie einzeln.

## Geltungs- und Einloeslogik

- Der Beginn der Einloesfrist ist pro Teilverordnung verpflichtend.
- Das Ende der Einloesfrist ist optional; ohne Ende gilt die Teilverordnung bis 365 Tage nach Ausstellungsdatum.
- Vor Beginn der Einloesfrist ist ein Abruf durch die Apotheke nicht zulaessig.
- Der Versicherte kann Teilverordnungen bereits im FdV einsehen, auch wenn sie noch nicht einloesbar sind.

## Abgrenzungen und Besonderheiten

- Keine Mehrfachverordnung fuer Entlassrezepte, BtM-Rezepte oder T-Rezepte.
- Keine Ersatzverordnung fuer MVO-Teilverordnungen; bei Verlust ist ein neues Einzelrezept erforderlich.
- Beim Einscannen eines Ausdrucks mit mehreren Token duerfen Token fuer noch nicht gueltige Teilverordnungen im AVS nicht automatisch gespeichert werden (nur auf ausdruecklichen Wunsch des Versicherten).
- Loeschung und Loeschfristen folgen dem Einzelrezept-Prinzip.

## Flowtypes und Verarbeitung

Mehrfachverordnungen sind fuer die apothekenpflichtigen Workflows zulaessig:

- `160` (Muster 16)
- `169` (Muster 16 mit Steuerung durch Leistungserbringer)
- `200` (PKV)
- `209` (PKV mit Steuerung durch Leistungserbringer)

Unabhaengig vom Flowtype bleibt die fachliche Regel gleich: jede Teilverordnung ist ein eigener, separater Workflow.

**Beteiligte Systeme:** PVS/KIS, AVS, E-Rezept-Fachdienst, E-Rezept-FdV

**Fachliche Anwendungsfaelle (Verordnung)**

{% assign scenario_use_cases = "E_Rezept_erstellen, E_Rezept_qualifiziert_signieren, E_Rezept_vervollstaendigen_und_Task_aktivieren, E_Rezept_loeschen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfaelle mit Bezug zu Szenario <i>Mehrfachverordnung (MVO) - Verordnung</i>" %}

**Fachliche Anwendungsfaelle (Belieferung)**

{% assign scenario_use_cases = "E_Rezept_abrufen_apotheke, E_Rezept_abgabe_dokumentieren, E_Rezept_abgabe_abschliessen, E_Rezept_loeschen, E_Rezept_secret_wiederherstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfaelle mit Bezug zu Szenario <i>Mehrfachverordnung (MVO) - Belieferung</i>" %}

## Uebergang in technische Umsetzung und Schnittstellen

- [Technische Anwendungsfaelle](./menu-technische-umsetzung-anwendungsfaelle.html)
- [Operation API: $create](./op-create.html)
- [Operation API: $activate](./op-activate.html)
- [Operation API: $accept](./op-accept.html)
- [Operation API: $dispense](./op-dispense.html)
- [Operation API: $close](./op-close.html)
