Dieser Implementation Guide beschreibt Profile und deren Verwendung für den Datenaustausch zwischen dem E-Rezept-Fachdienst und dem BfArM Webdienst.

### Zweck und Geltungsbereich

- Übertragung des digitalen Durchschlags E-T-Rezept an das BfArM T-Register
- Profile und Mappingdaten für den Datenaustausch
- Dokumentation der relevanten Anwendungsfälle

### Nicht im Scope

- Beschreibung des Workflow **166** zur Verordnung von E-T-Rezepten, hierzu siehe [gemIG_TIFlow_rx].

### Anforderungen zur Umsetzung des IGs

<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-15" title="E-Rezept: Anwendung des IG 'Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst' für Übertragung von Daten vom E-Rezept-Fachdienst an den BfArM Webdienst" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS zur Umsetzung der Übertragung von Daten vom E-Rezept-Fachdienst an den BfArM Webdienst den Implementation Guide "Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst" umsetzen.
</requirement>

<!-- A_27843 -->
<requirement conformance="SHALL" key="IG-TIFLOW-BFARM-16" title="E-Rezept: Umsetzung des Moduls 'Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst'" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS zur Umsetzung des Implementation Guides "Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind, sowie Anforderungen und Artefakte aus [gemIG_TIFlow_core], die in diesem IG referenziert werden.
</requirement>


### Wie dieser IG zu lesen ist

Dieser Implementation Guide ist "von links nach rechts" zu lesen. Die Menüstruktur beginnt mit fachlichen Inhalten, welche über die technischen Anwendungsfälle dann in den Spezifikationen der Endpunkte und APIs münden. Es wird empfohlen, die Inhalte in der vorgegebenen Reihenfolge zu lesen, um ein umfassendes Verständnis der Anforderungen und Spezifikationen zu erhalten.

Für einen Überblick über die Inhalte und die Struktur dieses Implementation Guides kann die [Inhaltsübersicht](toc.html) konsultiert werden. Dort sind die verschiedenen Kapitel und Abschnitte mit ihren jeweiligen Inhalten und Anforderungen aufgeführt.

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an [erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de).

### Rechtliche Hinweise

Copyright ©2025+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von Health Level Seven International.
