# FHIR-Artefakte - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

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

### Parameters

|
|

**Tabelle:**Parameters

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

* [$accept response for DiGA](Bundle-ExampleDiGAAcceptResponse.md)

* [DiGA-Verordnungs-Bundle (unvollständig)](Bundle-ExampleDiGABundle.md)

* [Communication searchset response for DiGA](Bundle-ExampleDiGACommunicationSearchset.md)

* [MedicationDispense searchset response for DiGA](Bundle-ExampleDiGAMedicationDispenseSearchset.md)

* [Task searchset response for DiGA](Bundle-ExampleDiGATaskSearchset.md)

* [Quittungs-Bundle für abgeschlossene Rezeptabgabe](Bundle-ExampleOperationCloseOutput.md)

**Communication**

* [DiGA-Nachricht eines Kostenträgers an den Patienten](Communication-Communication-Reply-DiGA-payload.md)

* [DiGA-Nachricht eines Kostenträgers an den Patienten](Communication-Communication-Reply-DiGA.md)

**Device**

* [Gerät für Quittungs-Bundle](Device-ReceiptBundleDevice.md)

**MedicationDispense**

* [Medication Dispense DiGA with a deep link.](MedicationDispense-Example-MedicationDispense-DiGA-DeepLink.md)

* [Medication Dispense DiGA, Name and PZN](MedicationDispense-Example-MedicationDispense-DiGA-Name-And-PZN.md)

* [Medication Dispense DiGA without a redeem code](MedicationDispense-Example-MedicationDispense-DiGA-NoRedeemCode.md)

**OperationOutcome**

* [Error 403 - Beispiel für Create-Operation Fehlerantwort](OperationOutcome-ExampleCreateOperationOutputError.md)

* [Beispiel für Abort-Operation Fehlerantwort (403)](OperationOutcome-ExampleOperationAbortErrorAVS.md)

* [Beispiel für Abort-Operation Fehlerantwort (412)](OperationOutcome-ExampleOperationAbortErrorPVS.md)

* [Fehler 403 - Beispiel für Abort-Operation Fehlerantwort bei Rollenprüfung](OperationOutcome-ExampleOperationAbortErrorRoleFdV.md)

* [Error 409 - Beispiel für Accept-Operation Fehlerantwort](OperationOutcome-ExampleOperationAcceptError.md)

* [Error 403 - Beispiel für Accept-Operation durch Rollenprüfung](OperationOutcome-ExampleOperationAcceptRoleError.md)

* [Error 400 - Example Activate operation error response](OperationOutcome-ExampleOperationActivateError.md)

* [Error 400 - QES nicht valide; Example Activate operation error response](OperationOutcome-ExampleOperationActivateInvalidRoleError.md)

* [Error 400 - Beispiel für Close-Operation Fehlerantwort](OperationOutcome-ExampleOperationCloseError.md)

* [Error 400 - Beispiel für Close-Operation Fehlerantwort bei Profilprüfung MedicationDispense](OperationOutcome-ExampleOperationCloseProfileError.md)

* [Error 400 - Beispiel für Create-Operation Fehlerantwort](OperationOutcome-ExampleOperationCreateError.md)

* [Fehler 412 - Beispiel für Reject-Operation Fehlerantwort](OperationOutcome-ExampleOperationRejectError.md)

* [Fehler 403 - Beispiel für Reject-Operation Fehlerantwort bei Rollenprüfung](OperationOutcome-ExampleOperationRejectRolleError.md)

**Parameters**

* [Example Close Parameters](Parameters-ExampleCloseInputParametersDiGA.md)

* [Example Close Parameters](Parameters-ExampleCloseOutputParametersDiGA.md)

* [Example request parameters for DiGA operations](Parameters-ExampleDiGAOperationRequestParameters.md)

* [Example Activate operation input parameters](Parameters-ExampleOperationActivateParametersInput.md)

* [Beispiel für $create Operation Parameter](Parameters-OperationCreateParametersInputExample.md)

**Task**

* [DiGA Task in ready state](Task-ExampleDiGATaskInReadyState.md)

* [DiGA Task in draft state](Task-erp-diga-01-task-162-create.md)

