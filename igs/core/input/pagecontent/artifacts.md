Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein _Capability Statement_ zur Beschreibung der unterstützten Funktionen sowie _Operation Definitions_, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die FHIR-Data-Service-Funktionalitäten festgelegt.

{%comment%}
//TODO
{% capture valuesets %}
ValueSet/context-code,
ValueSet/emp-medicationrequest-status-vs,
ValueSet/epa-medication-statement-status-vs,
ValueSet/epa-medicationstatement-type-code,
ValueSet/epa-provide-dispensation-status-vs,
ValueSet/epa-medicationstatement-processing-event-code,
{% endcapture %}
{% include artifacts-table-generator.html render=valuesets %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>
{%endcomment%}

### Terminologien: Code Systems

{%comment%}
//TODO
{% capture codesystems %}
CodeSystem/context-code,
CodeSystem/epa-medicationstatement-processing-event-code,
{% endcapture %}
{% include artifacts-table-generator.html render=codesystems %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>
{%endcomment%}

### Systemverhalten

#### Capability Statements

Das _Capability_ _Statement_ beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

{% include artifacts-table-generator.html resourceType="CapabilityStatement" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements</figcaption></div>


#### Operation Definitions

{% include artifacts-table-generator.html resourceType="OperationDefinition" %}
<div><figcaption><strong>Tabelle:</strong> Operation Definitions</figcaption></div>


{%comment%}
//TODO
#### Suchparameter

{% include artifacts-table-generator.html resourceType="SearchParameter" %}
<div><figcaption><strong>Tabelle:</strong> Suchparameter</figcaption></div>
{%endcomment%}

{%comment%}
//TODO
#### Operation Outcomes

{% capture operationoutcome %}
StructureDefinition/epa-ms-operation-outcome,
CodeSystem/epa-ms-operation-outcome-details,
ValueSet/epa-ms-operation-outcome-details
{% endcapture %}
{% include artifacts-table-generator.html render=operationoutcome %}
<div><figcaption><strong>Tabelle:</strong> Operation Outcomes</figcaption></div>
{%endcomment%}


### Parameterprofile für Operationen

{% include artefacts-structuredef-table-generator.html type="Parameters"%}
<div><figcaption><strong>Tabelle:</strong> Parameterprofile</figcaption></div>


{%comment%}
//TODO
### Ressourcenprofile

{% capture profiles %}
StructureDefinition/epa-medication,
StructureDefinition/epa-medication-statement,
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>
{%endcomment%}

{%comment%}
//TODO
### Datentypen

{% capture datatypes %}
StructureDefinition/epa-medication-unique-identifier,
StructureDefinition/rx-originator-process-identifier,
StructureDefinition/rx-prescription-process-identifier
{% endcapture %}
{% include artifacts-table-generator.html render=datatypes %}
<div><figcaption><strong>Tabelle:</strong> Datentypen</figcaption></div>
{%endcomment%}

### Erweiterungen (Extension) Definitions

{% include artefacts-structuredef-table-generator.html type="Extension"%}
<div><figcaption><strong>Tabelle:</strong> Extension Definitions</figcaption></div>


### Beispielinstanzen

{% include example-list-generator.html %}