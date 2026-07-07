Extension: TIFlowExtractFromDocument
Id: tiflow-extract-from-document
Title: "TI Flow Extract From Document"
Description: "Defines FHIRPath from Document"
* value[x] only string
* valueString 1..1 MS

Profile: TIFlowHkpCorrectionQuestionnaire
Parent: Questionnaire
Id: tiflow-hkp-correction-questionnaire
Title: "tiflow-hkp-correction-questionnaire"
Description: "HKP Korrektur Questionnaire"

* item
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "linkId"
  * ^slicing.rules = #open
  * ^slicing.description = "Anpassungskategorie"
  * ^slicing.ordered = false

* item contains leistungHinzufuegen 0..* MS and
leistungAeandern 0..* MS and
leistungLoeschen 0..* MS

* item[leistungHinzufuegen]
  * linkId = "leistungHinzufuegen"
  
  // Template Extension for new Leistung
  * extension MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.description = "Erweiterungen für das hinzufügen einer neuen Leistung"
    * ^slicing.rules = #open
    * ^slicing.ordered = false
  * extension contains TemplateExtractExtension named templateExtractExtension 1..1 MS

  * item 1..*
    * linkId 1..1
      * extension MS
        * ^slicing.discriminator.type = #value
        * ^slicing.discriminator.path = "url"
        * ^slicing.description = "Erweiterungen für das Hinzufügen einer neuen Leistung"
        * ^slicing.rules = #open
        * ^slicing.ordered = false
      * extension contains TemplateExtractValueExtension named templateExtractValueExtension 0..1 MS

* item[leistungAeandern]
  * linkId = "leistungAeandern"

  * item 1..*
    * linkId 1..1
    * extension MS
      * ^slicing.discriminator.type = #value
      * ^slicing.discriminator.path = "url"
      * ^slicing.description = "Erweiterungen für das Ändern einer Leistung"
      * ^slicing.rules = #open
      * ^slicing.ordered = false
    * extension contains TIFlowExtractFromDocument named tiFlowExtractFromDocument 0..1 MS

* item[leistungLoeschen]
  * linkId = "leistungLoeschen"
  * item 1..*
    * type = #reference (exactly)
    * answerOption.value[x] only string



