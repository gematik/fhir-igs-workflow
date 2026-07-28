Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein _Capability Statement_ zur Beschreibung der unterstützten Funktionen sowie _Operation Definitions_, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die TIFlow-Funktionalitäten festgelegt.

{% capture valuesets %}
ValueSet/GEM-ERPEU-VS-Consent-PolicyRule,
ValueSet/GEM-ERPEU-VS-ConsentType,
ValueSet/GEM-ERPEU-VS-RequestType,
ValueSet/tiflow-xborder-operation-outcome-details-vs
{% endcapture %}
{% include artifacts-table-generator.html render=valuesets %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>


### Terminologien: Code Systems

{% capture codesystems %}
CodeSystem/GEM-ERPEU-CS-ConsentType
CodeSystem/GEM-ERPEU-CS-RequestType
CodeSystem/tiflow-xborder-operation-outcome-details-cs
{% endcapture %}
{% include artifacts-table-generator.html render=codesystems %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>


### Logical Models

{% capture logicals %}
StructureDefinition/logical-eu-dispense-data,
{% endcapture %}
{% include artifacts-table-generator.html render=logicals%}
<div><figcaption><strong>Tabelle:</strong> Logical Models</figcaption></div>

### Systemverhalten

#### Capability Statements

Das _Capability_ _Statement_ beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

{% include artifacts-table-generator.html resourceType="CapabilityStatement" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements</figcaption></div>

#### Operation Definitions

{% include artifacts-table-generator.html resourceType="OperationDefinition" %}
<div><figcaption><strong>Tabelle:</strong> Operation Definitions</figcaption></div>

### Parameterprofile für Operationen

{% include artefacts-structuredef-table-generator.html type="Parameters"%}
<div><figcaption><strong>Tabelle:</strong> Parameterprofile</figcaption></div>

### Datentypen

{% capture datatypes %}
StructureDefinition/GEM-ERPEU-PR-AccessCode,
{% endcapture %}
{% include artifacts-table-generator.html render=datatypes %}
<div><figcaption><strong>Tabelle:</strong> Datentypen</figcaption></div>

### Ressourcenprofile

{% capture profiles %}
StructureDefinition/GEM-ERPEU-PR-Consent,
StructureDefinition/GEM-ERPEU-PR-Medication,
StructureDefinition/GEM-ERPEU-PR-MedicationDispense,
StructureDefinition/GEM-ERPEU-PR-Practitioner,
StructureDefinition/GEM-ERPEU-PR-PractitionerRole,
StructureDefinition/GEM-ERPEU-PR-Organization
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>


### Erweiterungen (Extension) Definitions

{% include artefacts-structuredef-table-generator.html type="Extension"%}
<div><figcaption><strong>Tabelle:</strong> Extension Definitions</figcaption></div>

### Beispielinstanzen

{% include example-list-generator.html %}