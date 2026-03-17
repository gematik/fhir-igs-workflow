Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen des DiGA-Implementation Guides definiert werden.

#### Capability Statements

Das _Capability_ _Statement_ beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

{% include artifacts-table-generator.html resourceType="CapabilityStatement" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements</figcaption></div>

### Ressourcenprofile

{% capture profiles %}
StructureDefinition/GEM-ERP-PR-Communication-DiGA,
StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>

### Logische Modelle

{% capture logicalmodels %}
StructureDefinition/GEM-ERP-LOG-MedicationDispense-DiGA
{% endcapture %}
{% include artifacts-table-generator.html render=logicalmodels %}
<div><figcaption><strong>Tabelle:</strong> Logische Modelle</figcaption></div>

### Erweiterungen (Extension) Definitions

{% capture extensions %}
StructureDefinition/GEM-ERP-EX-RedeemCode,
StructureDefinition/GEM-ERP-EX-DeepLink
{% endcapture %}
{% include artifacts-table-generator.html render=extensions %}
<div><figcaption><strong>Tabelle:</strong> Extension Definitions</figcaption></div>

### Mapping Definitions (StructureMaps)

{% capture mappings %}
StructureMap/GEM-ERP-MAP-MedicationDispense-DiGA
{% endcapture %}
{% include artifacts-table-generator.html render=mappings %}
<div><figcaption><strong>Tabelle:</strong> StructureMaps</figcaption></div>

### Beispielinstanzen

{% include example-list-generator.html %}
