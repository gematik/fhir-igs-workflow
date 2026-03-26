# FHIR-Artefakte - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide für den TI-Flow-Fachdienst definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Medikationsdaten innerhalb des TI-Flow-Fachdienst. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein **Capability Statement** zur Beschreibung der unterstützten Funktionen sowie **Operation Definitions**, die spezielle FHIR-Operationen für den Abruf und die Verwaltung von Medikationsdaten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die FHIR-Data-Service-Funktionalitäten festgelegt.

|
|

**Tabelle:**Value Sets

|
|

### Terminologien: Code Systems

|
|

**Tabelle:**Code Systems

|
|

### Systemverhalten

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TI-Flow-Fachdienst umsetzen muss. Es handelt sich um eine Konformitätsbestätigung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das ePA-Aktensystem für den TI-Flow-Fachdienst unterstützen muss.

| | |
| :--- | :--- |
| [ ERP Rx CapabilityStatement für den E-Rezept-Fachdienst ](CapabilityStatement-erp-fachdienst-server-rx.md) | CapabilityStatement für den E-Rezept-Fachdienst (Arzneimittel-Workflow) |

**Tabelle:**Capability Statements

#### Operation Definitions

|
|

**Tabelle:**Operation Definitions

### Parameterprofile für Operationen

|
|

**Tabelle:**Parameterprofile

### Ressourcenprofile

|
|

**Tabelle:**Ressourcenprofile

### Datentypen

|
|

**Tabelle:**Datentypen

### Erweiterungen (Extension) Definitions

|
|

**Tabelle:**Extension Definitions

### Mapping Definitions (StructureMaps)

| | |
| :--- | :--- |
| [ GEMErpPrMedicationMap ](StructureMap-GEMErpPrMedicationMap.md) | Auto-generated StructureMap for GEM_ERP_PR_Medication|1.6.1 -> EPAMedication|1.3.0 |
| [ GEMErpPrMedicationdispenseMap ](StructureMap-GEMErpPrMedicationdispenseMap.md) | Auto-generated StructureMap for GEM_ERP_PR_MedicationDispense|1.6.1 -> EPAMedicationDispense|1.3.0 |
| [ KBVPrErpBundleMap ](StructureMap-KBVPrErpBundleMap.md) | Auto-generated StructureMap for transformation KBV_PR_ERP_Bundle|1.4.0 -> EPAOpProvidePrescriptionERPInputParameters|1.3.0 |
| [ KBVPrErpMedicationCompoundingMap ](StructureMap-KBVPrErpMedicationCompoundingMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Medication_Compounding|1.4.0 -> EPAMedication|1.3.0 |
| [ KBVPrErpMedicationFreetextMap ](StructureMap-KBVPrErpMedicationFreetextMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Medication_FreeText|1.4.0 -> EPAMedication|1.3.0 |
| [ KBVPrErpMedicationIngredientMap ](StructureMap-KBVPrErpMedicationIngredientMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Medication_Ingredient|1.4.0 -> EPAMedication|1.3.0 |
| [ KBVPrErpMedicationPznMap ](StructureMap-KBVPrErpMedicationPznMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Medication_PZN|1.4.0 -> EPAMedication|1.3.0 |
| [ KBVPrErpPrescriptionMap ](StructureMap-KBVPrErpPrescriptionMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Prescription|1.4.0 -> EPAMedicationRequest|1.3.0 |
| [ KBVPrForOrganizationMap ](StructureMap-KBVPrForOrganizationMap.md) | Auto-generated StructureMap for KBV_PR_FOR_Organization|1.3.0 -> OrganizationDirectory|1.0.0 |
| [ KBVPrForPractitionerMap ](StructureMap-KBVPrForPractitionerMap.md) | Auto-generated StructureMap for KBV_PR_FOR_Practitioner|1.3.0 -> PractitionerDirectory|1.0.0 |

**Tabelle:**StructureMap

### Nutzung von Cross-Version-Extensions

Für die Profile der Ressourcen *MedicationRequest*, *MedicationDispense* und *MedicationStatement* werden die Backport-FHIR-Extensions `.renderedDosageInstruction` und `.effectiveDosePeriod` verwendet. Diese Elemente stammen aus FHIR R5 und wurden über den von der [FHIR-Spezifikation definierten Cross-Version-Mechanismus](https://hl7.org/fhir/versions.html#extensions) nach R4 zurückportiert. Dieser Mechanismus wird u. a. bereits vom [HL7 Java FHIR Validator](https://confluence.hl7.org/spaces/FHIR/pages/35718580/Using+the+FHIR+Validator) unterstützt; andere Validatoren müssen gegebenenfalls das entsprechende Cross-Version-Paket nachladen.

Das offizielle Cross-Version-Paket war zum Releasezeitpunkt dieses Implementation Guides noch nicht final in der FHIR-Registry verfügbar. Die Package-ID lautet: `hl7.fhir.uv.xver-r5.r4`. Bis zur offiziellen Veröffentlichung kann der Inhalt des folgenden Snapshot-Releases verwendet werden: [https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/](https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/)

In diesem Paket sind die benötigten cross-version Extensions enthalten:

* [MedicationDispense.renderedDosageInstruction](https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/StructureDefinition-ext-R5-MedicationDispense.renderedDosageInstruction.html)

### Beispielinstanzen

**Bundle**

* [Communication searchset response for Rx](Bundle-ExampleRxCommunicationSearchset.md)

* [MedicationDispense searchset response for Rx](Bundle-ExampleRxMedicationDispenseSearchset.md)

* [Task searchset response for Rx](Bundle-ExampleRxTaskSearchset.md)

**Communication**

* [Rx Communication request example](Communication-ExampleRxCommunicationDispReq.md)

**MedicationDispense**

* [Rx MedicationDispense example](MedicationDispense-ExampleRxMedicationDispense.md)

**OperationOutcome**

* [Example error response for Rx operations](OperationOutcome-ExampleRxOperationOutcomeError.md)

**Parameters**

* [Example request parameters for Rx operations](Parameters-ExampleRxOperationRequestParameters.md)

**Task**

* [Rx Task in ready state](Task-ExampleRxTaskInReadyState.md)

