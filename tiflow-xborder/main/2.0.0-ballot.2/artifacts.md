# FHIR-Artefakte - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein **Capability Statement** zur Beschreibung der unterstützten Funktionen sowie **Operation Definitions**, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die TIFlow-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ ValueSet of Consent PolyRule Codes ](ValueSet-GEM-ERPEU-VS-Consent-PolicyRule.md) | Type of Policy Rules for Consents of the ePrescription. |
| [ ValueSet of Consent Codes ](ValueSet-GEM-ERPEU-VS-ConsentType.md) | Type of Consents for the ePrescription. |
| [ ValueSet of NCPeH Request Types ](ValueSet-GEM-ERPEU-VS-RequestType.md) | Type of Request from NCPeH |
| [ TIFLOW XBORDER Operation Outcome Details VS ](ValueSet-tiflow-xborder-operation-outcome-details-vs.md) | Fehlercodes für cross-border Szenarien, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können |

**Tabelle:**Value Sets

### Terminologien: Code Systems

|
|

**Tabelle:**Code Systems

### Logical Models

| | |
| :--- | :--- |
| [ Dispense Data from EU ](StructureDefinition-logical-eu-dispense-data.md) | Logical Information that is Provided in the dispensation document by the NCPeH of country B for Dispensing Medication |

**Tabelle:**Logical Models

### Systemverhalten

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

| | |
| :--- | :--- |
| [ ERPEU CapabilityStatement fuer den E-Rezept-Fachdienst ](CapabilityStatement-ti-flow-fachdienst-server-erpeu.md) | CapabilityStatement fuer den E-Rezept-Fachdienst (EU-Zugriff) |

**Tabelle:**Capability Statements

#### Operation Definitions

| | |
| :--- | :--- |
| [ EUCloseOperation ](OperationDefinition-EUCloseOperation.md) | The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed |
| [ GETPrescriptionEU ](OperationDefinition-GETPrescriptionEU.md) | The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries |
| [ GrantEUAccessPermission ](OperationDefinition-GrantEUAccessPermission.md) | This operation receives the access code and the country that the patient wants to grant access to. The operation validates the country and creates registeres the Access Code. |
| [ ReadEUAccessPermission ](OperationDefinition-ReadEUAccessPermission.md) | This operation reads the currenty in the E-Rezept-Fachdienst registered Access Code for redeeming ePrescriptions in an EU country. |
| [ RevokeEUAccessPermission ](OperationDefinition-RevokeEUAccessPermission.md) | This operation revokes the currently registered access code for redeeming prescriptions in an EU country. |

**Tabelle:**Operation Definitions

### Parameterprofile für Operationen

| | |
| :--- | :--- |
| [ GEM ERPEU PR PAR Access Authorization Request ](StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Request.md) | Displays Parameters for EU Access Authorization |
| [ GEM ERPEU PR PAR Access Authorization Response ](StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Response.md) | Displays Response Parameters for EU Access Authorization |
| [ GEM ERP PR EU CloseOperation Input ](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.md) | This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU |
| [ GEM ERPEU PR PAR GET Prescription Input ](StructureDefinition-GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input.md) | This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU |
| [ GEM ERPEU PR PAR PATCH Task Input ](StructureDefinition-GEM-ERPEU-PR-PAR-PATCH-Task-Input.md) | This profile defines the parameters for patching the Task to mark the prescription as to-be-redeemed in the EU |
| [ GEM ERPEU PR PAR GET Prescription Output ](StructureDefinition-gem-erpeu-pr-par-get-prescription-output.md) | This profile defines the output parameters for the Get Prescription Operation |

**Tabelle:**Parameterprofile

### Datentypen

| | |
| :--- | :--- |
| [ Identifier Profile for EU AccessCode ](StructureDefinition-GEM-ERPEU-PR-AccessCode.md) | The AccessCode that is generated by the FdV in order to access the ePrescription in an EU country. |

**Tabelle:**Datentypen

### Ressourcenprofile

| | |
| :--- | :--- |
| [ Consent for ePrescriptions ](StructureDefinition-GEM-ERPEU-PR-Consent.md) | Records the consent of the patient for an operation in the context of ePrescription. |
| [ EU-Medication ](StructureDefinition-GEM-ERPEU-PR-Medication.md) | Medication of a Prescription or Dispensation from the EU |
| [ Dispensation of the Prescription from the EU ](StructureDefinition-GEM-ERPEU-PR-MedicationDispense.md) | Handles information about the redeem of the prescription and the submited medication from the EU. |
| [ Organization Information Received from the EU ](StructureDefinition-GEM-ERPEU-PR-Organization.md) | This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU |
| [ Practitioner Information Received from the EU ](StructureDefinition-GEM-ERPEU-PR-Practitioner.md) | This Practitioner Profile is sent by the NCPeH when redeeming a Prescription in the EU |
| [ PractitionerRole Information Received from the EU ](StructureDefinition-GEM-ERPEU-PR-PractitionerRole.md) | This PractitionerRole Profile is sent by the NCPeH when redeeming a Prescription in the EU |

**Tabelle:**Ressourcenprofile

### Erweiterungen (Extension) Definitions

| | |
| :--- | :--- |
| [ GEM_ERPEU_EX_MedicinalPackageDescription ](StructureDefinition-GEM-ERPEU-EX-MedicinalPackageDescription.md) | Description of a packaged medicinal product. |
| [ GEM_ERPEU_EX_MedicinalPackageIdentifier ](StructureDefinition-GEM-ERPEU-EX-MedicinalPackageIdentifier.md) | Identifier of a packaged medicinal product refers to a specific pack size of a specific product. |

**Tabelle:**Extension Definitions

### Beispielinstanzen

**Bundle**

* [Example for a Bundle with a Consent](Bundle-ExampleGetConsent.md)

**Consent**

* [Example for a Consent to redeem EU Prescritptions](Consent-f97a0772-c99f-4159-90c6-2a41c7d96779.md)

**Medication**

* [Medication Without code or system for Strength](Medication-Medication-Without-Strength-Code.md)

* [Medication Without code or system for Strength](Medication-Medication-Without-Strength-Numerator.md)

* [Sample Simple Medication](Medication-SimpleMedication.md)

* [Sample Medication Sumatripan](Medication-SumatripanMedication.md)

**MedicationDispense**

* [Example Medication Dispense](MedicationDispense-Example-MedicationDispense-EU.md)

**OperationOutcome**

* [Example error response for ERP-EU operations](OperationOutcome-ExampleERPEUOperationOutcomeError.md)

**Organization**

* [Example-EU-Organization](Organization-Example-EU-Organization.md)

**Parameters**

* [GEM_ERPEU_PR_PAR_Access_Authorization_Request](Parameters-Example-EU-PermissionRequest.md)

* [GEM_ERPEU_PR_PAR_Access_Authorization_Response](Parameters-Example-EU-PermissionResponse.md)

* [Example_PATCH_Task_Single_Input](Parameters-Example-PATCH-Task-Single-Input-Request-False.md)

* [Example_PATCH_Task_Single_Input](Parameters-Example-PATCH-Task-Single-Input-Request-True.md)

* [Example EU-Close Parameters](Parameters-ExampleEUCloseInputParameters.md)

* [Example EU-GET Prescription Parameters](Parameters-ExampleEUGETPrescriptionDEMOGRAPHICS.md)

* [Example EU-GET Prescription Parameters](Parameters-ExampleEUGETPrescriptionE-PRESCRIPTIONS-LIST.md)

* [Example EU-GET Prescription Parameters](Parameters-ExampleEUGETPrescriptionE-PRESCRIPTIONS-RETRIEVAL.md)

**Practitioner**

* [Example-EU-Practitioner](Practitioner-Example-EU-Practitioner.md)

**PractitionerRole**

* [Example-EU-PractitionerRole](PractitionerRole-Example-EU-PractitionerRole.md)

