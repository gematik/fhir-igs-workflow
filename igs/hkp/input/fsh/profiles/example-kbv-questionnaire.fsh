Instance: hkp-korrektur-questionnaire
InstanceOf: TIFlowHkpCorrectionQuestionnaire
Usage: #example
Title: "hkp-korrektur-questionnaire"
Description: "Beispiel Questionnaire"
* status = #active
* contained[+] = neueLeistungTemplate
* item[leistungHinzufuegen]
  * linkId = "leistungHinzufuegen"
  * text = "Neue Leistung Hinzufügen"
  * type = #group
  * repeats = true
  * code = http://fhir.gematik.de/sid/hkp-korrektur-codes#leistungHinzufuegen
  * extension[+]
    * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    * extension[+]
      * url = "template"
      * valueReference = Reference(neueLeistungTemplate)
    * extension[+]
      * url = "fullUrl"
      * valueString = "%NewLeistungId"
  * item[+]
    * linkId = "leistungHinzufuegen.leistungsArt"
    * type = #choice
    * repeats = false
    * answerValueSet = "http://fhir.kbv.de/ValueSet/HKP/Leistungsart"

* item[leistungAeandern]
  * linkId = "leistungAeandern"
  * repeats = true
  * type = #group
  * item[+]
    * linkId = "leistungAendern.id"
    * type = #reference
  * item[+]
    * linkId = "leistungAendern.leistungsArt"
    * type = #choice
    * answerValueSet = "http://fhir.kbv.de/ValueSet/HKP/Leistungsart"
    * extension[tiFlowExtractFromDocument].valueString = "Bundle.entry.where(id == %leistungAendern.id).coding.code"

* item[leistungLoeschen]
  * linkId = "leistungLoeschen"
  * repeats = true
  * type = #group
  * item[+]
    * linkId = "leistungAendern.id"
    * type = #reference

Instance: neueLeistungTemplate
InstanceOf: ServiceRequest
Usage: #inline
* status = #draft
* intent = #proposal
* subject.extension[+]
  * url = "https://gematik.de/fhir/tiflow/hkp/StructureDefinition/tiflow-extract-from-document"
  * valueString = "Bundle.entry.ofType(Patient).first().identifier"
* code.coding.system = "http://fhir.kbv.de/ValueSet/HKP/Leistungsart"
* code.coding.code.extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
  * valueString = "item.where(linkId = 'leistungHinzufuegen.leistungsArt').answer.value"