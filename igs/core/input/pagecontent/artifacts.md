Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein _Capability Statement_ zur Beschreibung der unterstützten Funktionen sowie _Operation Definitions_, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die TIFlow-Funktionalitäten festgelegt.

{% capture valuesets %}
ValueSet/tiflow-order-task-status-vs
{% endcapture %}
{% include artifacts-table-generator.html render=valuesets %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>

{% comment %}
### Terminologien: Code Systems

{% capture codesystems %}
CodeSystem/tiflow-operation-outcome-details-cs,
{% endcapture %}
{% include artifacts-table-generator.html render=codesystems %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>
{% endcomment %}

### Logical Models

{% capture logicals %}
StructureDefinition/ti-feature-definition,
{% endcapture %}
{% include artifacts-table-generator.html render=logicals%}
<div><figcaption><strong>Tabelle:</strong> Logical Models</figcaption></div>

### Funktions Definition

{% capture features %}
StructureDefinition/ti-flow-feature-wf160,
StructureDefinition/ti-flow-feature-wf169,
{% endcapture %}
{% include artifacts-table-generator.html render=features%}
<div><figcaption><strong>Tabelle:</strong> Funktions Definition</figcaption></div>

### Systemverhalten

#### Capability Statements

Das _Capability_ _Statement_ beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

{% include artifacts-table-generator.html resourceType="CapabilityStatement" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements</figcaption></div>

{% comment %}
#### Operation Definitions

{% include artifacts-table-generator.html resourceType="OperationDefinition" %}
<div><figcaption><strong>Tabelle:</strong> Operation Definitions</figcaption></div>
{% endcomment %}

{%comment%}
#### Suchparameter

{% include artifacts-table-generator.html resourceType="SearchParameter" %}
<div><figcaption><strong>Tabelle:</strong> Suchparameter</figcaption></div>
{%endcomment%} 


#### Operation Outcomes

{% capture operationoutcome %}
StructureDefinition/tiflow-operation-outcome,
CodeSystem/tiflow-operation-outcome-details-cs,
ValueSet/tiflow-operation-outcome-details-vs
{% endcapture %}
{% include artifacts-table-generator.html render=operationoutcome %}
<div><figcaption><strong>Tabelle:</strong> Operation Outcomes</figcaption></div>

### Telemetriedaten

{% include artifacts-table-generator.html resourceType="ConceptMap" %}
<div><figcaption><strong>Tabelle:</strong> Telemetriedaten Status Codes</figcaption></div>


### Ressourcenprofile

{% capture profiles %}
StructureDefinition/tiflow-order-task,
StructureDefinition/tiflow-communication,
StructureDefinition/tiflow-audit-event-rest,
StructureDefinition/tiflow-capability-statement,
StructureDefinition/tiflow-op-accept-bundle
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>

{% comment %}
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

### Legacy-Artefakte

Diese Sektion enthält FHIR-Artefakte, deren kanonische URL bewusst auf einem vorherigen Stand belassen wurde. Dadurch bleibt die Rückwärtskompatibilität für bestehende Implementierungen erhalten.

#### Lagacy Terminologien: Code Systems

{% capture legacy-codesystems %}
CodeSystem/GEM-ERP-CS-AvailabilityStatus,
CodeSystem/GEM-ERP-CS-DocumentType,
CodeSystem/GEM-ERP-CS-FlowType,
{% endcapture %}
{% include artifacts-table-generator.html render=legacy-codesystems %}
<div><figcaption><strong>Tabelle:</strong> Lagacy Code Systems</figcaption></div>

#### Lagacy Terminologien: Value Sets

{% capture legacy-valuesets %}
ValueSet/GEM-ERP-VS-FlowType,
ValueSet/GEM-ERP-VS-DocumentType,
ValueSet/GEM-ERP-VS-AvailabilityStatus
{% endcapture %}
{% include artifacts-table-generator.html render=legacy-valuesets %}
<div><figcaption><strong>Tabelle:</strong> Lagacy Value Sets</figcaption></div>

#### Lagacy Suchparameter

{% capture legacy-searchparams %}
SearchParameter/TaskAcceptDateSP,
SearchParameter/TaskExpiryDateSP
{% endcapture %}
{% include artifacts-table-generator.html render=legacy-searchparams %}
<div><figcaption><strong>Tabelle:</strong> Lagacy Suchparameter</figcaption></div>

#### Lagacy Ressourcenprofile

{% capture legacy-profiles %}
StructureDefinition/GEM-ERP-PR-Binary,
StructureDefinition/GEM-ERP-PR-Device,
StructureDefinition/GEM-ERP-PR-Digest,
StructureDefinition/GEM-ERP-PR-Bundle,
StructureDefinition/GEM-ERP-PR-Composition,
{% endcapture %}
{% include artifacts-table-generator.html render=legacy-profiles %}
<div><figcaption><strong>Tabelle:</strong> Lagacy Ressourcenprofile</figcaption></div>

#### Lagacy Erweiterungen (Extension) Definitions

{% capture legacy-extensions %}
StructureDefinition/GEM-ERP-EX-AcceptDate,
StructureDefinition/GEM-ERP-EX-Beneficiary,
StructureDefinition/GEM-ERP-EX-ExpiryDate,
StructureDefinition/GEM-ERP-EX-PrescriptionType,
{% endcapture %}
{% include artifacts-table-generator.html render=legacy-extensions %}
<div><figcaption><strong>Tabelle:</strong> Extension Definitions</figcaption></div>

#### Lagacy Datentypen

{% capture legacy-datatypes %}
StructureDefinition/GEM-ERP-PR-Signature,
{% endcapture %}
{% include artifacts-table-generator.html render=legacy-datatypes %}
<div><figcaption><strong>Tabelle:</strong> Lagacy Datentypen</figcaption></div>

### Beispielinstanzen

{% include example-list-generator.html %}