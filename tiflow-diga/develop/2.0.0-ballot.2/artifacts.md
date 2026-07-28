# FHIR-Artefakte - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen des DiGA-Implementation Guides definiert werden.

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

| | |
| :--- | :--- |
| [ ERP DiGA CapabilityStatement für den E-Rezept-Fachdienst ](CapabilityStatement-ti-flow-fachdienst-server-diga.md) | CapabilityStatement für den E-Rezept-Fachdienst (Digitale Gesundheitsanwendungen) |

**Tabelle:**Capability Statements

#### Operation Definitions

| | |
| :--- | :--- |
| [ E-Rezept abbrechen ](OperationDefinition-tiflow-diga-abort-op.md) | Diese Operation bricht den Workflow einer DiGA-Verordnung ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen. |
| [ E-Rezept abrufen ](OperationDefinition-tiflow-diga-accept-op.md) | Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'. |
| [ E-Rezept aktivieren ](OperationDefinition-tiflow-diga-activate-op.md) | Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow. |
| [ E-Rezept Abgabe vollziehen ](OperationDefinition-tiflow-diga-close-op.md) | Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed. |
| [ E-Rezept erstellen ](OperationDefinition-tiflow-diga-create-op.md) | Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes. |
| [ E-Rezept zurückgeben ](OperationDefinition-tiflow-diga-reject-op.md) | Lehnt die Ausgabe einer DiGA-Verordnung ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Kostenträger zugänglich oder kann vom Patienten gelöscht werden. |

**Tabelle:**Operation Definitions

### Ressourcenprofile

| | |
| :--- | :--- |
| [ GEM ERP PR Communication DiGA ](StructureDefinition-GEM-ERP-PR-Communication-DiGA.md) | Antwort des Leistungserbringers an den Patienten |
| [ GEM ERP PR MedicationDispense DiGA ](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md) | Dispensierung einer DiGA-Verordnung |

**Tabelle:**Ressourcenprofile

### Logische Modelle

| | |
| :--- | :--- |
| [ Logical DiGA Medication Dispense ](StructureDefinition-GEM-ERP-LOG-MedicationDispense-DiGA.md) | Fachliches Modell zur Beschreibung der Informationen, die bei $close in der MedicationDispense-Ressource für DiGAs übermittelt werden. |

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

* [Beispiel für Abort-Operation Fehlerantwort (AVS)](OperationOutcome-ExampleOperationAbortErrorAVS.md)

* [Beispiel für Abort-Operation Fehlerantwort (PVS)](OperationOutcome-ExampleOperationAbortErrorPVS.md)

* [Beispiel für Accept-Operation Fehlerantwort](OperationOutcome-ExampleOperationAcceptError.md)

* [Example Activate operation error response](OperationOutcome-ExampleOperationActivateError.md)

* [Beispiel für Close-Operation Fehlerantwort](OperationOutcome-ExampleOperationCloseError.md)

* [Beispiel für Create-Operation Fehlerantwort](OperationOutcome-ExampleOperationCreateError.md)

* [Beispiel für Reject-Operation Fehlerantwort](OperationOutcome-ExampleOperationRejectError.md)

**Parameters**

* [Example Close Parameters](Parameters-ExampleCloseInputParametersDiGA.md)

* [Example request parameters for DiGA operations](Parameters-ExampleDiGAOperationRequestParameters.md)

* [Example Activate operation input parameters](Parameters-ExampleOperationActivateParametersInput.md)

* [Beispiel für $create Operation Parameter](Parameters-OperationCreateParametersInputExample.md)

**Task**

* [DiGA Task in ready state](Task-ExampleDiGATaskInReadyState.md)

