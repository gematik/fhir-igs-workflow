Dieser Implementation Guide beschreibt die Datenmodelle und Prozesse des E-Rezept-Fachdienstes für den Anwendungsfall von "Arzneimittelverordnung". Er bildet das Fundament für die fachlichen Szenarien und die technischen Schnittstellen im E-Rezept-Workflow für dieses Szenario.

### Zweck und Geltungsbereich

- Grundlegende Workflows für E-Rezepte zur Arzneimittelversorgung:
  - **160, 200** zur Verordnung von Arzneimitteln
  - **169, 209** zur Verordnung von Arzneimitteln mit Workflowsteuerung durch den Leistungserbringer
  - **166** zur Verordnung von E-T-Rezepten
- Profile, Operationen und Validierungsregeln
- Funktionale Anforderungen

### Nicht im Scope

- Modul-übergreifende Anwendungsfälle
- Produkttyp-spezifische Implementierungsdetails außerhalb des Fachdienstes
- Beschreibung und Definition von Prozessen außerhalb des Fachdienstes

### Anforderungen zur Umsetzung des IGs

<requirement conformance="SHALL" key="IG-TIFLOW-RX-92" title="E-Rezept: Anwendung des IG 'E-Rezept für Arzneimittel' für Workflows 160, 166, 169, 200 und 209" version="0">
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
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst und dessen Clients MÜSSEN zur Umsetzung der Workflows 160, 166, 169, 200 und 209 den Implementation Guide "E-Rezept für Arzneimittel" umsetzen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-RX-93" title="E-Rezept: Umsetzung des Moduls 'E-Rezept für Arzneimittel'" version="0">
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
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst und dessen Clients MÜSSEN zur Umsetzung des Implementation Guides "E-Rezept für Arzneimittel" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind, sowie Anforderungen und Artefakte aus [gemIG_TIFlow_core], die in diesem IG referenziert werden.
</requirement>


### Wie dieser IG zu lesen ist

Dieser Implementation Guide ist "von links nach rechts" zu lesen. Die Menüstruktur beginnt mit fachlichen Inhalten, welche über die technischen Anwendungsfälle dann in den Spezifikationen der Endpunkte und APIs münden. Es wird empfohlen, die Inhalte in der vorgegebenen Reihenfolge zu lesen, um ein umfassendes Verständnis der Anforderungen und Spezifikationen zu erhalten.

Für einen Überblick über die Inhalte und die Struktur dieses Implementation Guides kann die [Inhaltsübersicht](toc.html) konsultiert werden. Dort sind die verschiedenen Kapitel und Abschnitte mit ihren jeweiligen Inhalten und Anforderungen aufgeführt.

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an
[erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de).

### Rechtliche Hinweise

Copyright ©2026+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von
Health Level Seven International.
