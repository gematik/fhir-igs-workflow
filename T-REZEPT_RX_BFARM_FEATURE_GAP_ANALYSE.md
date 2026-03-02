# Vollständigkeitscheck: gemF_eRp_T-Rezept_V1.1.0 gegen IG rx + IG bfarm

Stand: 2026-03-02

## Prüfgrundlage

- Feature-Dokument: `.temp/gemF_eRp_T-Rezept_V1.1.0.html`
- IG-Quellen:
  - `igs/rx/input/**`
  - `igs/bfarm/input/**`

## Scope der Bewertung (wie gewünscht)

- **IG rx**: Inhalte zum Arzneimittel-Workflow **166**.
- **IG bfarm**: Anteil zur **Übertragung des digitalen Durchschlags** an das BfArM/T-Register.

## Kurzfazit

Die Aufteilung ist **grundsätzlich korrekt umgesetzt**:

- Workflow-166-Kernanforderungen liegen überwiegend in `rx`.
- BfArM/T-Register-Übertragung liegt überwiegend in `bfarm`.

Es gibt jedoch noch **Lücken bzw. offene Traceability-Punkte**.

---

## Was in `rx` bereits klar abgedeckt ist (WF166)

Nachweisbare AFOs in `igs/rx/input`:

- `A_27812`, `A_27813` (`$activate`, Flowtype 166)
- `A_19166-02` (`$accept`, Rollenprüfung inkl. 166)
- `A_26002-02` (`$close`, Profilprüfung inkl. 166)
- `A_22231-01` (Ausschluss BTM)
- `A_27846` (Prozessparameter Flowtype 166)
- `A_27814` (`$close`: Bereitstellung Daten für BfArM)
- außerdem mehrere PS-/UX-Punkte, z. B. `A_27833`, `A_27834`–`A_27839`, `A_27841`, `A_27842`.

---

## Was in `bfarm` bereits klar abgedeckt ist (digitaler Durchschlag)

Nachweisbare AFOs in `igs/bfarm/input` (v. a. `query-api-t-register-req-fd.md`):

- `A_27817`
- `A_27819`–`A_27822`
- `A_27823`–`A_27828`
- `A_27830`, `A_27831`
- `A_27882`
- plus fachlicher Bezug im Mapping/Profilkontext (u. a. Verweis auf `A_27825`).

---

## Offene Punkte (priorisiert)

## P1 – voraussichtlich fehlend im gewünschten Split

### Für `bfarm` (BfArM-Webdienst-Teil)

- [ ] `AF_10411` (Use Case „Digitaler Durchschlag E‑T‑Rezept an den BfArM Webdienst übertragen“) ist nicht explizit als ID-Trace nachweisbar.
- [ ] `A_27855`–`A_27860` (TLS-/Webdienstzugriff/Deaktivierung/Betriebsprozess) nicht nachweisbar.
- [ ] `A_27863` (Performance BfArM Service – maximale Übertragungszeit) nicht nachweisbar.

### Für `rx` (Workflow-166-Teil)

- [ ] `A_27832` (FdV-Hinweis auf Workflow-Besonderheit) nicht nachweisbar.
- [ ] `A_27840` (PS abgebende LEI: Quittung abrufen) nicht nachweisbar.

## P2 – prüfen, ob bewusst in andere Spezifikationen ausgelagert

Diese IDs erscheinen im Feature, sind aber im Split `rx`/`bfarm` nicht direkt nachweisbar; möglich ist gewollte Abdeckung in Core-/anderen Modulen:

- `A_23878-01`
- `A_22731-01`
- `A_25944-01`
- `A_27843`

Empfehlung: je ID explizit entscheiden „in rx/bfarm verankern“ vs. „bewusst externalisiert“ und dies im IG dokumentieren.

---

## Empfohlene Abarbeitungsreihenfolge

1. `bfarm`: Sicherheits-/Webdienst-AFOs `A_27855`–`A_27860` + `A_27863` ergänzen (naheliegend in Datenschutz/Sicherheit + T-Register-Requirements).
2. `bfarm`: expliziten Trace für `AF_10411` ergänzen (Use-Case-/Anwendungsfall-Seite).
3. `rx`: fehlende WF166-nahe AFOs (`A_27832`, `A_27840`) ergänzen oder bewusst als out-of-scope markieren.
4. Für `A_23878-01`, `A_22731-01`, `A_25944-01`, `A_27843` Entscheidung und Dokumentation der Ziel-Spezifikation festziehen.

---

## Hinweis zur Methodik

Der Abgleich wurde auf ID-Traceability in den IG-Quellen (`input/**`) durchgeführt. Wo Inhalte nur indirekt/ohne explizite A-ID referenziert sind, ist dies als „nicht nachweisbar“ markiert, nicht automatisch als fachlich falsch.