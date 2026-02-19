{% assign use_cases = site.data['use-cases'] %}

Das Szenario beschreibt die Workflow-Steuerung durch Leistungserbringer (WF-LE) fuer apothekenpflichtige Arzneimittel.
Im Unterschied zum Standardprozess steuert hier nicht der Versicherte, sondern die verordnende LEI die Zuweisung an die Apotheke.

## Kontext und Zielbild

WF-LE adressiert besondere Versorgungssituationen, in denen ein E-Rezept direkt von der verordnenden LEI an eine abgebende Apotheke zugewiesen wird.
Der technische Prozess baut auf dem bekannten E-Rezept-Prozess auf und fuehrt fuer die direkte Zuweisung den Flowtype `169` ein.

## Fachlicher Ablauf

1. Die verordnende LEI erstellt das E-Rezept (inkl. Rezept-ID, QES und Aktivierung) fuer den Flowtype `169`.
2. Das Primaersystem erzeugt den E-Rezept-Token (Task-ID + AccessCode).
3. Die verordnende LEI uebermittelt den Token direkt an die ausgewaehlte Apotheke ueber ein geeignetes sicheres Uebermittlungsverfahren.
4. Die Apotheke ruft das E-Rezept wie im Standardprozess ab und fuehrt Belieferung, Dispensierinformation und Abschluss aus.

Der Abruf- und Belieferungsprozess in der Apotheke unterscheidet sich fachlich nicht vom Standardprozess.

## Fachliche Unterschiede zum Standard-Workflow 160

- Die Steuerungshoheit fuer die Zuweisung liegt bei der verordnenden LEI.
- Der Versicherte kann das E-Rezept einsehen, aber keine Einloeseinformationen weitergeben und den Workflow nicht steuern.
- AccessCode wird dem Versicherten bei diesem Rezepttyp nicht bereitgestellt.
- Der Versicherte hat fuer Flowtype `169` eingeschraenkte Verwaltungsmoeglichkeiten im FdV.

## Kommunikation und Rollen

- Die direkte Token-Uebergabe erfolgt von der verordnenden LEI an die Apotheke.
- Die Kommunikation zur Belieferung erfolgt primaer zwischen Verordnender und Apotheke.
- Fuer die Verarbeitung werden keine neuen Produkttypen eingefuehrt; es werden die bestehenden E-Rezept-Komponenten genutzt.

**Beteiligte Systeme:** PVS/KIS, AVS, E-Rezept-Fachdienst, E-Rezept-FdV

**Fachliche Anwendungsfaelle (Verordnung und Zuweisung)**

{% assign scenario_use_cases = "E_Rezept_erstellen, E_Rezept_qualifiziert_signieren, E_Rezept_vervollstaendigen_und_Task_aktivieren" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfaelle mit Bezug zu Szenario <i>WF-LE - Verordnung und direkte Zuweisung</i>" %}

**Fachliche Anwendungsfaelle (Belieferung)**

{% assign scenario_use_cases = "E_Rezept_abrufen_apotheke, E_Rezept_abgabe_dokumentieren, E_Rezept_abgabe_abschliessen, E_Rezept_loeschen, E_Rezept_secret_wiederherstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfaelle mit Bezug zu Szenario <i>WF-LE - Belieferung</i>" %}

## Uebergang in technische Umsetzung und Schnittstellen

- [Technische Anwendungsfaelle](./menu-technische-umsetzung-anwendungsfaelle.html)
- [Operation API: $create](./op-create.html)
- [Operation API: $activate](./op-activate.html)
- [Operation API: $accept](./op-accept.html)
- [Operation API: $dispense](./op-dispense.html)
- [Operation API: $close](./op-close.html)
- [Operation API: $reject](./op-reject.html)
