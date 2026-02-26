Instance: ERPTPrescriptionStructureMapMedicationDispense
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for MedicationDispense"
Description: "Mapping-Anweisungen zur Transformation von gematik ERP MedicationDispense zu BfArM T-Prescription MedicationDispense"
* insert Instance(StructureMap, ERPTPrescriptionStructureMapMedicationDispense)

// * insert sd_structure(https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense, source, gematikMedicationDispense)
* insert sd_structure(http://hl7.org/fhir/StructureDefinition/MedicationDispense, source, gematikMedicationDispense)
* insert sd_structure(https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication-dispense, target, bfarmMedicationDispense)

* group[+]
  * name = "ERPTPrescriptionStructureMapMedicationDispense"
  * typeMode = #none
  * documentation = "Mapping-Anweisungen zur Transformation von gematik ERP MedicationDispense zu BfArM T-Prescription MedicationDispense"

  * insert sd_input(gematikMedicationDispense, source)
  * insert sd_input(bfarmMedicationDispense, target)

// Rules for MedicationDispense

// Copy Dosage Extensions
  * rule[+]
    * name = "medicationDispenseExt"
    * documentation = "Kopiert Dosage Metadata Extension"
    * insert treeSource(gematikMedicationDispense, extension, extDosageMetaVar)
    * source[=].condition = "url='http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta'"
    * insert targetSetIdVariable(bfarmMedicationDispense, extension, extDosageMetaVar)
  * rule[+]
    * name = "medicationDispenseExt"
    * documentation = "Kopiert RenderedDosageText"
    * insert treeSource(gematikMedicationDispense, extension, extDosageRenderedVar)
    * source[=].condition = "url='http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction'"
    * insert targetSetIdVariable(bfarmMedicationDispense, extension, extDosageRenderedVar)

// dosageInstruction
  * rule[+]
    * name = "medicationDispenseDosageInstruction"
    * source[+]
      * context = "gematikMedicationDispense"
      * element = "dosageInstruction"
      * variable = "dosageInstructionVar"
    * insert targetSetIdVariable(bfarmMedicationDispense, dosageInstruction, dosageInstructionVar)
    * documentation = "Übernimmt die Dosierungsanweisungen aus der ursprünglichen Abgabe für den digitalen Durchschlag"

  * rule[+]
    * name = "medicationDispenseWhenHandedOver"
    * source[+]
      * context = "gematikMedicationDispense"
      * element = "whenHandedOver"
      * variable = "whenHandedOverVar"
    * insert targetSetIdVariable(bfarmMedicationDispense, whenHandedOver, whenHandedOverVar)
    * documentation = "Kopiert das Abgabedatum zur Dokumentation des Zeitpunkts der Medikamentenausgabe"
  
// reference to Medication
  * rule[+]
    * name = "medicationReference"
    * insert treeSource(gematikMedicationDispense, medication, medicationVar)
    * insert targetSetIdVariable(bfarmMedicationDispense, medication, medicationVar)
    * documentation = "Kopiert die Medikamentenreferenz - das referenzierte Medication wird separat gemappt"

// set status to completed
  * rule[+]
    * name = "medicationDispenseStatus"
    * insert treeSource(gematikMedicationDispense, status, gematikMedicationDispenseStatus)
    // * source[=].logMessage = "$this"
    * insert targetSetStringVariable(bfarmMedicationDispense, status, completed)
    * documentation = "Setzt den Status auf 'completed' da die Abgabe bereits erfolgt ist (digitaler Durchschlag)"
  
// quantity
  * rule[+]
    * name = "medicationDispenseQuantity"
    * insert treeSource(gematikMedicationDispense, quantity, quantityVar)
    * insert targetSetIdVariable(bfarmMedicationDispense, quantity, quantityVar)
    * documentation = "Übernimmt die abgegebene Menge zur Dokumentation der tatsächlich ausgehändigten Medikamentenmenge"
  
// Sets Organization/<telematik-id> as reference
  * rule[+]
    * name = "medicationDispensePerformer"
    * documentation = "Transformiert Apotheken-Identifier zu Organization-Referenz für eindeutige Zuordnung der abgebenden Apotheke"
    * insert treeSource(gematikMedicationDispense, performer, srcPerformerVar)
    * insert treeTarget(bfarmMedicationDispense, performer, tgtPerformerVar)
    * rule[+]
      * name = "medicationDispensePerformerActor"
      * documentation = "Verarbeitet den Actor (abgebende Apotheke) des Performers"
      * insert treeSource(srcPerformerVar, actor, srcPerformerActorVar)
      * insert treeTarget(tgtPerformerVar, actor, tgtPerformerActorVar)
      * rule[+]
        * name = "medicationDispensePerformerActorIdentifier"
        * documentation = "Extrahiert den Identifier der abgebenden Apotheke"
        * insert treeSource(srcPerformerActorVar, identifier, srcPerformerActorIdentifierVar)
        * rule[+]
          * name = "medicationDispensePerformerActorIdentifierValue"
          * documentation = "Wandelt Apotheken-Identifier in Organization-Referenz um (Organization/<telematik-id>)"
          * insert treeSource(srcPerformerActorIdentifierVar, value, srcPerformerActorIdentifierValueVar)
          * target[+]
            * context = "tgtPerformerActorVar"
            * contextType = #variable
            * element = "reference"
            * transform = #append
            * parameter[+].valueString = "Organization/"
            * parameter[+].valueId = "srcPerformerActorIdentifierValueVar"
