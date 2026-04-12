# Beispiel 3: Freitext Verordnung - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* [**Beispiele**](tests.md)
* **Beispiel 3: Freitext Verordnung**

## Beispiel 3: Freitext Verordnung

## Beispiel 3: Freitext Verordnung

Dieses Beispiel demonstriert das Mapping einer E-T-Rezept Freitext-Verordnung mit allen Quellressourcen in den digitalen Durchschlag.

-------

# StructureMap Transformation Report

## Summary

**Anwendungsfall:** Verschreibung und Abgabe eines Freitext-Medikaments und Transformation in einen digitalen Durchschlag.

**Beispiel-Artefakte:**

* **Quell-Dateien:** 
* [`example-case-03-KBV_Bundle.xml`](test-examples/example-case-03-KBV_Bundle.xml)
* [`example-case-03-Task.xml`](test-examples/example-case-03-Task.xml)
* [`example-case-03-MedicationDispense_Parameters.xml`](test-examples/example-case-03-MedicationDispense_Parameters.xml)
* [`example-case-03-VZDSearchSet.xml`](test-examples/example-case-03-VZDSearchSet.xml)
 
* **Mapping Bundle (generiert):** [`example-case-03-mapping-bundle.json`](test-examples/example-case-03-mapping-bundle.json)
* **Digitaler Durchschlag (Ergebnis):** [`example-case-03-digitaler-durchschlag.json`](test-examples/example-case-03-digitaler-durchschlag.json)

## Resource Mapping Details

### Medication

#### Source: Medication/a3ca01a4-92c1-422a-87d9-ef046e94527f

**Target:** `rxPrescription.medication:Medication` (`Medication`)

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| `code.text` | Thalidomid 50 mg Hartkapseln 28 Stück | `code.text` | Thalidomid 50 mg Hartkapseln 28 Stück | ✅ |
| `id` | a3ca01a4-92c1-422a-87d9-ef046e94527f | `id` | a3ca01a4-92c1-422a-87d9-ef046e94527f | ✅ |
| `code.coding[0].code` | freitext | - | - | ⚠️ |
| `code.coding[0].system` | https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medic… | - | - | ⚠️ |
| `extension[0].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_… | - | - | ⚠️ |
| `extension[0].valueCoding.code` | 02 | - | - | ⚠️ |
| `extension[0].valueCoding.system` | https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medic… | - | - | ⚠️ |
| `extension[1].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_… | - | - | ⚠️ |
| `extension[1].valueBoolean` | false | - | - | ⚠️ |

-------

#### Source: Medication/8e2e5e65-4c5d-49f2-8efc-c30e40838273

**Target:** `rxDispensation.dispenseInformation.medication:Medication` (`Medication`)

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| `amount.denominator.value` | 1 | `amount.denominator.value` | 1 | ✅ |
| `amount.numerator.extension[0].url` | https://gematik.de/fhir/epa-medication/Structur… | `amount.numerator.extension[0].url` | https://gematik.de/fhir/epa-medication/Structur… | ✅ |
| `amount.numerator.extension[0].valueString` | 28 | `amount.numerator.extension[0].valueString` | 28 | ✅ |
| `amount.numerator.unit` | St | `amount.numerator.unit` | St | ✅ |
| `code.coding[0].code` | 16880629 | `code.coding[0].code` | 16880629 | ✅ |
| `code.coding[0].system` | http://fhir.de/CodeSystem/ifa/pzn | `code.coding[0].system` | http://fhir.de/CodeSystem/ifa/pzn | ✅ |
| `code.text` | THALIDOMID BMS 50 mg Hartkapseln | `code.text` | THALIDOMID BMS 50 mg Hartkapseln | ✅ |
| `form.coding[0].code` | TAB | `form.coding[0].code` | TAB | ✅ |
| `form.coding[0].display` | Tabletten | `form.coding[0].display` | Tabletten | ✅ |
| `form.coding[0].system` | https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV… | `form.coding[0].system` | https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV… | ✅ |
| `id` | 8e2e5e65-4c5d-49f2-8efc-c30e40838273 | `id` | 8e2e5e65-4c5d-49f2-8efc-c30e40838273 | ✅ |
| `ingredient[0].itemCodeableConcept.text` | Thalidomid | `ingredient[0].itemCodeableConcept.text` | Thalidomid | ✅ |
| `ingredient[0].strength.denominator.unit` | Tbl. | `ingredient[0].strength.denominator.unit` | Tbl. | ✅ |
| `ingredient[0].strength.denominator.value` | 1 | `ingredient[0].strength.denominator.value` | 1 | ✅ |
| `ingredient[0].strength.numerator.unit` | mg | `ingredient[0].strength.numerator.unit` | mg | ✅ |
| `ingredient[0].strength.numerator.value` | 50 | `ingredient[0].strength.numerator.value` | 50 | ✅ |
| `batch.lotNumber` | A123456789-1 | - | - | ⚠️ |

-------

### MedicationDispense

#### Source: MedicationDispense/a7e1d25f-0b0a-40f7-b529-afda48e51b46

**Target:** `rxDispensation.dispenseInformation.medicationDispense:MedicationDispense` (`MedicationDispense`)

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| `medicationReference.reference` | urn:uuid:8e2e5e65-4c5d-49f2-8efc-c30e40838273 | `medicationReference.reference` | urn:uuid:8e2e5e65-4c5d-49f2-8efc-c30e40838273 | ✅ |
| `quantity.unit` | Packung | `quantity.unit` | Packung | ✅ |
| `quantity.value` | 1 | `quantity.value` | 1 | ✅ |
| `status` | completed | `status` | completed | ✅ |
| `whenHandedOver` | 2025-10-30 | `whenHandedOver` | 2025-10-30 | ✅ |
| `id` | a7e1d25f-0b0a-40f7-b529-afda48e51b46 | - | - | ⚠️ |
| `identifier[0].system` | https://gematik.de/fhir/erp/NamingSystem/GEM_ER… | - | - | ⚠️ |
| `identifier[0].value` | 166.100.000.000.001.39 | - | - | ⚠️ |
| `performer[0].actor.identifier.system` | https://gematik.de/fhir/sid/telematik-id | - | - | ⚠️ |
| `performer[0].actor.identifier.value` | 3-07.2.1234560000.10.789 | - | - | ⚠️ |
| `subject.identifier.system` | http://fhir.de/sid/gkv/kvid-10 | - | - | ⚠️ |
| `subject.identifier.value` | X234567890 | - | - | ⚠️ |
| `substitution.wasSubstituted` | true | - | - | ⚠️ |

**New fields created by transformation:**

| | | |
| :--- | :--- | :--- |
| `performer[0].actor.reference` | Organization/3-07.2.1234560000.10.789 | 🆕 |

-------

### MedicationRequest

#### Source: MedicationRequest/7d871b93-e18c-4865-bad0-6b55196be46b

**Target:** `rxPrescription.medicationRequest:MedicationRequest` (`MedicationRequest`)

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| `authoredOn` | 2025-05-20 | `authoredOn` | 2025-05-20 | ✅ |
| `dispenseRequest.expectedSupplyDuration.unit` | Woche(n) | `dispenseRequest.expectedSupplyDuration.unit` | Woche(n) | ✅ |
| `dispenseRequest.expectedSupplyDuration.value` | 9 | `dispenseRequest.expectedSupplyDuration.value` | 9 | ✅ |
| `dispenseRequest.quantity.unit` | Packung | `dispenseRequest.quantity.unit` | Packung | ✅ |
| `dispenseRequest.quantity.value` | 1 | `dispenseRequest.quantity.value` | 1 | ✅ |
| `extension[4].extension[0].url` | Off-Label | `extension[0].extension[0].url` | off-label | ✅ |
| `extension[4].extension[0].valueBoolean` | false | `extension[0].extension[0].valueBoolean` | false | ✅ |
| `extension[4].extension[1].url` | GebaerfaehigeFrau | `extension[0].extension[1].url` | childbearing-potential | ✅ |
| `extension[4].extension[1].valueBoolean` | false | `extension[0].extension[1].valueBoolean` | false | ✅ |
| `extension[4].extension[2].url` | EinhaltungSicherheitsmassnahmen | `extension[0].extension[2].url` | security-compliance | ✅ |
| `extension[4].extension[2].valueBoolean` | true | `extension[0].extension[2].valueBoolean` | true | ✅ |
| `extension[4].extension[3].url` | AushaendigungInformationsmaterialien | `extension[0].extension[3].url` | hand-out-information-material | ✅ |
| `extension[4].extension[3].valueBoolean` | true | `extension[0].extension[3].valueBoolean` | true | ✅ |
| `extension[4].extension[4].url` | ErklaerungSachkenntnis | `extension[0].extension[4].url` | declaration-of-expertise | ✅ |
| `extension[4].extension[4].valueBoolean` | true | `extension[0].extension[4].valueBoolean` | true | ✅ |
| `extension[4].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_… | `extension[0].url` | https://gematik.de/fhir/epa-medication/Structur… | ✅ |
| `intent` | order | `intent` | order | ✅ |
| `medicationReference.reference` | urn:uuid:a3ca01a4-92c1-422a-87d9-ef046e94527f | `medicationReference.reference` | urn:uuid:a3ca01a4-92c1-422a-87d9-ef046e94527f | ✅ |
| `status` | active | `status` | completed | ✅ |
| `extension[0].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_… | - | - | ⚠️ |
| `extension[0].valueCoding.code` | 0 | - | - | ⚠️ |
| `extension[0].valueCoding.system` | https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Statu… | - | - | ⚠️ |
| `extension[1].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_… | - | - | ⚠️ |
| `extension[1].valueBoolean` | false | - | - | ⚠️ |
| `extension[2].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_… | - | - | ⚠️ |
| `extension[2].valueBoolean` | false | - | - | ⚠️ |
| `extension[3].extension[0].url` | Kennzeichen | - | - | ⚠️ |
| `extension[3].extension[0].valueBoolean` | false | - | - | ⚠️ |
| `extension[3].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_… | - | - | ⚠️ |
| `extension[5].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_… | - | - | ⚠️ |
| `extension[5].valueBoolean` | false | - | - | ⚠️ |
| `id` | 7d871b93-e18c-4865-bad0-6b55196be46b | - | - | ⚠️ |
| `insurance[0].reference` | urn:uuid:e51239e1-ba74-48e0-97fb-9754d2b05c60 | - | - | ⚠️ |
| `requester.reference` | urn:uuid:0c4e1a54-8a42-4d3d-a12c-0bbf2db48570 | - | - | ⚠️ |
| `subject.reference` | urn:uuid:30635f5d-c233-4500-94e8-6414940236aa | - | - | ⚠️ |
| `substitution.allowedBoolean` | true | - | - | ⚠️ |

**New fields created by transformation:**

| | | |
| :--- | :--- | :--- |
| `subject.identifier._system.extension[0].url` | http://hl7.org/fhir/StructureDefinition/data-ab… | 🆕 |
| `subject.identifier._system.extension[0].valueCode` | not-permitted | 🆕 |
| `subject.identifier._value.extension[0].url` | http://hl7.org/fhir/StructureDefinition/data-ab… | 🆕 |
| `subject.identifier._value.extension[0].valueCode` | not-permitted | 🆕 |

-------

### VZDComposite

#### Source: VZDComposite/VZD-SearchSet-Bundle

**Target:** `rxDispensation.dispenseOrganization:Organization` (`Organization`)

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| `address.city` | Großostheim | `address[0].city` | Großostheim | ✅ |
| `address.country` | DE | `address[0].country` | DE | ✅ |
| `address.line[0]` | Schwarzwaldstr. 18 | `address[0].line[0]` | Schwarzwaldstr. 18 | ✅ |
| `address.postalCode` | 63762 | `address[0].postalCode` | 63762 | ✅ |
| `address.state` | Bayern | `address[0].state` | Bayern | ✅ |
| `address.text` | Schwarzwaldstr. 18 63762 Groß… | `address[0].text` | Schwarzwaldstr. 18 63762 Groß… | ✅ |
| `address.type` | postal | `address[0].type` | postal | ✅ |
| `address.use` | work | `address[0].use` | work | ✅ |
| `id` | VZD-SearchSet-Bundle | `id` | 3-07.2.1234560000.10.789 | ✅ |
| `identifier[1].system` | https://gematik.de/fhir/sid/telematik-id | `identifier[0].system` | https://gematik.de/fhir/sid/telematik-id | ✅ |
| `identifier[1].value` | 3-07.2.1234560000.10.789 | `identifier[0].value` | 3-07.2.1234560000.10.789 | ✅ |
| `name` | Schwarzwald Apotheke | `name` | Schwarzwald Apotheke | ✅ |
| `telecom[0].system` | phone | `telecom[0].system` | phone | ✅ |
| `telecom[0].use` | work | `telecom[0].use` | work | ✅ |
| `telecom[0].value` | 1234 | `telecom[0].value` | 1234 | ✅ |
| `identifier[1].type.coding[0].code` | PRN | - | - | ⚠️ |
| `identifier[1].type.coding[0].system` | http://terminology.hl7.org/CodeSystem/v2-0203 | - | - | ⚠️ |
| `sourceResources[2]` | Location | - | - | ⚠️ |

-------

-------

[Zurück zur Test-Übersicht](tests.md)

