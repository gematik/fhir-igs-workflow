Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein _Capability Statement_ zur Beschreibung der unterstützten Funktionen sowie _Operation Definitions_, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die TIFlow-Funktionalitäten festgelegt.

{% capture valuesets %}
ValueSet/GEM-ERPCHRG-VS-ConsentType,
ValueSet/tiflow-chargeitem-operation-outcome-details-vs
{% endcapture %}
{% include artifacts-table-generator.html render=valuesets %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>

{% comment %}
### Terminologien: Code Systems

{% capture codesystems %}
CodeSystem/tiflow-chargeitem-operation-outcome-details-cs
{% endcapture %}
{% include artifacts-table-generator.html render=codesystems %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>
{% endcomment %}

### Systemverhalten

#### Capability Statements

Das _Capability_ _Statement_ beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

{% include artifacts-table-generator.html resourceType="CapabilityStatement" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements</figcaption></div>

{% comment %}

### Ressourcenprofile

{% capture profiles %}
StructureDefinition/GEM-ERPCHRG-PR-ChargeItem,
StructureDefinition/GEM-ERPCHRG-PR-Communication-ChargChangeReply,
StructureDefinition/GEM-ERPCHRG-PR-Communication-ChargChangeReq,
StructureDefinition/GEM-ERPCHRG-PR-Consent,
StructureDefinition/GEM-ERPCHRG-PR-PAR-Patch-ChargeItem-Input
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>

### Datentypen

{% capture datatypes %}
{% endcapture %}
{% include artifacts-table-generator.html render=datatypes %}
<div><figcaption><strong>Tabelle:</strong> Datentypen</figcaption></div>
{% endcomment %}

{% comment %}
### Erweiterungen (Extension) Definitions

{% include artefacts-structuredef-table-generator.html type="Extension"%}
<div><figcaption><strong>Tabelle:</strong> Extension Definitions</figcaption></div>
{% endcomment %}


### Beispielinstanzen

{% include example-list-generator.html %}