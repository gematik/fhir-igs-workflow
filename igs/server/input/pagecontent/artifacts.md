Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide für den E-Rezept-Fachdienst definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Medikationsdaten innerhalb des E-Rezept-Fachdienst. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein _Capability Statement_ zur Beschreibung der unterstützten Funktionen sowie _Operation Definitions_, die spezielle FHIR-Operationen für den Abruf und die Verwaltung von Medikationsdaten festlegen.

### Systemverhalten

#### Capability Statements

Das _Capability_ _Statement_ beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des E-Rezept-Fachdienst umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das ePA-Aktensystem für den E-Rezept-Fachdienst unterstützen muss.

{% include artifacts-table-generator.html resourceType="CapabilityStatement" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements</figcaption></div>