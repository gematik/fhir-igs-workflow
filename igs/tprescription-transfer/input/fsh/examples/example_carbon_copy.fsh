Instance: TRP-Carbon-Copy
InstanceOf: ERP_TPrescription_CarbonCopy
Usage: #example
Title: "Beispiel digitaler Durchschlag E-T-Rezept"
Description: "Dieses Beispiel wurde manuell angelegt, um den Aufbau eines digitalen Durchschlags abzubilden"
* meta.profile = "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-carbon-copy|1.0"
* parameter[rxPrescription]
  * name = "rxPrescription"
  * part[prescriptionSignatureDate]
    * name = "prescriptionSignatureDate"
    * valueInstant = "2026-04-01T08:23:12Z"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
    * valueIdentifier.value = "166.100.000.000.001.39"
  * part[medicationRequest]
    * name = "medicationRequest"
    * resource = TRP-Carbon-Copy-MedicationRequest
  * part[medication]
    * name = "medication"
    * resource = TRP-Carbon-Copy-Medication
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[dispenseOrganization]
    * name = "dispenseOrganization"
    * resource = TRP-Carbon-Copy-Organization
  * part[dispenseInformation]
    * name = "dispenseInformation"
    * part[medicationDispense]
      * name = "medicationDispense"
      * resource = TRP-Carbon-Copy-MedicationDispense
    * part[medication]
      * name = "medication"
      * resource = TRP-Carbon-Copy-D-Medication

Instance: TRP-Carbon-Copy-Medication
InstanceOf: ERP_TPrescription_Medication
Usage: #inline
* extension.url = "http://fhir.de/StructureDefinition/normgroesse"
* extension.valueCode = #N1
* code.coding.system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding.code = #19201712
* code.text = "Pomalidomid Accord 1 mg 21 x 1 Hartkapseln"
* form.coding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding.code = #HKP
* amount.numerator.extension.url = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension"
* amount.numerator.extension.valueString = "21"
* amount.numerator.unit = "Stück"
* amount.denominator.value = 1
* ingredient.itemCodeableConcept.text = "Pomalidomid"
* ingredient.strength.numerator.value = 1
* ingredient.strength.numerator.unit = "mg"
* ingredient.strength.denominator.value = 1
* ingredient.strength.denominator.unit = "Stück"

Instance: TRP-Carbon-Copy-D-Medication
InstanceOf: ERP_TPrescription_Medication
Usage: #inline
* extension.url = "http://fhir.de/StructureDefinition/normgroesse"
* extension.valueCode = #N1
* code.coding.system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding.code = #19201712
* code.text = "Pomalidomid Accord 1 mg 21 x 1 Hartkapseln"
* form.coding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding.code = #HKP
* amount.numerator.extension.url = "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-total-quantity-formulation-extension"
* amount.numerator.extension.valueString = "21"
* amount.numerator.unit = "Stück"
* amount.denominator.value = 1

Instance: TRP-Carbon-Copy-Organization
InstanceOf: ERP_TPrescription_Organization
Usage: #inline
* id = "8b416995-852f-4933-99bf-c71ad76abae3"
* name = "Stadt Apotheke"
* identifier[TelematikID].value = "Organisation 3-2arvtst-ap000053"
* telecom.system = #phone
* telecom.value = "1234"
* telecom.use = #work
* address.use = #work
* address.type = #postal
* address.line = "Schwarzwaldstr. 18"
* address.city = "Großostheim"
* address.state = "Bayern"
* address.postalCode = "63762"
* address.country = "DE"

Instance: TRP-Carbon-Copy-MedicationRequest
InstanceOf: ERP_TPrescription_MedicationRequest
Usage: #inline
* extension[teratogenic]
  * extension[off-label].valueBoolean = true
  * extension[childbearing-potential].valueBoolean = true
  * extension[security-compliance].valueBoolean = false
  * extension[hand-out-information-material].valueBoolean = false
  * extension[declaration-of-expertise].valueBoolean = true
* status = #completed
* intent = #order
* subject.identifier.system.extension[+].url = $data-absent-reason
* subject.identifier.system.extension[=].valueCode = #not-permitted
* subject.identifier.value.extension[+].url = $data-absent-reason
* subject.identifier.value.extension[=].valueCode = #not-permitted
* medicationReference.reference = "Medication/TRP-Carbon-Copy-Medication"
* authoredOn = "2025-05-20"
* extension[renderedDosageInstruction].valueMarkdown = "1-0-1-0 Stück"
* extension[generatedDosageInstructionsMeta]
  * extension[algorithmVersion].valueString = "1.0.1"
  * extension[language].valueCode = #de-DE
* dosageInstruction[+]
  * timing.repeat
    * when[+] = #MORN
    * frequency = 1
    * period = 1
    * periodUnit = #d
  * doseAndRate.doseQuantity = 1 $kbv-dosiereinheit#1 "Stück"
* dosageInstruction[+]
  * timing.repeat
    * when[+] = #EVE
    * frequency = 1
    * period = 1
    * periodUnit = #d
  * doseAndRate.doseQuantity = 2 $kbv-dosiereinheit#1 "Stück"

* dispenseRequest.quantity.value = 1
* dispenseRequest.quantity.unit = "Packung"
* dispenseRequest.expectedSupplyDuration.value = 3
* dispenseRequest.expectedSupplyDuration.unit = "Woche(n)"

Instance: TRP-Carbon-Copy-MedicationDispense
InstanceOf: MedicationDispense
Usage: #inline
* status = #completed
* medicationReference.reference = "Medication/TRP-Carbon-Copy-D-Medication"
* performer.actor.reference = "Organization/8b416995-852f-4933-99bf-c71ad76abae3"
* whenHandedOver = "2026-04-01"
