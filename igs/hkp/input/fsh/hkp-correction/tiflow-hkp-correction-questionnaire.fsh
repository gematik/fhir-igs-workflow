Profile: TIFlowManipulateFhirDocument
Parent: Questionnaire
Id: tiflow-manipulate-fhir-document
Title: "tiflow-manipulate-fhir-document"
Description: "Manipulate FHIR-Document Questionnaire Profile"
//administrative Information
* version 1..1 MS
  * ^short = "Version des Questionnaire"
  * ^definition = "Die Version des Questionnaire zur Identifikation und Versionsverwaltung."
* name 1..1 MS
  * ^short = "Maschinenlesbarer Name"
  * ^definition = "Ein maschinenlesbarer Name für das Questionnaire."
* title 1..1 MS
  * ^short = "Menschenlesbarer Titel"
  * ^definition = "Ein menschenlesbarer Titel für das Questionnaire."
* status 1..1 MS
  * ^short = "Status des Questionnaire"
  * ^definition = "Der aktuelle Status des Questionnaire (z.B. aktiv, entwurf)."
* date 1..1 MS
  * ^short = "Datum der letzten Änderung"
  * ^definition = "Das Datum der letzten Änderung des Questionnaire."
* publisher 1..1 MS 
  * ^short = "Herausgeber"
  * ^definition = "Der Name der Organisation oder Person, die das Questionnaire veröffentlicht hat."
* description MS
  * ^short = "Beschreibung"
  * ^definition = "Eine Beschreibung des Questionnaire und seines Zwecks."
* purpose MS
  * ^short = "Zweck"
  * ^definition = "Der klinische oder fachliche Zweck des Questionnaire."
* code 1..1 MS
  * ^short = "Anpassungskategorie"
  * ^definition = "Kodierung der Anpassungskategorie für FHIR-Dokumente."
* code from TIFlowManipulateFHIRDocumentCodesVS (required)

* contained MS
  * ^short = "Templates für neue Ressourcen"
  * ^definition = "Falls die Gruppe ressourceHinzufügen genutzt wird, muss in contained template Ressourcen angelegt werden, die zu befüllen sind."

* item
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "linkId"
  * ^slicing.rules = #closed
  * ^slicing.description = "Anpassungskategorie"
  * ^slicing.ordered = false

* item contains ressourceHinzufuegen 0..* MS and
ressourceAeandern 0..* MS and
ressourceLoeschen 0..* MS

* item[ressourceHinzufuegen]
  * type = #group (exactly)
  * repeats MS
  
  // Template Extension for new ressource
  * extension MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.description = "Erweiterungen für das Hinzufügen einer neuen Ressource"
    * ^slicing.rules = #open
    * ^slicing.ordered = false
  * extension contains TemplateExtractExtension named templateExtractExtension 1..1 MS
  and TIFlowAddReferenceInDocument named tiflowAddReferenceInDocument 0..* MS
  
  * extension[templateExtractExtension]
    * ^short = "Referenz zum Template, was erzeugt werden soll"
    * ^definition = "Verweist auf eine in .contained hinterlegte Template-Ressource, die als Vorlage für die neu zu erstellende Ressource dient. Die Template-Ressource wird über SDC-Extensions mit Werten befüllt und anschließend als neue Ressource ins Dokument eingefügt."
    
  * extension[tiflowAddReferenceInDocument]
    * ^short = "Ort der Referenzhinzufügung"
    
  * item 0..* MS
    
* item[ressourceAeandern]
  * linkId = "ressourceAeandern"
  * type = #group
  * repeats MS

  * item 2..2
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "linkId"
    * ^slicing.rules = #closed
    * ^slicing.description = "Identifikatoren für die Änderungen an einer Ressource"
    * ^slicing.ordered = false

  * item contains id 0..1 MS and value 1..1 MS
  
  * item[id]
    * linkId = "ressourceAeandern.id"
    * type = #reference
    * repeats = false
  * item[value]
    * linkId = "ressourceAeandern.value"
    * repeats = false

    * extension MS
      * ^slicing.discriminator.type = #value
      * ^slicing.discriminator.path = "url"
      * ^slicing.description = "Erweiterungen für das Ändern einer ressource"
      * ^slicing.rules = #open
      * ^slicing.ordered = false
    * extension contains TIFlowExtractFromDocument named tiFlowExtractFromDocument 1..1 MS

* item[ressourceLoeschen]
  * linkId = "ressourceLoeschen"
  * type = #reference (exactly)
  * repeats MS
  
  * extension MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.description = "Erweiterungen für das Löschen einer Ressource"
    * ^slicing.rules = #open
    * ^slicing.ordered = false
  * extension contains TIFlowRemoveReferenceInDocument named tiflowRemoveReferenceInDocument 0..* MS
  
  * extension[tiflowRemoveReferenceInDocument]
    * ^short = "Ort der Referenzlöschung"

Extension: TIFlowExtractFromDocument
Id: tiflow-extract-from-document
Title: "TI Flow Extract From Document"
Description: "TBD"
* value[x] only string
* valueString 1..1 MS
  * ^short = "FHIR-Path zum Feld"
  * ^definition = "FHIR-Path Ausdruck zum Ändern des Wertes in einem Dokument. Relativ zur extrahierten Ressource."

Extension: TIFlowAddReferenceInDocument
Id: tiflow-add-reference-in-document
Title: "TI Flow Add Reference In Document"
Description: "SDC - Extension zum Hinzufügen einer Referenz in einem Dokument"
* value[x] only string
* valueString 1..1 MS
  * ^short = "Ort der Referenz"
  * ^definition = "FHIR-Path Ausdruck zum Hinzufügen der Referenz"

Extension: TIFlowRemoveReferenceInDocument
Id: tiflow-remove-reference-in-document
Title: "TI Flow Remove Reference In Document"
Description: "SDC - Extension zum Entfernen einer Referenz in einem Dokument"
* value[x] only string
* valueString 1..1 MS
  * ^short = "Ort der Referenz"
  * ^definition = "FHIR-Path Ausdruck zum Entfernen der Referenz"

CodeSystem: TIFlowManipulateFHIRDocumentCodesCS
Id: tiflow-manipulate-fhirdocument-codes-cs
Title: "TI Flow Manipulate FHIR Document Codes CodeSystem"
Description: "Codes für Manipulation von FHIR-Dokumenten"
* #hkp-verordnungsdatensatz "Code für die Anpassung von HKP-Verordnungsdatensätzen"

ValueSet: TIFlowManipulateFHIRDocumentCodesVS
Id: tiflow-manipulate-fhirdocument-codes-vs
Title: "TI Flow Manipulate FHIR Document Codes VS"
Description: "Codes für Manipulation von FHIR-Dokumenten"
* include codes from system TIFlowManipulateFHIRDocumentCodesCS