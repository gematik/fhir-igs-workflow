# Beispiel für eine Transformation einer Freitextverordnung - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Technische Aspekte zur Arzneimittelverordnung**](menu-technisch.md)
* [**Vorgaben zum Mapping von FHIR-Instanzen**](menu-technische-umsetzung-mapping.md)
* **Beispiel für eine Transformation einer Freitextverordnung**

## Beispiel für eine Transformation einer Freitextverordnung

## Bundle → Parameters Mapping

> Quelle: [KBV Bundle](Bundle-input-example-3.md) Ziel: [EPA Provide Parameters](Parameters-output-example-3.md)

### Verordnungskennung

| | | | |
| :--- | :--- | :--- | :--- |
| `Bundle.identifier.value` | `Parameters.prescriptionId.valueString` | `160.100.000.000.023.70` | ✅ Übernommen |
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
| `MedicationRequest.medicationReference.reference` | `MedicationRequest.medicationReference.reference` | `Medication/0d93504e-c6a7-47c1-8ad5-b0c5cf1b8920` | ✅ Übernommen |
| `MedicationRequest.requester.reference` | `MedicationRequest.requester.reference` | `Practitioner/667ffd79-42a3-4002-b7ca-6b9098f20ccb` | ✅ Übernommen |
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
| `MedicationRequest.extension[4].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag` | ⚠️ Offen |
| `MedicationRequest.extension[4].valueBoolean` | — | `false` | ⚠️ Offen |
| `MedicationRequest.id` | — | `2979e8a3-352e-4d17-8e06-b356666e4daf` | ⚠️ Offen |
| `MedicationRequest.insurance[0].reference` | — | `Coverage/69b3bbb6-2d37-4676-baf1-af97ba2ba4ad` | ⚠️ Offen |
| `MedicationRequest.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription\|1.4` | ⚠️ Offen |
| `MedicationRequest.meta.versionId` | — | `1` | ⚠️ Offen |
| `MedicationRequest.subject.reference` | — | `Patient/fc0d145b-09b4-4af6-b477-935c1862ac7f` | ⚠️ Offen |

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
| `Organization.address[0].city` | `Organization.address[0].city` | `Berlin` | ✅ Übernommen |
| `Organization.address[0].city` | `Organization.address[1].city` | `Berlin` | ✅ Übernommen |
| `Organization.address[0].country` | `Organization.address[0].country` | `D` | ✅ Übernommen |
| `Organization.address[0].country` | `Organization.address[1].country` | `D` | ✅ Übernommen |
| `Organization.address[0].line[0]` | `Organization.address[0].line[0]` | `Herbert-Lewin-Platz 2` | ✅ Übernommen |
| `Organization.address[0].line[0]` | `Organization.address[1].line[0]` | `Herbert-Lewin-Platz 2` | ✅ Übernommen |
| `Organization.address[0].postalCode` | `Organization.address[0].postalCode` | `10623` | ✅ Übernommen |
| `Organization.address[0].postalCode` | `Organization.address[1].postalCode` | `10623` | ✅ Übernommen |
| `Organization.address[0].type` | `Organization.address[0].type` | `both` | ✅ Übernommen |
| `Organization.address[0].type` | `Organization.address[1].type` | `both` | ✅ Übernommen |
| `Organization.resourceType` | `Organization.resourceType` | `Organization` | ✅ Übernommen |
| `Organization.telecom[0].system` | `Organization.telecom[0].system` | `phone` | ✅ Übernommen |
| `Organization.telecom[0].value` | `Organization.telecom[0].value` | `0301234567` | ✅ Übernommen |
| `Organization.telecom[1].system` | `Organization.telecom[1].system` | `fax` | ✅ Übernommen |
| `Organization.telecom[1].value` | `Organization.telecom[1].value` | `030123456789` | ✅ Übernommen |
| `Organization.telecom[2].system` | `Organization.telecom[2].system` | `email` | ✅ Übernommen |
| `Organization.telecom[2].value` | `Organization.telecom[2].value` | `mvz@e-mail.de` | ✅ Übernommen |
| — | `Organization.meta.profile[0]` | `https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory` | 🆕 Nur Ziel |
| `Organization.id` | — | `5d3f4ac0-2b44-4d48-b363-e63efa72973b` | ⚠️ Offen |
| `Organization.identifier[0].system` | — | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR` | ⚠️ Offen |
| `Organization.identifier[0].type.coding[0].code` | — | `BSNR` | ⚠️ Offen |
| `Organization.identifier[0].type.coding[0].system` | — | `http://terminology.hl7.org/CodeSystem/v2-0203` | ⚠️ Offen |
| `Organization.identifier[0].value` | — | `721111100` | ⚠️ Offen |
| `Organization.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization\|1.3` | ⚠️ Offen |
| `Organization.meta.versionId` | — | `1` | ⚠️ Offen |
| `Organization.name` | — | `MVZ` | ⚠️ Offen |

### KBV Practitioner → EPA Practitioner

| | | | |
| :--- | :--- | :--- | :--- |
| `Practitioner.name[0]._family.extension[0].url` | `Practitioner.name[0]._family.extension[0].url` | `http://hl7.org/fhir/StructureDefinition/humanname-own-name` | ✅ Übernommen |
| `Practitioner.name[0]._family.extension[0].valueString` | `Practitioner.name[0]._family.extension[0].valueString` | `Schneider` | ✅ Übernommen |
| `Practitioner.name[0]._prefix[0].extension[0].url` | `Practitioner.name[0]._prefix[0].extension[0].url` | `http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier` | ✅ Übernommen |
| `Practitioner.name[0]._prefix[0].extension[0].valueCode` | `Practitioner.name[0]._prefix[0].extension[0].valueCode` | `AC` | ✅ Übernommen |
| `Practitioner.name[0].family` | `Practitioner.name[0].family` | `Schneider` | ✅ Übernommen |
| `Practitioner.name[0].given[0]` | `Practitioner.name[0].given[0]` | `Emma` | ✅ Übernommen |
| `Practitioner.name[0].prefix[0]` | `Practitioner.name[0].prefix[0]` | `Dr. med.` | ✅ Übernommen |
| `Practitioner.name[0].use` | `Practitioner.name[0].use` | `official` | ✅ Übernommen |
| `Practitioner.resourceType` | `Practitioner.resourceType` | `Practitioner` | ✅ Übernommen |
| — | `Practitioner.meta.profile[0]` | `https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory` | 🆕 Nur Ziel |
| `Practitioner.id` | — | `667ffd79-42a3-4002-b7ca-6b9098f20ccb` | ⚠️ Offen |
| `Practitioner.identifier[0].system` | — | `https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].code` | — | `LANR` | ⚠️ Offen |
| `Practitioner.identifier[0].type.coding[0].system` | — | `http://terminology.hl7.org/CodeSystem/v2-0203` | ⚠️ Offen |
| `Practitioner.identifier[0].value` | — | `987654423` | ⚠️ Offen |
| `Practitioner.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner\|1.3` | ⚠️ Offen |
| `Practitioner.meta.versionId` | — | `1` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].code` | — | `00` | ⚠️ Offen |
| `Practitioner.qualification[0].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].code` | — | `Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.coding[0].system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung` | ⚠️ Offen |
| `Practitioner.qualification[1].code.text` | — | `Fachärztin für Innere Medizin` | ⚠️ Offen |

### KBV Medication → EPA Medication

| | | | |
| :--- | :--- | :--- | :--- |
| `Medication.code.coding[0].code` | `Medication.code.coding[0].code` | `freitext` | ✅ Übernommen |
| `Medication.code.coding[0].system` | `Medication.code.coding[0].system` | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type` | ✅ Übernommen |
| `Medication.code.text` | `Medication.code.text` | `Metformin 850mg Tabletten N3` | ✅ Übernommen |
| `Medication.extension[0].valueCoding.code` | `Medication.extension[0].valueCoding.code` | `00` | ✅ Übernommen |
| `Medication.extension[1].valueBoolean` | `Medication.extension[1].valueBoolean` | `false` | ✅ Übernommen |
| `Medication.resourceType` | `Medication.resourceType` | `Medication` | ✅ Übernommen |
| — | `Medication.extension[0].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` | 🆕 Nur Ziel |
| — | `Medication.extension[1].url` | `https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` | 🆕 Nur Ziel |
| — | `Medication.meta.profile[0]` | `https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication` | 🆕 Nur Ziel |
| `Medication.extension[0].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[0].valueCoding.system` | — | `https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category` | ⚠️ Offen |
| `Medication.extension[1].url` | — | `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine` | ⚠️ Offen |
| `Medication.id` | — | `0d93504e-c6a7-47c1-8ad5-b0c5cf1b8920` | ⚠️ Offen |
| `Medication.meta.profile[0]` | — | `https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText\|1.4` | ⚠️ Offen |
| `Medication.meta.versionId` | — | `1` | ⚠️ Offen |

