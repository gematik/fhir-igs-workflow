# Konsistenzreport: `igs/erp-chrg/input/pagecontent`

**Datum:** siehe Git-Historie dieses Reports
**Umfang:** Alle 26 Markdown-Dateien in [igs/erp-chrg/input/pagecontent](igs/erp-chrg/input/pagecontent) sowie deren Cross-Referenzen zu [igs/erp-chrg/sushi-config.yaml](igs/erp-chrg/sushi-config.yaml), [igs/core/input/pagecontent](igs/core/input/pagecontent) (Aktorkonventionen) und den vorhandenen QA-Skripten unter [scripts/requirement-qa](scripts/requirement-qa).
**Methode:** Vollständige manuelle Sichtung aller Seiten, Inventarisierung aller 101 `<requirement key="IG-TIFLOW-CHRG-A…">`-Blöcke, Abgleich der Legacy-ID-Kommentare (`<!--A_….-->`), sowie ergänzender Lauf der vorhandenen Python-QA-Skripte (`check_requirement_quality.py`, `check_sushi_pages_crosscheck.py`, `check_requirement_page_actor_alignment.py`, `check_error_code_consistency`) gegen eine temporäre Ausgabe (keine Repo-Dateien wurden dabei verändert).
**Wichtig:** Dieser Report ist rein lesend entstanden — es wurden **keine** Dateien unter `igs/erp-chrg/` verändert.

---

## 1. Allgemeine Bewertung

Der Inhalt von `igs/erp-chrg/input/pagecontent` ist insgesamt **solide und strukturell konsistent** mit den Konventionen des Repos:

- Die Seitenstruktur folgt durchgängig dem repo-weiten Muster `op-/query-api-<resource>.md` (Übersicht) + `-req-<actor>.md` (aktorspezifische Anforderungen), analog zu `core` und den anderen Modulen.
- Alle 26 Dateien sind korrekt in `sushi-config.yaml` unter `pages:` referenziert — es gibt keine verwaisten Dateien und keine fehlenden Seiten (per `check_sushi_pages_crosscheck.py` bestätigt, 0 Treffer für erp-chrg).
- Die Aktorbezeichner (`TI-Flow_FD`, `TI-Flow_FdV`, `PS_TI-Flow_Apotheke`, `PS_TI-Flow_verordnend`, `CS_TI-Flow_KTR`) werden **konsistent** zwischen `core` und `erp-chrg` verwendet (eine anfängliche Vermutung einer Inkonsistenz hat sich nicht bestätigt).
- Alle 101 Requirement-Keys (`IG-TIFLOW-CHRG-A1`–`A101`) sind **eindeutig** — keine doppelten Keys.
- Die Error-Code-Konsistenzprüfung (`check_error_code_consistency`) meldet für das gesamte Repository **0 Probleme**.

Dennoch wurden mehrere **konkrete Inhaltsfehler** gefunden, die vor der nächsten Veröffentlichung behoben werden sollten — insbesondere zwei Paare von Anforderungen mit identischem Titel (aber unterschiedlichem, korrektem Inhalt), ein falscher Modulbezug in einem Anforderungstitel, mehrere defekte Cross-Spec-Links sowie eine Reihe kleinerer Tippfehler. Zusätzlich wurde festgestellt, dass die vorhandenen QA-Skripte für Aktor-Validierung **veraltete Aktorbezeichner** erwarten und deshalb aktuell für das gesamte Repository (nicht nur erp-chrg) falsch-positive Befunde liefern.

**Gesamtbewertung: gut, mit gezieltem Korrekturbedarf** (keine strukturellen/architektonischen Probleme, aber mehrere konkrete, klar behebbare Content-Bugs).

---

## 2. Änderungsvorschläge (priorisiert, abarbeitbar)

### 🔴 Hoch (inhaltliche Fehler / defekte Links)

1. **Falscher Modulbezug im Anforderungstitel — Titel verweist auf „DiGA“ statt PKV/ChargeItem**
   [menu-technische-umsetzung-audit-service.md](igs/erp-chrg/input/pagecontent/menu-technische-umsetzung-audit-service.md#L5)
   `IG-TIFLOW-CHRG-A99` trägt den Titel *„TI-Flow-Fachdienst - Versichertenprotokoll zu **DiGA**-Operationen“*, obwohl diese Seite Teil des **erp-chrg**-Moduls (PKV-Abrechnungsinformationen) ist und der Anforderungstext sich auch inhaltlich auf ChargeItem/PKV-Abrechnung bezieht. Sieht nach einem Copy-Paste-Rest aus der DiGA-IG aus.
   → **Vorschlag:** Titel korrigieren, z. B. *„…Versichertenprotokoll zu PKV-Abrechnungsoperationen“* (Formulierung an das Pendant in `igs/diga` bzw. an den tatsächlichen Anforderungstext anpassen).

2. **Doppelte Anforderungstitel bei unterschiedlichen Keys** (identischer `title`, unterschiedlicher Inhalt)
   In [query-api-chargeitem-req-fd.md](igs/erp-chrg/input/pagecontent/query-api-chargeitem-req-fd.md):
   - `A67` ([Zeile 597](igs/erp-chrg/input/pagecontent/query-api-chargeitem-req-fd.md#L597)) und `A97` ([Zeile 629](igs/erp-chrg/input/pagecontent/query-api-chargeitem-req-fd.md#L629)) tragen beide den Titel *„…Prüfung Signaturzertifikat PKV-Abgabedatensatz“*, obwohl A67 die allgemeine Zertifikatsprüfung (400/invalid) und A97 explizit den OCSP-Backend-Fehlerfall (512/transient) beschreibt.
   - `A85` ([Zeile 1060](igs/erp-chrg/input/pagecontent/query-api-chargeitem-req-fd.md#L1060)) und `A98` ([Zeile 1092](igs/erp-chrg/input/pagecontent/query-api-chargeitem-req-fd.md#L1092)) haben dasselbe Muster für den PATCH/PUT-Änderungsfall.
   - Zusätzlich tragen jeweils **beide** Requirements eines Paares denselben Legacy-ID-Kommentar (`<!--A_22140-01-->` bzw. `<!--A_22151-01-->`), was die Rückverfolgbarkeit zu Polarion/alten Anforderungs-IDs verfälscht (ein Legacy-ID sollte nicht auf zwei neue Keys zeigen).
   → **Vorschlag:** Titel disambiguieren (z. B. Suffix „– Zertifikatsstatus“ vs. „– OCSP-Backend-Fehler“ ergänzen) und für A97/A98 einen eigenen Legacy-ID-Kommentar vergeben (z. B. `A_22140-02` / `A_22151-02`), sofern die Requirement-QA-Historie das zulässt — andernfalls zumindest im Kommentar kenntlich machen, dass es sich um eine Ausdifferenzierung derselben Ursprungsanforderung handelt.

3. **Gleiches Muster in `ttl.md`:** Legacy-ID-Kommentar `<!-- A_22109 -->` wird zweimal vergeben — für [`A100` (Zeile 8)](igs/erp-chrg/input/pagecontent/ttl.md#L8) und [`A101` (Zeile 17)](igs/erp-chrg/input/pagecontent/ttl.md#L17). Beide Requirements haben unterschiedliche, korrekte Titel/Inhalte, aber denselben Legacy-Verweis.
   → **Vorschlag:** Zweiten Kommentar auf eine eigene (Sub-)ID setzen oder explizit als „abgeleitet von A_22109“ kennzeichnen.

4. **Defekte Cross-Spezifikations-Links** (fehlendes `tiflow/`-Segment und/oder fehlender `/`-Trenner):
   - [query-api-communication.md, Zeile 1](igs/erp-chrg/input/pagecontent/query-api-communication.md#L1): `.../ig/fhir/{{ site.data.constants.tiflow_core_version }}query-api-communication.html`
   - [query-api-consent.md, Zeile 1](igs/erp-chrg/input/pagecontent/query-api-consent.md#L1): `.../ig/fhir/{{ site.data.constants.tiflow_core_version }}query-api-consent.html`
   - [menu-technische-umsetzung-audit-service.md, Zeile 3](igs/erp-chrg/input/pagecontent/menu-technische-umsetzung-audit-service.md#L3): `.../ig/fhir/{{ site.data.constants.tiflow_core_version }}/audit-service.html` (hier fehlt nur `tiflow/`)

   Korrektes Muster (siehe z. B. [query-api-consent-req-fdv.md](igs/erp-chrg/input/pagecontent/query-api-consent-req-fdv.md#L5)):
   `https://gemspec.gematik.de/ig/fhir/tiflow/{{ site.data.constants.tiflow_core_version }}/<seite>.html`
   → **Vorschlag:** Alle drei Links auf das korrekte Muster (`ig/fhir/tiflow/<version>/<seite>.html`) vereinheitlichen — sonst führen sie im veröffentlichten IG ins Leere bzw. auf eine falsche URL.

5. **Fehlender Inhalt: `query-api-consent-req-fdv.md` enthält keine modulspezifischen Anforderungen**
   [query-api-consent-req-fdv.md](igs/erp-chrg/input/pagecontent/query-api-consent-req-fdv.md) besteht nur aus dem Einleitungssatz „Für diese Schnittstelle gelten die Anforderungen aus der Core-Spezifikation“ — im Gegensatz zu allen anderen `-req-*.md`-Seiten (auch dem Geschwisterpendant `query-api-consent-req-fd.md`, das ein Requirement enthält) fehlt ein Abschnitt „Modulspezifische Anforderungen“ bzw. eine Aussage, ob das FdV hier bewusst keine zusätzlichen Anforderungen hat.
   → **Vorschlag:** Entweder explizit ergänzen „Für diese Schnittstelle bestehen keine modulspezifischen Anforderungen“ (analog zu anderen Stub-Fällen im Repo) oder prüfen, ob tatsächlich Anforderungen fehlen.

### 🟡 Mittel

6. **Repo-weite Rechtschreibinkonsistenz „Abrechungsinformation“ (fehlendes „n“) vs. korrekt „Abrechnungsinformation“**
   Der Tippfehler ist **kein Einzelfall in der Pagecontent**, sondern durchgängig in den Datenquellen `igs/erp-chrg/input/data/use-cases.yaml` und `gen-use-cases.yaml` als Bestandteil von IDs/Ankern/Links kodiert (>60 Fundstellen je Datei) und wird darüber in gerenderte Überschriften übernommen, z. B. [menu-fachlichkeit-szenario-pkv.md, Zeile 67](igs/erp-chrg/input/pagecontent/menu-fachlichkeit-szenario-pkv.md#L67): „Einwilligung zum Speichern der **Abrechungsinformationen**“.
   Die `{% assign … | where: "id", "..." %}`-Verweise in der Pagecontent sind also intern konsistent mit den (falsch geschriebenen) Daten-IDs — es handelt sich **nicht** um einen gebrochenen Lookup, sondern um einen echten, weit verbreiteten Rechtschreibfehler im sichtbaren IG-Text.
   → **Vorschlag:** Als eigenständiges Ticket behandeln (nicht Teil dieses Pagecontent-only-Scopes), da eine Korrektur die IDs/Anker/Links in `use-cases.yaml`, `gen-use-cases.yaml` **und** allen referenzierenden Pagecontent-Dateien gleichzeitig anpassen muss, um keine Broken Anchors zu erzeugen.

7. **QA-Skripte mit veralteten Aktorbezeichnern (repo-weit, nicht erp-chrg-spezifisch)**
   `scripts/requirement-qa/check_requirement_quality.py` und `scripts/requirement-qa/check_requirement_page_actor_alignment.py` kennen nur die alten Bezeichner `eRp_FdV`, `PS_E-Rezept_abgebend`, `PS_E-Rezept_verordnend`, `CS_E-Rezept_KTR`, nicht aber die seit dem TI-Flow-Rebranding überall verwendeten `TI-Flow_FdV`, `PS_TI-Flow_Apotheke`, `PS_TI-Flow_verordnend`, `CS_TI-Flow_KTR`. Ein Testlauf gegen `igs/erp-chrg/input/pagecontent` ergab dadurch 70 (Quality-Check) bzw. 25 von 167 (Actor-Alignment, repo-weit) reine False-Positives — ausschließlich wegen der veralteten Namenslisten, keine echten Content-Fehler.
   → **Vorschlag:** `KNOWN_ACTORS` in `check_requirement_quality.py` sowie `SUFFIX_TO_ALLOWED_ACTORS` in `check_requirement_page_actor_alignment.py` auf die aktuellen `TI-Flow_*`-Bezeichner aktualisieren (betrifft alle Module, nicht nur erp-chrg).

8. **Legacy-Namensrest in Tabellenbeschriftung**
   [query-api-chargeitem-req-fd.md, Zeile 58](igs/erp-chrg/input/pagecontent/query-api-chargeitem-req-fd.md#L58): `TAB_eRPFD_013` verwendet noch die alte „eRPFD“ (E-Rezept-Fachdienst)-Nomenklatur statt der aktuellen Modul-Konvention (vgl. korrekt `TAB_Chrg_004` in `menu-technische-umsetzung-audit-service.md`).
   → **Vorschlag:** In `TAB_Chrg_0xx` (oder das im Modul sonst verwendete Namensschema) umbenennen.

### 🟢 Niedrig (Tippfehler / Formatierung / Hygiene)

9. **Tippfehler „Abrechnungsinformatione“** (fehlendes „n“) in [index.md, Zeile 29](igs/erp-chrg/input/pagecontent/index.md#L29), Requirement A94: *„…Implementation Guide "TIFlow - Abrechnungsinformatione" umsetzen.“* → sollte „Abrechnungsinformationen“ heißen.

10. **Falsche Ressourcenbezeichnung in Überschrift**
    [query-api-chargeitem-req-fdv.md, Zeile 57](igs/erp-chrg/input/pagecontent/query-api-chargeitem-req-fdv.md#L57): `### Abrechnungsinformation markieren (PATCH /Charge/<id>)` → sollte `/ChargeItem/<id>` heißen (fehlendes „Item“).

11. **Uneinheitliche Formatierung der Release-Notes-Überschriften**
    [release-notes.md](igs/erp-chrg/input/pagecontent/release-notes.md#L3): `### Version 2.0.0` ohne Datum, während die vorherige Version als `### Version 1.1.0 (2025-04-10)` mit Datum angegeben ist.
    → **Vorschlag:** Einheitlich mit oder ohne Datum in der Überschrift arbeiten.

12. **Interner Ticket-/Arbeitskommentar im veröffentlichten Content**
    [ttl.md, Zeile 1](igs/erp-chrg/input/pagecontent/ttl.md#L1): `<!-- TI-Flow-26_2 KBV_23, KBV_30 -->` sieht nach einer internen Vorgangs-/Ticketreferenz aus, die vor Veröffentlichung typischerweise entfernt wird (vgl. Sauberkeit anderer Seiten, die keine solchen Kommentare enthalten).
    → **Vorschlag:** Entfernen, falls kein bewusster Redaktions-Marker.

13. **Vermutlich doppelter/fehlerhafter Legacy-ID-Eintrag**
    [index.md, Zeile 32](igs/erp-chrg/input/pagecontent/index.md#L32): Kommentar `<!-- A_22206-01, A_22205-0, A_22204, A_22963, A_22205-01 -->` enthält sowohl `A_22205-0` als auch `A_22205-01` — sieht nach einem Tipp-/Kopierfehler aus (unvollständige ID neben der korrekten).
    → **Vorschlag:** `A_22205-0` prüfen und ggf. entfernen, falls es ein Duplikat von `A_22205-01` ist.

---

## 3. Geprüft und **nicht** als Fehler bestätigt (zur Vermeidung erneuter Prüfung)

- **Aktorbezeichner core vs. erp-chrg:** konsistent, kein Befund.
- **Requirement-Key-Eindeutigkeit:** alle 101 Keys eindeutig; die Nummerierung folgt keiner Datei-/Seitenreihenfolge, sondern einem globalen fortlaufenden Zähler über das ganze Modul — das ist normal und kein Fehler.
- **Unterschiedliche Anforderungsdichte** zwischen z. B. `query-api-communication-req-fd.md` (1 Requirement) und `query-api-chargeitem-req-fd.md` (~50 Requirements): sachlich durch den unterschiedlichen fachlichen Umfang der Operationen begründet.
- **Error-Code-Konsistenz:** `check_error_code_consistency` meldet 0 Probleme repo-weit.
- **Seiten-/Config-Abgleich:** `check_sushi_pages_crosscheck.py` meldet für erp-chrg 0 Befunde (fehlende Datei-Diskrepanz besteht nur in `igs/rx`, außerhalb dieses Scopes).

---

## 4. Zusammenfassung nach Priorität

| Priorität | Anzahl Befunde | Betrifft primär |
|---|---|---|
| 🔴 Hoch | 5 | Inhaltliche Fehler, Traceability, defekte Links |
| 🟡 Mittel | 3 | Repo-weite Rechtschreibung, QA-Tooling, Legacy-Naming |
| 🟢 Niedrig | 5 | Tippfehler, Formatierung, Hygiene |

Alle Befunde sind einzeln und unabhängig voneinander abarbeitbar; keiner erfordert strukturelle Änderungen an Sushi-Config, Menüstruktur oder Aktor-Konventionen.
