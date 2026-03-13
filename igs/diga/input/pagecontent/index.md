Dieser Implementation Guide beschreibt das Feature zur elektronischen Verordnung
von Digitalen Gesundheitsanwendungen (DiGA). Er beschreibt
DiGA-spezifische Anforderungen und Use Cases für Verordnende, Kostenträger und
Versicherte.

### Zielgruppe
Hersteller und Anbieter des Produkttyps TI-Flow-Fachdienst sowie Hersteller von Clientsystemen für den Zugriff auf den Workflow-Fachdienst.

### Zweck und Geltungsbereich

- Erstellen einer elektronische Verordnung von DiGAs (Workflow 162)
- Zuweisung der Verordnung durch den Versicherten an den Kostenträger
- Bereitstellung eines Freischaltcodes als Abgabeinformation durch den Kostenträger an den Versicherten

### Wie dieser IG zu lesen ist

Die Inhalte sind in Fachlichkeit, Technische Umsetzung und Schnittstellen
strukturiert. Ein durchgängendes Szenario beschreibt den Prozess vom
Verordnen bis zum Einlösen.


### Anforderungen zur Umsetzung des IGs

<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-19" title="E-Rezept: Anwendung des IG 'Verordnungen für Digitale Gesundheitsanwendungen (DiGA)' für Workflow 162" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst und dessen Clients MÜSSEN zur Umsetzung des Workflow 162 den Implementation Guide "Verordnungen für Digitale Gesundheitsanwendungen (DiGA)" umsetzen.
</requirement>

<!-- A_26060, A_23027, A_19295-01, A_22483-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-DIGA-20" title="E-Rezept: Umsetzung des Moduls 'Verordnungen für Digitale Gesundheitsanwendungen (DiGA)'" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Der E-Rezept-Fachdienst und dessen Clients MÜSSEN zur Umsetzung des Implementation Guides "Verordnungen für Digitale Gesundheitsanwendungen (DiGA)" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind, sowie Anforderungen und Artefakte aus [gemIG_TIFlow_core], die in diesem IG referenziert werden.
</requirement>


### Methodik

#### Apps
In diesem Dokument IG verschiedene Apps betrachtet.

**App nach § 360 Abs. 10 SGB V**

Eine App nach § 360 Abs. 10 SGB V kann dem Versicherten durch seine Krankenkasse oder die gematik zur Verfügung gestellt werden. Sie wird als E-Rezept-FdV bezeichnet.

**Service-App der Krankenkasse**

Eine Krankenkassen-App ist eine App, die dem Versicherten Services seiner Krankenkasse zur Verfügung stellt und nicht den Regelungen nach § 360 Abs. 10 SGB V unterliegt.

**DiGA-App**

Die DiGA-Apps sind die im BfArM Verzeichnis gelisteten Einträge, welche dem Versicherten verordnet werden können.

#### Rolle Verordnender (Arzt/Zahnarzt/Psychotherapeut)
Wenn im Dokument der Arzt in der Rolle Verordnender benannt wird, dann umfasst diese sowohl die Ärzte, Zahnärzte als auch Psychotherapeuten, sofern Zahnärzte und Psychotherapeuten nicht explizit ausgeschlossen werden.

Wenn im Dokument Psychotherapeuten benannt werden, dann umfasst diese Bezeichnung Psychotherapeuten, psychologische Psychotherapeuten sowie Kinder- und Jugendpsychotherapeuten.

#### Dispensieren/Dispensierinformation
Im Kontext der Verordnung einer DiGA wird unter Dispensieren die Bereitstellung der
Dispensierinformation für den Versicherten durch die Krankenkasse verstanden.
Die Dispensierinformationen beinhalten die Information zur verordneten DiGA und den
Freischaltcode. Falls kein Freischaltcode bereitgestellt werden kann, wird ein Hinweis auf
den Grund dafür übermittelt.

#### Anforderungen / Anwendungsfälle
Anforderungen und Anwendungsfälle werden durch eine eindeutige ID sowie die
Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN gemäß RFC 2119
gekennzeichnet.

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an
[erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de).

### Rechtliche Hinweise

Copyright ©2026+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von
Health Level Seven International.
