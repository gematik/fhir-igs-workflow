Die folgenden Operation APIs stellt der E-Rezept-Fachdienst dem _Primärsystem eRp_ sowie dem _eRp-FdV_ zur Verfügung.

### E-Rezepte bereitstellen
- Primärsystem: [Operation API: E-Rezept erstellen](./op-create.html)
- Primärsystem: [Operation API: E-Rezept aktivieren](./op-activate.html)
- Primärsystem: [Operation API: E-Rezept löschen](./op-abort.html)

### E-Rezepte beliefern
tbd

### Mehrfachverordnung (MVO) – API-relevante Besonderheiten

Für die Mehrfachverordnung gelten zusätzliche Regeln auf den bestehenden Operationen (keine neuen Endpunkte):

**$activate (Task aktivieren)**
- Nur zulässig für Flowtype 160, 169, 200, 209.
- `Numerator` und `Denominator` müssen die Teilverordnungen 2..4 abbilden, mit `1 ≤ Numerator ≤ Denominator ≤ 4`.
- MVO-Daten dürfen **nur** gesetzt sein, wenn das MVO-Kennzeichen = true ist.
- Keine Kombination mit Entlassrezepten oder Ersatzverordnungen.
- `valuePeriod.start` ist Pflicht; `valuePeriod.end` optional (sonst Standard: Ausstellungsdatum + 365 Tage).

**$accept (Task abrufen)**
- Liegt der Beginn der Einlösefrist in der Zukunft, MUSS der Fachdienst mit HTTP 403 antworten und im `OperationOutcome` den Beginn der Einlösefrist nennen.

Die Detailanforderungen sind in der Operation [op-activate.html](./op-activate.html) dokumentiert.

<br>