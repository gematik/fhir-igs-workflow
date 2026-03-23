### EU Zugriff E-Rezept

Dieser Implementation Guide beschreibt das Feature zur Übermittlung von
Verordnungen für die Einlösung im EU-Ausland. Im Fokus stehen die
Prozessparameter und Ergänzungen an den Schnittstellen des TI-Flow-Fachdienstes
sowie die Use Cases für Versicherte zur Verwaltung von Einwilligung und Zugriff.

Die Inhalte basieren auf der Spezifikation "EU Zugriff E-Rezept", Version 1.0.1
(Stand: 10.04.2025). 
[gemspec eRp EU 1.0.1](https://gemspec.gematik.de/docs/gemF/gemF_eRp_EU/gemF_eRp_EU_V1.0.1/)

### Zweck und Geltungsbereich

- Ergänzungen zu den Schnittstellen des TI-Flow-Fachdienstes
- Beschreibung der fachlichen und technischen Use Cases
- Anforderungen für die beteiligten Produkttypen

### Nicht im Scope

- Anbindung der TI an die eHDSI
- Mapping zwischen deutschen Verordnungsdaten und dem EU-Datenmodell
- Abrechnung von im EU-Ausland eingelösten E-Rezepten
- Umsetzung von Workflows zu Arzneimitteln

### Anforderungen zur Umsetzung des IGs

<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-47" title="E-Rezept: Anwendung des IG 'EU Zugriff E-Rezept' für Einlösen von E-Rezepten im EU Ausland" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst und dessen Client MÜSSEN zur Umsetzung des Einlösens von E-Rezepten im EU Ausland den Implementation Guide "EU Zugriff E-Rezept" umsetzen.
</requirement>

<!-- A_22206-01, A_27189 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-48" title="E-Rezept: Umsetzung des Moduls 'EU Zugriff E-Rezept'" version="0">
    <meta lockversion="true"/>
    <actor name="TI_Flow_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="NCPeH_ePeDA">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der TI-Flow-Fachdienst und dessen Client MÜSSEN zur Umsetzung des Implementation Guides "EU Zugriff E-Rezept" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind, sowie Anforderungen und Artefakte aus [gemIG_TIFlow_core], die in diesem IG referenziert werden.
</requirement>

### Wie dieser IG zu lesen ist

Die Kapitel folgen der Struktur Fachlichkeit, Technische Umsetzung und
Schnittstellen. Szenarien und Anwendungsfälle verweisen auf die zugehörigen
technischen Kapitel.

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an
[erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de).

### Rechtliche Hinweise

Copyright ©2025+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von
Health Level Seven International.

