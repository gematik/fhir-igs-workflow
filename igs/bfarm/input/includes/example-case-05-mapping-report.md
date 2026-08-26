
**Anwendungsfall:** Testfall für die Transformation von E-Rezept-Daten in einen digitalen Durchschlag (example-case-05).

**Beispiel-Artefakte:**
- **Digitaler Durchschlag (Ergebnis):** [`Parameters-example-case-05-digitaler-durchschlag.json`](test-examples/Parameters-example-case-05-digitaler-durchschlag.json)


### Medication

#### Source: `Medication/619ad8c5-bc4b-4841-8a13-4162f51c06e7`

**Target:** `rxPrescription.medication:Medication` (`Medication`)  

| Source Field | Source Value | Target Field | Target Value | Status |
|--------------|--------------|--------------|--------------|--------|
| `amount.denominator.value` | 1 | `amount.denominator.value` | 1 | ✅ |
| `amount.numerator.extension[0].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | `amount.numerator.extension[0].url` | https://gematik.de/fhir/epa-medication/Structur... | ✅ |
| `amount.numerator.extension[0].valueString` | 100 | `amount.numerator.extension[0].valueString` | 100 | ✅ |
| `amount.numerator.unit` | ml | `amount.numerator.unit` | ml | ✅ |
| `code.text` | Viskose Aluminiumchlorid-Hexahydrat-Lösung 20 %... | `code.text` | Viskose Aluminiumchlorid-Hexahydrat-Lösung 20 %... | ✅ |
| `extension[3].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | `extension[0].url` | https://gematik.de/fhir/epa-medication/Structur... | ✅ |
| `extension[3].valueString` | M.D.S. | `extension[0].valueString` | M.D.S. | ✅ |
| `extension[4].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | `extension[1].url` | https://gematik.de/fhir/epa-medication/Structur... | ✅ |
| `extension[4].valueString` | Deo-Roller | `extension[1].valueString` | Deo-Roller | ✅ |
| `form.text` | Gel | `form.text` | Gel | ✅ |
| `id` | 619ad8c5-bc4b-4841-8a13-4162f51c06e7 | `id` | 619ad8c5-bc4b-4841-8a13-4162f51c06e7 | ✅ |
| `ingredient[0].itemCodeableConcept.coding[0].code` | 10206346 | `ingredient[0].itemCodeableConcept.coding[0].code` | 10206346 | ✅ |
| `ingredient[0].itemCodeableConcept.coding[0].system` | http://fhir.de/CodeSystem/ifa/pzn | `ingredient[0].itemCodeableConcept.coding[0].system` | http://fhir.de/CodeSystem/ifa/pzn | ✅ |
| `ingredient[1].extension[0].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | `ingredient[1].extension[0].url` | https://gematik.de/fhir/epa-medication/Structur... | ✅ |
| `ingredient[1].extension[0].valueString` | Pulver | `ingredient[1].extension[0].valueString` | Pulver | ✅ |
| `ingredient[1].strength.denominator.value` | 1 | `ingredient[1].strength.denominator.value` | 1 | ✅ |
| `ingredient[1].strength.numerator.unit` | g | `ingredient[1].strength.numerator.unit` | g | ✅ |
| `ingredient[1].strength.numerator.value` | 2 | `ingredient[1].strength.numerator.value` | 2 | ✅ |
| `ingredient[2].itemCodeableConcept.text` | Gereinigtes Wasser | `ingredient[2].itemCodeableConcept.text` | Gereinigtes Wasser | ✅ |
| `ingredient[2].strength.extension[0].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | `ingredient[2].strength.extension[0].url` | https://gematik.de/fhir/epa-medication/Structur... | ✅ |
| `ingredient[2].strength.extension[0].valueString` | Ad 100 g | `ingredient[2].strength.extension[0].valueString` | Ad 100 g | ✅ |
| `code.coding[0].code` | rezeptur | - | - | ⚠️ |
| `code.coding[0].system` | https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medic... | - | - | ⚠️ |
| `extension[0].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | - | - | ⚠️ |
| `extension[0].valueCodeableConcept.coding[0].code` | 1208954007 | - | - | ⚠️ |
| `extension[0].valueCodeableConcept.coding[0].display` | Extemporaneous preparation (product) | - | - | ⚠️ |
| `extension[0].valueCodeableConcept.coding[0].system` | http://snomed.info/sct | - | - | ⚠️ |
| `extension[0].valueCodeableConcept.coding[0].version` | http://snomed.info/sct/11000274103/version/2024... | - | - | ⚠️ |
| `extension[1].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | - | - | ⚠️ |
| `extension[1].valueCoding.code` | 00 | - | - | ⚠️ |
| `extension[1].valueCoding.system` | https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medic... | - | - | ⚠️ |
| `extension[2].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | - | - | ⚠️ |
| `extension[2].valueBoolean` | false | - | - | ⚠️ |

---

#### Source: `Medication/8e2e5e65-4c5d-49f2-8efc-c30e40838273`

**Target:** `rxDispensation.dispenseInformation.medication:Medication` (`Medication`)  

| Source Field | Source Value | Target Field | Target Value | Status |
|--------------|--------------|--------------|--------------|--------|
| `amount.denominator.value` | 1 | `amount.denominator.value` | 1 | ✅ |
| `amount.numerator.extension[0].url` | https://gematik.de/fhir/epa-medication/Structur... | `amount.numerator.extension[0].url` | https://gematik.de/fhir/epa-medication/Structur... | ✅ |
| `amount.numerator.extension[0].valueString` | 21 | `amount.numerator.extension[0].valueString` | 21 | ✅ |
| `amount.numerator.unit` | St | `amount.numerator.unit` | St | ✅ |
| `code.coding[0].code` | 19201712 | `code.coding[0].code` | 19201712 | ✅ |
| `code.coding[0].system` | http://fhir.de/CodeSystem/ifa/pzn | `code.coding[0].system` | http://fhir.de/CodeSystem/ifa/pzn | ✅ |
| `code.text` | Pomalidomid Accord 1 mg 21 x 1 Hartkapseln | `code.text` | Pomalidomid Accord 1 mg 21 x 1 Hartkapseln | ✅ |
| `form.coding[0].code` | TAB | `form.coding[0].code` | TAB | ✅ |
| `form.coding[0].display` | Tabletten | `form.coding[0].display` | Tabletten | ✅ |
| `form.coding[0].system` | https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV... | `form.coding[0].system` | https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV... | ✅ |
| `id` | 8e2e5e65-4c5d-49f2-8efc-c30e40838273 | `id` | 8e2e5e65-4c5d-49f2-8efc-c30e40838273 | ✅ |
| `ingredient[0].itemCodeableConcept.text` | Pomalidomid | `ingredient[0].itemCodeableConcept.text` | Pomalidomid | ✅ |
| `ingredient[0].strength.denominator.unit` | Tbl. | `ingredient[0].strength.denominator.unit` | Tbl. | ✅ |
| `ingredient[0].strength.denominator.value` | 1 | `ingredient[0].strength.denominator.value` | 1 | ✅ |
| `ingredient[0].strength.numerator.unit` | mg | `ingredient[0].strength.numerator.unit` | mg | ✅ |
| `ingredient[0].strength.numerator.value` | 1 | `ingredient[0].strength.numerator.value` | 1 | ✅ |
| `batch.lotNumber` | A123456789-1 | - | - | ⚠️ |

---

### MedicationDispense

#### Source: `MedicationDispense/a7e1d25f-0b0a-40f7-b529-afda48e51b46`

**Target:** `rxDispensation.dispenseInformation.medicationDispense:MedicationDispense` (`MedicationDispense`)  

| Source Field | Source Value | Target Field | Target Value | Status |
|--------------|--------------|--------------|--------------|--------|
| `medicationReference.reference` | urn:uuid:8e2e5e65-4c5d-49f2-8efc-c30e40838273 | `medicationReference.reference` | urn:uuid:8e2e5e65-4c5d-49f2-8efc-c30e40838273 | ✅ |
| `quantity.unit` | Packung | `quantity.unit` | Packung | ✅ |
| `quantity.value` | 1 | `quantity.value` | 1 | ✅ |
| `status` | completed | `status` | completed | ✅ |
| `whenHandedOver` | 2025-10-30 | `whenHandedOver` | 2025-10-30 | ✅ |
| `id` | a7e1d25f-0b0a-40f7-b529-afda48e51b46 | - | - | ⚠️ |
| `identifier[0].system` | https://gematik.de/fhir/erp/NamingSystem/GEM_ER... | - | - | ⚠️ |
| `identifier[0].value` | 166.100.000.000.001.39 | - | - | ⚠️ |
| `performer[0].actor.identifier.system` | https://gematik.de/fhir/sid/telematik-id | - | - | ⚠️ |
| `performer[0].actor.identifier.value` | 3-07.2.1234560000.10.789 | - | - | ⚠️ |
| `subject.identifier.system` | http://fhir.de/sid/gkv/kvid-10 | - | - | ⚠️ |
| `subject.identifier.value` | X234567890 | - | - | ⚠️ |
| `substitution.wasSubstituted` | true | - | - | ⚠️ |

**New fields created by transformation:**

| Target Field | Target Value | Status |
|--------------|--------------|--------|
| `performer[0].actor.reference` | Organization/3-07.2.1234560000.10.789 | 🆕 |

---

### MedicationRequest

#### Source: `MedicationRequest/9711ab74-273d-44b5-be67-3cc80e9e9abd`

**Target:** `rxPrescription.medicationRequest:MedicationRequest` (`MedicationRequest`)  

| Source Field | Source Value | Target Field | Target Value | Status |
|--------------|--------------|--------------|--------------|--------|
| `authoredOn` | 2025-05-20 | `authoredOn` | 2025-05-20 | ✅ |
| `dispenseRequest.quantity.unit` | Packung | `dispenseRequest.quantity.unit` | Packung | ✅ |
| `dispenseRequest.quantity.value` | 1 | `dispenseRequest.quantity.value` | 1 | ✅ |
| `dosageInstruction[0].text` | Jeden 2. Tag vorm Schlafen dünn auf Achselhöhle... | `dosageInstruction[0].text` | Jeden 2. Tag vorm Schlafen dünn auf Achselhöhle... | ✅ |
| `extension[5].url` | http://hl7.org/fhir/5.0/StructureDefinition/ext... | `extension[1].url` | http://hl7.org/fhir/5.0/StructureDefinition/ext... | ✅ |
| `extension[5].valueMarkdown` | Jeden 2. Tag vorm Schlafen dünn auf Achselhöhle... | `extension[1].valueMarkdown` | Jeden 2. Tag vorm Schlafen dünn auf Achselhöhle... | ✅ |
| `extension[6].extension[0].url` | algorithmVersion | `extension[0].extension[0].url` | algorithmVersion | ✅ |
| `extension[6].extension[0].valueString` | 1.0.1 | `extension[0].extension[0].valueString` | 1.0.1 | ✅ |
| `extension[6].extension[1].url` | language | `extension[0].extension[1].url` | language | ✅ |
| `extension[6].extension[1].valueCode` | de-DE | `extension[0].extension[1].valueCode` | de-DE | ✅ |
| `extension[6].url` | http://ig.fhir.de/igs/medication/StructureDefin... | `extension[0].url` | http://ig.fhir.de/igs/medication/StructureDefin... | ✅ |
| `intent` | order | `intent` | order | ✅ |
| `medicationReference.reference` | urn:uuid:619ad8c5-bc4b-4841-8a13-4162f51c06e7 | `medicationReference.reference` | urn:uuid:619ad8c5-bc4b-4841-8a13-4162f51c06e7 | ✅ |
| `status` | active | `status` | completed | ✅ |
| `extension[0].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | - | - | ⚠️ |
| `extension[0].valueCoding.code` | 0 | - | - | ⚠️ |
| `extension[0].valueCoding.system` | https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Statu... | - | - | ⚠️ |
| `extension[1].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | - | - | ⚠️ |
| `extension[1].valueBoolean` | false | - | - | ⚠️ |
| `extension[2].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | - | - | ⚠️ |
| `extension[2].valueBoolean` | false | - | - | ⚠️ |
| `extension[3].extension[0].url` | Kennzeichen | - | - | ⚠️ |
| `extension[3].extension[0].valueBoolean` | false | - | - | ⚠️ |
| `extension[3].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | - | - | ⚠️ |
| `extension[4].url` | https://fhir.kbv.de/StructureDefinition/KBV_EX_... | - | - | ⚠️ |
| `extension[4].valueBoolean` | true | - | - | ⚠️ |
| `id` | 9711ab74-273d-44b5-be67-3cc80e9e9abd | - | - | ⚠️ |
| `insurance[0].reference` | urn:uuid:914e46d1-95a2-44c7-b900-5ca4ee80b8d5 | - | - | ⚠️ |
| `requester.reference` | urn:uuid:ec5b4fcf-9739-4055-b23c-a5b3a65beb66 | - | - | ⚠️ |
| `subject.reference` | urn:uuid:c9e9eeb8-e397-4d62-a977-656a18027f90 | - | - | ⚠️ |
| `substitution.allowedBoolean` | true | - | - | ⚠️ |

**New fields created by transformation:**

| Target Field | Target Value | Status |
|--------------|--------------|--------|
| `subject.identifier._system.extension[0].url` | http://hl7.org/fhir/StructureDefinition/data-ab... | 🆕 |
| `subject.identifier._system.extension[0].valueCode` | not-permitted | 🆕 |
| `subject.identifier._value.extension[0].url` | http://hl7.org/fhir/StructureDefinition/data-ab... | 🆕 |
| `subject.identifier._value.extension[0].valueCode` | not-permitted | 🆕 |

---

### VZDComposite

#### Source: `VZDComposite/VZD-SearchSet-Bundle`

**Target:** `rxDispensation.dispenseOrganization:Organization` (`Organization`)  

| Source Field | Source Value | Target Field | Target Value | Status |
|--------------|--------------|--------------|--------------|--------|
| `address.city` | Großostheim | `address[0].city` | Großostheim | ✅ |
| `address.country` | DE | `address[0].country` | DE | ✅ |
| `address.line[0]` | Schwarzwaldstr. 18 | `address[0].line[0]` | Schwarzwaldstr. 18 | ✅ |
| `address.postalCode` | 63762 | `address[0].postalCode` | 63762 | ✅ |
| `address.state` | Bayern | `address[0].state` | Bayern | ✅ |
| `address.text` | Schwarzwaldstr. 18&#13;&#10;63762&#13;&#10;Groß... | `address[0].text` | Schwarzwaldstr. 18&#13;&#10;63762&#13;&#10;Groß... | ✅ |
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

---
