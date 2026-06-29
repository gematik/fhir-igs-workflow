# FHIR-Artefakte - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.2

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein **Capability Statement** zur Beschreibung der unterstützten Funktionen sowie **Operation Definitions**, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die TIFlow-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ ValueSet of Consent Codes ](ValueSet-GEM-ERPCHRG-VS-ConsentType.md) | Type of Consents for the ePrescription. |
| [ TIFLOW ChargeItem Operation Outcome Details VS ](ValueSet-tiflow-chargeitem-operation-outcome-details-vs.md) | Abrechnungsinformationen-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können |

**Tabelle:**Value Sets

### Systemverhalten

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

| | |
| :--- | :--- |
| [ ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst ](CapabilityStatement-ti-flow-fachdienst-server-erpchrg.md) | CapabilityStatement für den E-Rezept-Fachdienst (PKV-Abrechnungsinformationen) |

**Tabelle:**Capability Statements

### Beispielinstanzen

**Bundle**

* [Placeholder bundle for KBV prescription item](Bundle-0428d416-149e-48a4-977c-394887b3d85c.md)

* [Placeholder bundle for receipt](Bundle-200.000.000.000.000.01.md)

* [Placeholder bundle for DAV-PKV dispense item](Bundle-72bd741c-7ad8-41d8-97c3-9aabbdd0f5b4.md)

* [ChargeItem searchset response for ERP-CHRG](Bundle-ExampleERPCHRGChargeItemSearchset.md)

* [Communication searchset response for ERP-CHRG](Bundle-ExampleERPCHRGCommunicationSearchset.md)

* [Consent searchset response for ERP-CHRG](Bundle-ExampleERPCHRGConsentSearchset.md)

**ChargeItem**

* [ChargeItem with Bundles completed by Fachdienst](ChargeItem-ChargeItem-GET-Completed.md)

* [ChargeItem with contained Binary to Fachdienst](ChargeItem-ChargeItem-POST-Binary.md)

* [ChargeItem target for Communication basedOn example](ChargeItem-a51520ec-0899-404f-bb97-fe7d461f90a8.md)

**Communication**

* [Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message](Communication-3bbc2209-9c23-4553-986e-a5c9f69a39fb.md)

* [Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode](Communication-b4cf7f71-3ade-40ab-97a9-929f95af29f2.md)

**Consent**

* [Consent to store digital ChargeItem](Consent-0dcc5d4c-bf24-4c06-b02e-be5bc24587e2.md)

* [Consent to store digital ChargeItem](Consent-ChargeItemConsent-Request.md)

**Parameters**

* [Example Parameters Patch Charge Item](Parameters-Example-Parameters-Patch-ChargeItem-1.md)

* [Example Parameters Patch Charge Item](Parameters-Example-Parameters-Patch-ChargeItem-2.md)

