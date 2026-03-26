# FHIR-Artefakte - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen des DiGA-Implementation Guides definiert werden.

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

| | |
| :--- | :--- |
| [ ERP DiGA CapabilityStatement für den E-Rezept-Fachdienst ](CapabilityStatement-erp-fachdienst-server-diga.md) | CapabilityStatement für den E-Rezept-Fachdienst (Digitale Gesundheitsanwendungen) |

**Tabelle:**Capability Statements

### Ressourcenprofile

| | |
| :--- | :--- |
| [ GEM ERP PR Communication DiGA ](StructureDefinition-GEM-ERP-PR-Communication-DiGA.md) | Antwort des Leistungserbringers an den Patienten |
| [ GEM ERP PR MedicationDispense DiGA ](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md) | Dispensierung einer DiGA-Verordnung |

**Tabelle:**Ressourcenprofile

### Logische Modelle

| | |
| :--- | :--- |
| [ Logical DiGA Medication Dispense ](StructureDefinition-GEM-ERP-LOG-MedicationDispense-DiGA.md) | Fachliches Modell zur Beschreibung der Informationen, die bei $close und $dispense in der MedicationDispense-Ressource für DiGAs übermittelt werden. |

**Tabelle:**Logische Modelle

### Erweiterungen (Extension) Definitions

| | |
| :--- | :--- |
| [ GEM ERP EX DeepLink ](StructureDefinition-GEM-ERP-EX-DeepLink.md) | Enthält Informationen zum Deep Link für eine DiGA. |
| [ GEM ERP EX RedeemCode ](StructureDefinition-GEM-ERP-EX-RedeemCode.md) | Gibt den Einlösecode für eine DiGA an. |

**Tabelle:**Extension Definitions

### Mapping Definitions (StructureMaps)

|
|

**Tabelle:**StructureMaps

### Beispielinstanzen

**Bundle**

* [Communication searchset response for DiGA](Bundle-ExampleDiGACommunicationSearchset.md)

* [MedicationDispense searchset response for DiGA](Bundle-ExampleDiGAMedicationDispenseSearchset.md)

* [Task searchset response for DiGA](Bundle-ExampleDiGATaskSearchset.md)

**Communication**

* [DiGA-Nachricht eines Kostenträgers an den Patienten](Communication-140f716f-f649-44fe-9a4e-157eb3c8adf3.md)

**MedicationDispense**

* [Medication Dispense DiGA with a deep link.](MedicationDispense-Example-MedicationDispense-DiGA-DeepLink.md)

* [Medication Dispense DiGA, Name and PZN](MedicationDispense-Example-MedicationDispense-DiGA-Name-And-PZN.md)

* [Medication Dispense DiGA without a redeem code](MedicationDispense-Example-MedicationDispense-DiGA-NoRedeemCode.md)

**OperationOutcome**

* [Example error response for DiGA operations](OperationOutcome-ExampleDiGAOperationOutcomeError.md)

**Parameters**

* [Example Close Parameters](Parameters-ExampleCloseInputParametersDiGA.md)

* [Example request parameters for DiGA operations](Parameters-ExampleDiGAOperationRequestParameters.md)

**Task**

* [DiGA Task in ready state](Task-ExampleDiGATaskInReadyState.md)

