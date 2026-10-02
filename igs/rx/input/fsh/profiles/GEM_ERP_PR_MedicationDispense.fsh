Profile: GEM_ERP_PR_MedicationDispense
Parent: TIMedicationDispenseDgMP
Id: GEM-ERP-PR-MedicationDispense
Title: "GEM ERP PR MedicationDispense"
Description: "Dispensierung eines E-Rezepts"
* insert LegacyMetaProfile(GEM_ERP_PR_MedicationDispense)

* obeys tiflow-dosageExtensionBeiDosierung
* obeys tiflow-ExtRequiresDosage-MD

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only EPrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "E-Rezept-ID"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference(GEM_ERP_PR_Medication)
* medication[x] MS
* medication[x] ^definition = "Die MedicationDispense verweist auf ein Medikament, das abgegeben wurde."

* performer 1..1
* performer.actor.identifier 1..
* performer.actor.identifier only IdentifierTelematikId
* whenPrepared ^mustSupport = false
* whenPrepared obeys tiflow-abgabeDatumsFormat
* whenHandedOver 1..
* whenHandedOver obeys tiflow-abgabeDatumsFormat

* note
  * ^short = "Abgabehinweise"

* substitution MS
  * wasSubstituted 1..1 MS
  * type 0..0
  * reason 0..0
  * responsibleParty 0..0


// Not applicable fields
* partOf 0..0
* statusReason[x] 0..0
* context 0..0
* supportingInformation 0..0
* location 0..0
* type 0..0
* quantity 0..0
* daysSupply 0..0
* destination 0..0
* detectedIssue 0..0
* eventHistory 0..0


Invariant: tiflow-abgabeDatumsFormat
Description: "Wert muss ein Datum in der Form: YYYY-MM-DD sein."
* severity = #error
* expression = "toString().length()=10"

Invariant: tiflow-dosageExtensionBeiDosierung
Description: "Wenn eine Dosierung angegeben wurde, muss der generierte Dosierungstext, sowie die Metainformationen zur Generierung angegeben werden."
Expression: "dosageInstruction.exists() implies extension.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction').exists() and extension.where(url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta').exists()"
Severity: #error

Invariant: tiflow-ExtRequiresDosage-MD
Description: "Wenn eine Dosierungserweiterung (GeneratedDosageInstructionsMeta oder renderedDosageInstruction) vorhanden ist, muss mindestens eine Dosierungsanweisung vorhanden sein."
Expression: "( extension.where( url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta' or url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction' ).exists() ) implies dosageInstruction.exists()"
Severity: #error
