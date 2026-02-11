Das Feature "Elektronische Verordnung von DiGAs" erweitert die bestehenden Workflows um
Verordnungen für Digitale Gesundheitsanwendungen (DiGA). DiGAs sind zertifizierte Apps oder Webanwendungen, die Patienten bei der Erkennung, Überwachung und Behandlung von Erkrankungen unterstützen. 
Das Feature beschreibt die Prozessparameter, Rollen und fachlichen Anforderungen für den Workflow-Fachdienst und beteiligte Clientsysteme.

## Zielgruppe
Hersteller und Anbieter des Produkttyps Workflow-Fachdienst sowie Hersteller von Clientsystemen für den Zugriff auf den Workflow-Fachdienst.

## Abgrenzungen
Folgende Aspekte sind nicht Gegenstand dieses IG:
- Beantragung einer DiGA ohne ärztliche oder psychotherapeutische Verordnung.
- Verordnungen für Privatversicherte und sonstige Kostenträger.
- Abrechnungsschnittstellen zwischen DiGA-Herstellern und Krankenkassen.

## Methodik
### Anforderungen / Anwendungsfälle
Anforderungen und Anwendungsfälle werden durch eine eindeutige ID sowie die
Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN gemäss RFC 2119
gekennzeichnet.

### Apps
In diesem Dokument IG verschiedene Apps betrachtet.

**App nach § 360 Abs. 10 SGB V**

Eine App nach § 360 Abs. 10 SGB V kann dem Versicherten durch seine Krankenkasse oder die gematik zur Verfügung gestellt werden. Sie wird als E-Rezept-FdV bezeichnet.

**Service-App der Krankenkasse**

Eine Krankenkassen-App ist eine App, die dem Versicherten Services seiner Krankenkasse zur Verfügung stellt und nicht den Regelungen nach § 360 Abs. 10 SGB V unterliegt.

**DiGA-App**

Die DiGA-Apps sind die im BfArM Verzeichnis gelisteten Einträge, welche dem Versicherten verordnet werden können.

### Rolle Verordnender (Arzt/Zahnarzt/Psychotherapeut)
Wenn im Dokument der Arzt in der Rolle Verordnender benannt wird, dann umfasst diese sowohl die Ärzte, Zahnärzte als auch Psychotherapeuten, sofern Zahnärzte und Psychotherapeuten nicht explizit ausgeschlossen werden.

Wenn im Dokument Psychotherapeuten benannt werden, dann umfasst diese Bezeichnung Psychotherapeuten, psychologische Psychotherapeuten sowie Kinder- und Jugendpsychotherapeuten.
