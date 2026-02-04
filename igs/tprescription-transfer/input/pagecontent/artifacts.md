Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementierungsleitfadens definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Übertragung des digitalen Durchschlags E-T-Rezept. Dazu gehören Fachmodelle, Profile zur Spezifizierung von Ressourcen, Mapping Dateien zur Erstellung des Durchschlags aus Quelldaten, sowie Beispielen.

## Fachmodelle

Fachmodelle fasst Informationen zusammen, die auf fachlicher Ebene ausgetauscht werden. Sie dienen dazu den Kontext und die Inhalte der Profile nachzuvollziehen.

{% capture logicals %}
StructureDefinition/erp-tprescription-carbon-copy-logical
{% endcapture %}
{% include artifacts-table-generator.html render=logicals %}

## Profile

Die folgenden Profile stellen dar, welche Inhalte an den BfArM Webdienst übertragen werden:

{% capture profiles %}
StructureDefinition/erp-tprescription-carbon-copy,
StructureDefinition/erp-tprescription-medication-dispense,
StructureDefinition/erp-tprescription-medication-request,
StructureDefinition/erp-tprescription-medication,
StructureDefinition/erp-tprescription-organization,
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}

## Artefakte für das Mapping

Im folgenden sind Artefakte abgebildet, die unterstützen das Mapping der Quelldaten auf den digitalen Durchschlag E-T-Rezept zu realisieren.

### Unterstützende Profile

Diese Profile wurden erstellt, um Quelldatenstrukturen abzubilden und im Mapping zu realisieren:

{% capture map_profiles %}
StructureDefinition/erp-tprescription-vzd-searchset
{% endcapture %}
{% include artifacts-table-generator.html render=map_profiles %}

### StructureMaps

StructureMaps sind strukturierte Dokumente, die maschinenlesbare Möglichkeit bieten Daten in andere Formate zu überführen.

{% include artifacts-table-generator.html resourceType="StructureMap" %}

## Beispielinstanzen

{% include example-list-generator.html %}