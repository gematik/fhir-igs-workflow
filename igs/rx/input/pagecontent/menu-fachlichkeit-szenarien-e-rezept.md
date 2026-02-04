## Mehrfachverordnung (MVO) im E-Rezept-Workflow

Die Mehrfachverordnung ermöglicht die Ausstellung von mehreren, inhaltlich zusammengehörenden Teilverordnungen für ein Arzneimittel innerhalb eines einzigen Verordnungsvorgangs. Grundlage ist § 31 Abs. 1b SGB V (sowie § 4 Abs. 3 AMVV i.V.m. § 2 Abs. 1 Nr. 6a AMVV). Jede Teilverordnung ist ein vollwertiges E-Rezept mit eigener QES, eigenem Token und eigenem Workflow (Task) und kann unabhängig eingelöst werden.

### Fachliche Einordnung

- **Anzahl der Teilverordnungen:** mindestens 2, maximal 4.
- **Eigenständige Einlösung:** Jede Teilverordnung kann in derselben oder in unterschiedlichen Apotheken eingelöst werden.
- **Gültigkeitszeitraum:** Der Beginn der Einlösefrist wird vom Verordnenden festgelegt; das Ende kann optional gesetzt werden. Ohne Enddatum gilt die Teilverordnung bis 365 Tage nach Ausstellungsdatum.
- **Kein Ersatzverfahren:** Mehrfachverordnungen existieren ausschließlich elektronisch (kein Muster 16, keine Ersatzverordnung).
- **Ausschlüsse:** Keine Mehrfachverordnung für Entlassrezepte, BTM- und T-Rezepte.

### Beteiligte Rollen und Nutzen

**Versicherte** profitieren davon, dass Teilverordnungen getrennt einlösbar sind, Einlösezeiträume transparent werden und die App auf Gültigkeiten hinweisen kann.  
**Verordnende** können mehrere Teilverordnungen in einem Vorgang ausstellen und Einlösefristen automatisiert berechnen.  
**Apotheken** erkennen MVO-Rezepte, sehen Nummerierung und Gültigkeitszeitraum und bearbeiten Teilverordnungen separat.

### Prozessüberblick

1. **Verordnung**: Im Primärsystem werden die Teilverordnungen erzeugt und als Mehrfachverordnung gekennzeichnet.
2. **Signatur & Aktivierung**: Jede Teilverordnung wird separat qualifiziert signiert und anschließend als eigener Task aktiviert.
3. **Einlösung**: Teilverordnungen werden erst ab Beginn der Einlösefrist durch Apotheken abrufbar und belieferbar.
4. **Löschung**: Für Teilverordnungen gelten die gleichen Löschfristen wie für Einzelrezepte (automatisch 10 Tage nach Gültigkeit bzw. 100 Tage nach Dispensierung).

### Einschränkungen und Besonderheiten

- Eine Mehrfachverordnung ist nur für apothekenpflichtige Arzneimittel zulässig.
- Teilverordnungen sind **keine** Ersatzverordnungen und **keine** Entlassrezepte.
- Ein Ausdruck kann mehrere Teilverordnungen enthalten; Tokens mit zukünftiger Gültigkeit dürfen bei Scan nicht automatisch gespeichert werden.

### Weiterführende Abschnitte

- Technische Anwendungsfälle: [menu-technische-umsetzung-anwendungsfaelle.html](./menu-technische-umsetzung-anwendungsfaelle.html)
- Operation API (Aktivierung & Abruf): [menu-schnittstellen-operation-api.html](./menu-schnittstellen-operation-api.html)