Instance: KBVHKPKorrekturVerordnung
InstanceOf: TIFlowManipulateFhirDocument
Usage: #example
Title: "hkp-korrektur-questionnaire"
Description: "Beispiel Questionnaire"

// administrative Informationen
* version = "1.0.0"
* name = "Korrektur des HKP-Verordnungsdatensatzes, Version 1.0.0"
* title = "Angaben zur Anpassung eines HKP-Verordnungsdatensatz"
* status = #active
* date = "2026-07-14"
* publisher = "gematik GmbH"
* description = "Dieser FHIR-Questionnaire dient dazu Korrekturangaben für einen HKP-Verordnungsdatensatz in Version 1.0.0 anzupassen."
* purpose = "Dient der technischen Umsetzung zur Anpassung von HKP-Korrekturdatensätzen im E-Rezept-Fachdienst."
* code = #hkp-verordnungsdatensatz

// Template für eine neue Maßnahme im HKP-Verordnungsdatensatz
* contained[+] = neueMassnahmeTemplate

* extension[launchContext]
  * extension[name].valueCoding = LaunchContext#sourceDocument
  * extension[type].valueCode = #Bundle
  * extension[profile].valueCanonical = "https://fhir.kbv.de/StructureDefinition/KBV_PR_HKP_Bundle|1.0"

// Definition für das Hinzufügen einer Maßnahme in den HKP-Verordnungsdatensatz
* item[ressourceHinzufuegen]
  * linkId = "ressourceHinzufuegen"
  * text = "Neue Maßnahme hinzufügen"
  * type = #group
  * repeats = true
  * extension[templateExtract]
    * extension[template]
      * valueReference = Reference(neueMassnahmeTemplate)
  * extension[extractAllocateId]
    * valueString = "NewMassnahmeId"
  * extension[tiflowAddReferenceInDocument]
    * valueString = "Bundle.entry.ofType('CarePlan').activity.reference"
  * extension[tiflowAddReferenceInDocument]
    * valueString = "Bundle.entry.ofType('Composition').section.where(code = 'massnahmen').entry.reference"
  
  * item[+]
    * linkId = "ressourceHinzufuegen.massnahmecode"
    * type = #choice
    * answerValueSet = "http://fhir.kbv.de/ValueSet/HKP/Massnahmesart"
  * item[+]
    * linkId = "ressourceHinzufuegen.massnahmehaeufigkeit"
    * type = #quantity

// Item für das Ändern einer Maßnahme
* item[ressourceAeandern][0]
  * linkId = "ressourceAeandern.massnahme"
  * text = "Anpassung einer Maßnahme"
  * type = #group
  * repeats = true

  * item[idItem]
    * linkId = "ressourceAeandern.massnahme.id"
    * text = "Referenz der zu ändernden Ressource"
    * type = #reference
    * repeats = false
  
  * item[valueItem]
    * linkId = "ressourceAeandern.massnahme.value"
    * repeats = false
    * type = #choice
    * answerValueSet = "http://fhir.kbv.de/ValueSet/HKP/Massnahmesart"
    * extension[tiFlowTargetPath].valueString = "Bundle.entry.ofType('ServiceRequest').where(id == %ressourceAeandern.massnahme.id).coding.code"

// Item für das Ändern des Startzeitpunktes einer Verordnung
* item[ressourceAeandern][1]
  * linkId = "ressourceAeandern.startdatum"
  * text = "Anpassung des Startzeitpunktes der Verordnung"
  * type = #group
  * repeats = true
  
  * item[valueItem]
    * linkId = "ressourceAeandern.startdatum.value"
    * repeats = false
    * type = #date
    * extension[tiFlowTargetPath].valueString = "Bundle.entry.ofType('CarePlan').first().period.start"

// Item für das Ändern des Endzeitpunktes einer Verordnung
* item[ressourceAeandern][2]
  * linkId = "ressourceAeandern.enddatum"
  * text = "Anpassung des Endzeitpunktes der Verordnung"
  * type = #group
  * repeats = true
  
  * item[valueItem]
    * linkId = "ressourceAeandern.enddatum.value"
    * repeats = false
    * type = #date
    * extension[tiFlowTargetPath].valueString = "Bundle.entry.ofType('CarePlan').first().period.end"

// Item für das Löschen einer Massnahme
* item[ressourceLoeschen]
  * linkId = "ressourceLoeschen"
  * text = "Maßnahme entfernen"
  * type = #reference
  * repeats = true

  * extension[tiflowRemoveReferenceInDocument]
    * valueString = "%sourceDocument.entry.ofType('CarePlan').activity.reference"
  * extension[tiflowRemoveReferenceInDocument]
    * valueString = "%sourceDocument.entry.ofType('Composition').section.where(code = 'massnahmen').entry.reference"



Instance: neueMassnahmeTemplate
InstanceOf: ServiceRequest
Usage: #inline
* status = #draft
* intent = #proposal
* subject.extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
  * valueString = "%sourceDocument.entry.ofType('Patient').first().identifier"
* code.coding.system = "http://fhir.kbv.de/ValueSet/HKP/Massnahmesart"
* code.coding.code.extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
  * valueString = "item.where(linkId = 'ressourceHinzufuegen.massnahmecode').answer.value"
* quantityQuantity.extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
  * valueString = "item.where(linkId = 'ressourceHinzufuegen.massnahmehaeufigkeit').answer.value"