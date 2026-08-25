Dieser Implementation Guide beschreibt die Datenmodelle und Prozesse des TI-Flow-Fachdienstes für den Anwendungsfall von "Arzneimittelverordnung". Er bildet das Fundament für die fachlichen Szenarien und die technischen Schnittstellen im E-Rezept-Workflow für dieses Szenario.

### Zweck und Geltungsbereich

- Grundlegende Workflows für E-Rezepte zur Arzneimittelversorgung:
  - **160, 200** zur Verordnung von Arzneimitteln
  - **169, 209** zur Verordnung von Arzneimitteln mit Workflowsteuerung durch den Leistungserbringer
  - **166** zur Verordnung von E-T-Rezepten
- Profile, Operationen und Validierungsregeln
- Funktionale Anforderungen
- Einlösen von E-Rezepten im EU-Ausland (Feature "EU Zugriff E-Rezept", siehe [gemspec eRp EU 1.0.1](https://gemspec.gematik.de/docs/gemF/gemF_eRp_EU/gemF_eRp_EU_V1.0.1/)): Ergänzungen an den Schnittstellen des TI-Flow-Fachdienstes sowie Use Cases für Versicherte zur Verwaltung von Einwilligung und Zugriff

### Nicht im Scope

- Modul-übergreifende Anwendungsfälle
- Produkttyp-spezifische Implementierungsdetails außerhalb des Fachdienstes
- Beschreibung und Definition von Prozessen außerhalb des Fachdienstes
- Anbindung der TI an die eHDSI
- Mapping zwischen deutschen Verordnungsdaten und dem EU-Datenmodell
- Abrechnung von im EU-Ausland eingelösten E-Rezepten
- Workflows, die nicht final mit Stakeholdern des TI-Flow abgestimmt sind <!-- TI-Flow-26_2 KBV_20, KBV_04 -->

### Anforderungen zur Umsetzung des IGs

<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A115" title="E-Rezept: Anwendung des IG 'E-Rezept für Arzneimittel' für Workflows 160, 166, 169, 200 und 209" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_TI-Flow_verordnend" description="PS-Schnittstelle für TI-Flow/verordnende LEI">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst und dessen Clients MÜSSEN zur Umsetzung der Workflows 160, 166, 169, 200 und 209 den Implementation Guide "E-Rezept für Arzneimittel" umsetzen.
</requirement>

<!-- A_20213-01, A_23027, A_19300-01, A_23028, A_19299-02, A_19297-01, A_19295-01, A_22483-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A116" title="E-Rezept: Umsetzung des Moduls 'E-Rezept für Arzneimittel'" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="TI-Flow_FdV" description="TI-Flow-Frontend des Versicherten">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_TI-Flow_Apotheke" description="PS-Schnittstelle für TI-Flow/Apotheke">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_TI-Flow_verordnend" description="PS-Schnittstelle für TI-Flow/verordnende LEI">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst und dessen Clients MÜSSEN zur Umsetzung des Implementation Guides "E-Rezept für Arzneimittel" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind, sowie Anforderungen und Artefakte aus [gemIG_TIFlow_core], die in diesem IG referenziert werden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A270" title="E-Rezept: Anwendung des Features 'EU Zugriff E-Rezept' für Einlösen von E-Rezepten im EU Ausland" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="NCPeH_ePeDA" description="ePrescription/eDispensation Land-A National Contact Point for eHealth">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst und dessen Client MÜSSEN zur Umsetzung des Einlösens von E-Rezepten im EU Ausland die in diesem Implementation Guide definierten Inhalte zum Feature "EU Zugriff E-Rezept" umsetzen.
</requirement>

<!-- A_22206-01, A_27189 -->
<requirement conformance="SHALL" key="IG-TIFLOW-ERP-A271" title="E-Rezept: Umsetzung des Features 'EU Zugriff E-Rezept'" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="NCPeH_ePeDA" description="ePrescription/eDispensation Land-A National Contact Point for eHealth">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst und dessen Client MÜSSEN zur Umsetzung des Features "EU Zugriff E-Rezept" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG für das Feature definiert sind, sowie Anforderungen und Artefakte aus [gemIG_TIFlow_core], die in diesem IG referenziert werden.
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
