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

// Definition für das Hinzufügen einer Maßnahme in den HKP-Verordnungsdatensatz
* item[ressourceHinzufuegen]
  * linkId = "ressourceHinzufuegen"
  * text = "Neue Maßnahme hinzufügen"
  * type = #group
  * repeats = true
  * extension[templateExtractExtension]
    * extension[template]
      * valueReference = Reference(neueMassnahmeTemplate)
    * extension[fullUrl]
      * valueString = "%NewMassnahmeId"
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
* item[ressourceAeandern]
  * linkId = "ressourceAeandern"
  * text = "Anpassung einer Maßnahme"
  * type = #group
  * repeats = true

  * item[id]
    * linkId = "ressourceAeandern.id"
    * text = "Referenz der zu ändernden Ressource"
    * type = #reference
    * repeats = false
  
  * item[value]
    * linkId = "ressourceAeandern.value"
    * repeats = false
    * answerValueSet = "http://fhir.kbv.de/ValueSet/HKP/Massnahmesart"
    * extension[tiFlowExtractFromDocument].valueString = "Bundle.entry.ofType('ServiceRequest').where(id == %ressourceAeandern.id).coding.code"

// Item für das Ändern des Startzeitpunktes einer Verordnung
* item[ressourceAeandern]
  * linkId = "ressourceAeandern"
  * text = "Anpassung des Startzeitpunktes der Verordnung"
  * type = #group
  * repeats = true
  
  * item[value]
    * linkId = "ressourceAeandern.value"
    * repeats = false
    * type = #date
    * extension[tiFlowExtractFromDocument].valueString = "Bundle.entry.ofType('CarePlan').first().period.start"

// Item für das Ändern des Endzeitpunktes einer Verordnung
* item[ressourceAeandern]
  * linkId = "ressourceAeandern"
  * text = "Anpassung des Endzeitpunktes der Verordnung"
  * type = #group
  * repeats = true
  
  * item[value]
    * linkId = "ressourceAeandern.value"
    * repeats = false
    * type = #date
    * extension[tiFlowExtractFromDocument].valueString = "Bundle.entry.ofType('CarePlan').first().period.end"

// Item für das Löschen einer Massnahme
* item[ressourceLoeschen]
  * linkId = "ressourceLoeschen"
  * text = "Maßnahme entfernen"
  * type = #reference
  * repeats = true

  * extension[tiflowRemoveReferenceInDocument]
    * valueString = "Bundle.entry.ofType('CarePlan').activity.reference"
  * extension[tiflowRemoveReferenceInDocument]
    * valueString = "Bundle.entry.ofType('Composition').section.where(code = 'massnahmen').entry.reference"



Instance: neueMassnahmeTemplate
InstanceOf: ServiceRequest
Usage: #inline
* status = #draft
* intent = #proposal
* subject.extension[+]
  * url = "https://gematik.de/fhir/tiflow/hkp/StructureDefinition/tiflow-extract-from-document"
  * valueString = "Bundle.entry.ofType(Patient).first().identifier"
* code.coding.system = "http://fhir.kbv.de/ValueSet/HKP/Massnahmesart"
* code.coding.code.extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
  * valueString = "item.where(linkId = 'ressourceHinzufuegen.massnahmecode').answer.value"
* quantityQuantity.extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
  * valueString = "item.where(linkId = 'ressourceHinzufuegen.massnahmehaeufigkeit').answer.value"