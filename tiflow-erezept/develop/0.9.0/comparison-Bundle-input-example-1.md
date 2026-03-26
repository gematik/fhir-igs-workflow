# Beispiel für eine Transformation einer PZN - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* [**Vorgaben zum Mapping von FHIR-Instanzen**](menu-technische-umsetzung-mapping.md)
* **Beispiel für eine Transformation einer PZN**

## Beispiel für eine Transformation einer PZN

## Bundle → Parameters Mapping

> Quelle: [KBV Bundle](Bundle-input-example-1.md) Ziel: [EPA Provide Parameters](Parameters-output-example-1.md)

### Verordnungskennung

| | | | |
| :--- | :--- | :--- | :--- |
| `Bundle.identifier.value` | `Parameters.prescriptionId.valueString` | `160.100.000.000.037.28` | ✅ Übernommen |
| — | `Parameters.prescriptionId.name` | `prescriptionId` | 🆕 Nur Ziel |
| `Bundle.identifier.system` | — | `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId` | ⚠️ Offen |

### Ausstellungsdatum

| | | | |
| :--- | :--- | :--- | :--- |
| `MedicationRequest.authoredOn` | `Parameters.authoredOn.valueDateTime` | `2024-05-20` | ✅ Übernommen |
| — | `Parameters.authoredOn.name` | `authoredOn` | 🆕 Nur Ziel |

### KBV MedicationRequest → EPA MedicationRequest

| | | | |
| :--- | :--- | :--- | :--- |
| `MedicationRequest.authoredOn` | `MedicationRequest.authoredOn` | `2024-05-20` | ✅ Übernommen |
| `MedicationRequest.dispenseRequest.quantity.unit` | `MedicationRequest.dispenseRequest.quantity.unit` | `Packung` | ✅ Übernommen |
| `MedicationRequest.dispenseRequest.quantity.value` | `MedicationRequest.dispenseRequest.quantity.value` | `1` | ✅ Übernommen |
| `MedicationRequest.extension[1].valueBoolean` | `MedicationRequest.extension[0].valueBoolean` | `false` | ✅ Übernommen |
| `MedicationRequest.extension[1].valueBoolean` | `MedicationRequest.extension[1].extension[0].valueBoolean` | `false` | ✅ Übernommen |
| `MedicationRequest.intent` | `MedicationRequest.intent` | `order` | ✅ Übernommen |
| `MedicationRequest.medicationReference.reference` | `MedicationRequest.medicationReference.reference` | `Medication/5ff1bd22-ce14-484e-be56-d2ba4adeac31` | ✅ Übernommen |
| `MedicationRequest.requester.reference` | `MedicationRequest.requester.reference` | `Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c` | ✅ Übernommen |
| `MedicationRequest.resourceType` | `MedicationRequest.resourceType` | `MedicationRequest` | ✅ Übernommen |
| `MedicationRequest.status` | `MedicationRequest.status` | `active` | ✅ Übernommen |
| `MedicationRequest.substitution.allowedBoolean` | `MedicationRequest.substitution.allowedBoolean` | `true` | ✅ Übernommen |
| — | `MedicationRequest.extension[0].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/indicator-ser-extension` | 🆕 Nur Ziel |
| — | `MedicationRequest.extension[1].extension[0].url` | `indicator` | 🆕 Nur Ziel |
| — | `MedicationRequest.extension[1].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/multiple-prescription-extension` | 🆕 Nur Ziel |
| — | `MedicationRequest.meta.profile[0]` | `https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request` | 🆕 Nur Ziel |
| `MedicationRequest.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment` | ⚠️ Offen |
| `MedicationRequest.extension[0].valueCoding.code` | — | `0` | ⚠️ Offen |
| `MedicationRequest.extension[0].valueCoding.system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_StatusCoPayment` | ⚠️ Offen |
| `MedicationRequest.extension[1].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee` | ⚠️ Offen |
| `MedicationRequest.extension[2].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER` | ⚠️ Offen |
| `MedicationRequest.extension[2].valueBoolean` | — | `false` | ⚠️ Offen |
| `MedicationRequest.extension[3].extension[0].url` | — | `Kennzeichen` | ⚠️ Offen |
| `MedicationRequest.extension[3].extension[0].valueBoolean` | — | `false` | ⚠️ Offen |
| `MedicationRequest.extension[3].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription` | ⚠️ Offen |
| `MedicationRequest.id` | — | `43c2b7ae-ad11-4387-910a-e6b7a3c38d4f` | ⚠️ Offen |
| `MedicationRequest.insurance[0].reference` | — | `Coverage/1b89236c-ab14-4e92-937e-5af0b59d0cd4` | ⚠️ Offen |
| `MedicationRequest.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription\|1.3` | ⚠️ Offen |
| `MedicationRequest.subject.reference` | — | `Patient/93866fdc-3e50-4902-a7e9-891b54737b5e` | ⚠️ Offen |

### KBV Organization → EPA Organization

| | | | |
| :--- | :--- | :--- | :--- |
| `Organization.address[0]._line[0].extension[0].url` | `Organization.address[0]._line[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[0].url` | `Organization.address[1]._line[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[0].valueString` | `Organization.address[0]._line[0].extension[0].valueString` | `2` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[0].valueString` | `Organization.address[1]._line[0].extension[0].valueString` | `2` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[1].url` | `Organization.address[0]._line[0].extension[1].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[1].url` | `Organization.address[1]._line[0].extension[1].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[1].valueString` | `Organization.address[0]._line[0].extension[1].valueString` | `Herbert-Lewin-Platz` | ✅ Übernommen |
| `Organization.address[0]._line[0].extension[1].valueString` | `Organization.address[1]._line[0].extension[1].valueString` | `Herbert-Lewin-Platz` | ✅ Übernommen |
| `Organization.address[0]._line[1].extension[0].url` | `Organization.address[0]._line[1].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator` | ✅ Übernommen |
| `Organization.address[0]._line[1].extension[0].url` | `Organization.address[1]._line[1].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator` | ✅ Übernommen |
| `Organization.address[0]._line[1].extension[0].valueString` | `Organization.address[0]._line[1].extension[0].valueString` | `Erdgeschoss` | ✅ Übernommen |
| `Organization.address[0]._line[1].extension[0].valueString` | `Organization.address[1]._line[1].extension[0].valueString` | `Erdgeschoss` | ✅ Übernommen |
| `Organization.address[0].city` | `Organization.address[0].city` | `Berlin` | ✅ Übernommen |
| `Organization.address[0].city` | `Organization.address[1].city` | `Berlin` | ✅ Übernommen |
| `Organization.address[0].country` | `Organization.address[0].country` | `D` | ✅ Übernommen |
| `Organization.address[0].country` | `Organization.address[1].country` | `D` | ✅ Übernommen |
| `Organization.address[0].line[0]` | `Organization.address[0].line[0]` | `Herbert-Lewin-Platz 2` | ✅ Übernommen |
| `Organization.address[0].line[0]` | `Organization.address[1].line[0]` | `Herbert-Lewin-Platz 2` | ✅ Übernommen |
| `Organization.address[0].line[1]` | `Organization.address[0].line[1]` | `Erdgeschoss` | ✅ Übernommen |
| `Organization.address[0].line[1]` | `Organization.address[1].line[1]` | `Erdgeschoss` | ✅ Übernommen |
| `Organization.address[0].postalCode` | `Organization.address[0].postalCode` | `10623` | ✅ Übernommen |
| `Organization.address[0].postalCode` | `Organization.address[1].postalCode` | `10623` | ✅ Übernommen |
| `Organization.address[0].type` | `Organization.address[0].type` | `both` | ✅ Übernommen |
| `Organization.address[0].type` | `Organization.address[1].type` | `both` | ✅ Übernommen |
| `Organization.resourceType` | `Organization.resourceType` | `Organization` | ✅ Übernommen |
| `Organization.telecom[0].system` | `Organization.telecom[0].system` | `phone` | ✅ Übernommen |
| `Organization.telecom[0].value` | `Organization.telecom[0].value` | `030321654987` | ✅ Übernommen |
| `Organization.telecom[1].system` | `Organization.telecom[1].system` | `email` | ✅ Übernommen |
| `Organization.telecom[1].value` | `Organization.telecom[1].value` | `hausarztpraxis@e-mail.de` | ✅ Übernommen |
| — | `Organization.meta.profile[0]` | `https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory` | 🆕 Nur Ziel |
| `Organization.id` | — | `2a555cd3-0543-483c-88b3-f68647620962` | ⚠️ Offen |
| `Organization.identifier[0].system` | — | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` | ⚠️ Offen |
| `Organization.identifier[0].type.coding[0].code` | — | `BSNR` | ⚠️ Offen |
| `Organization.identifier[0].type.coding[0].system` | — | `http://terminology.hl7.org/CodeSystem/v2-0203` | ⚠️ Offen |
| `Organization.identifier[0].value` | — | `724444400` | ⚠️ Offen |
| `Organization.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization\|1.2` | ⚠️ Offen |
| `Organization.name` | — | `Hausarztpraxis` | ⚠️ Offen |

### KBV Practitioner → EPA Practitioner

| | | | |
| :--- | :--- | :--- | :--- |
| `Practitioner.name[0]._family.extension[0].url` | `Practitioner.name[0]._family.extension[0].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` | ✅ Übernommen |
| `Practitioner.name[0]._family.extension[0].valueString` | `Practitioner.name[0]._family.extension[0].valueString` | `Schulz` | ✅ Übernommen |
| `Practitioner.name[0].family` | `Practitioner.name[0].family` | `Schulz` | ✅ Übernommen |
| `Practitioner.name[0].given[0]` | `Practitioner.name[0].given[0]` | `Ben` | ✅ Übernommen |
| `Practitioner.name[0].use` | `Practitioner.name[0].use` | `official` | ✅ Übernommen |
| `Practitioner.resourceType` | `Practitioner.resourceType` | `Practitioner` | ✅ Übernommen |
| — | `Practitioner.meta.profile[0]` | `https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory` | 🆕 Nur Ziel |
| `Practitioner.id` | — | `d6f3b55d-3095-4655-96dc-da3bec21271c` | ⚠️ Offen |
| `Practitioner.identifier[0].system` | — | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].code` | — | `LANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].system` | — | `http://terminology.hl7.org/CodeSystem/v2-0203` | ⚠️ Offen |
| `Practitioner.identifier[0].value` | — | `754236701` | ⚠️ Offen |
| `Practitioner.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner\|1.2` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].code` | — | `00` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].code` | — | `Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.text` | — | `Facharzt für Allgemeinmedizin` | ⚠️ Offen |

### KBV Medication → EPA Medication

| | | | |
| :--- | :--- | :--- | :--- |
| `Medication.code.coding[0].code` | `Medication.code.coding[0].code` | `07765007` | ✅ Übernommen |
| `Medication.code.coding[0].system` | `Medication.code.coding[0].system` | `http://fhir.de/CodeSystem/ifa/pzn` | ✅ Übernommen |
| `Medication.code.text` | `Medication.code.text` | `NEUPRO 8MG/24H PFT 7 ST` | ✅ Übernommen |
| `Medication.extension[1].valueCoding.code` | `Medication.extension[0].valueCoding.code` | `00` | ✅ Übernommen |
| `Medication.extension[2].valueBoolean` | `Medication.extension[1].valueBoolean` | `false` | ✅ Übernommen |
| `Medication.form.coding[0].code` | `Medication.form.coding[0].code` | `PFT` | ✅ Übernommen |
| `Medication.form.coding[0].system` | `Medication.form.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM` | ✅ Übernommen |
| `Medication.resourceType` | `Medication.resourceType` | `Medication` | ✅ Übernommen |
| — | `Medication.extension[0].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` | 🆕 Nur Ziel |
| — | `Medication.extension[1].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` | 🆕 Nur Ziel |
| — | `Medication.meta.profile[0]` | `https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication` | 🆕 Nur Ziel |
| `Medication.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type` | ⚠️ Offen |
| `Medication.extension[0].valueCodeableConcept.coding[0].code` | — | `763158003` | ⚠️ Offen |
| `Medication.extension[0].valueCodeableConcept.coding[0].display` | — | `Medicinal product (product)` | ⚠️ Offen |
| `Medication.extension[0].valueCodeableConcept.coding[0].system` | — | `http://snomed.info/sct` | ⚠️ Offen |
| `Medication.extension[0].valueCodeableConcept.coding[0].version` | — | `http://snomed.info/sct/11000274103/version/20240515` | ⚠️ Offen |
| `Medication.extension[1].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[1].valueCoding.system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[2].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine` | ⚠️ Offen |
| `Medication.extension[3].url` | — | `http://fhir.de/StructureDefinition/normgroesse` | ⚠️ Offen |
| `Medication.extension[3].valueCode` | — | `N1` | ⚠️ Offen |
| `Medication.id` | — | `5ff1bd22-ce14-484e-be56-d2ba4adeac31` | ⚠️ Offen |
| `Medication.ingredient[0].itemCodeableConcept.text` | — | `Rotigotin` | ⚠️ Offen |
| `Medication.ingredient[0].strength.denominator.unit` | — | `Stück` | ⚠️ Offen |
| `Medication.ingredient[0].strength.denominator.value` | — | `1` | ⚠️ Offen |
| `Medication.ingredient[0].strength.numerator.unit` | — | `mg/24 h` | ⚠️ Offen |
| `Medication.ingredient[0].strength.numerator.value` | — | `8` | ⚠️ Offen |
| `Medication.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN\|1.3` | ⚠️ Offen |

