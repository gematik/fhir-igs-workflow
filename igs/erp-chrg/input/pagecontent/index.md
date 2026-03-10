Dieser Implementation Guide beschreibt die Bereitstellung der Abrechnungsinformationen für den
Kostenträger. Er ergänzt die workflowspezifischen Anforderungen des
E-Rezept-Fachdienstes und beschreibt die relevanten Use Cases.

### Zweck und Geltungsbereich

- Verwaltung von Abrechnungsinformationen von E-Rezepten für PKV-Versicherte
- Bereitstellen von Abrechnungsinformationen von E-Rezepten durch das AVS

### Nicht im Scope

- Arzneimittelspezifische Workflows zur Belieferung von E-Rezepten
- Nicht apothekenpflichtige Verordnungen
- Abrechnung ausserhalb des E-Rezept-Fachdienstes

### Anforderungen zur Umsetzung des IGs

<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-161" title="E-Rezept: Anwendung des IG 'Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte' für die Verwaltung von Abrechnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst und dessen Clients MÜSSEN zur Umsetzung der Verwaltung von Abrechnungsinformationen zu Arzneimitteln den Implementation Guide "Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte" umsetzen.
</requirement>

<!-- A_22206-01, A_22205-0, A_22204, A_22963 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CHRG-162" title="E-Rezept: Umsetzung des Moduls 'Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte'" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst und dessen Clients MÜSSEN zur Umsetzung des Implementation Guides "Abrechnungsinformationen zu E-Rezepten für PKV-Versicherte" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind, sowie Anforderungen und Artefakte aus [gemIG_TIFlow_core], die in diesem IG referenziert werden.
</requirement>

### Wie dieser IG zu lesen ist

Die Kapitel folgen der Struktur Fachlichkeit, Technische Umsetzung und
Schnittstellen. Szenarien und Anwendungsfälle verweisen auf die zugehörigen
technischen Kapitel und Profile.

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an
[erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de).

### Rechtliche Hinweise

Copyright ©2026+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von
Health Level Seven International.
