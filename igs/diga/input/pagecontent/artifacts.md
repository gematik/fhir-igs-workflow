# FHIR-Artefakte

Diese Seite enthaelt eine Uebersicht aller FHIR-Artefakte, die im Rahmen des DiGA-Implementation Guides definiert werden.

### Parameterprofile fuer Operationen

{% include artefacts-structuredef-table-generator.html type="Parameters" %}
<div><figcaption><strong>Tabelle:</strong> Parameterprofile</figcaption></div>

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
