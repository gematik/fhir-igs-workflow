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

* extension MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.description = "Erweiterungen für den Kontext der Auswertung"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
* extension contains LaunchContextExtension named launchContext 1..1 MS

* extension[launchContext]
  * ^short = "Kontext für die Auswertung"
  * ^definition = "Die FHIR-Document-Bundle, die bearbeitet werden soll, wird als Kontext für die Template-Extraktion übergeben."
  * extension contains TIFlowLaunchContextProfile named profile 1..1 MS
  
  * extension[name].valueCoding = LaunchContext#sourceDocument
  * extension[type].valueCode = #Bundle
  * extension[description].valueString = "Das FHIR-Dokument, das bearbeitet werden soll"

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
  * extension contains TemplateExtractExtension named templateExtract 1..1 MS
  and ExtractAllocateIdExtension named extractAllocateId 1..1 MS
  and TIFlowAddReferenceInDocument named tiflowAddReferenceInDocument 0..* MS
  
  * extension[templateExtract]
    * ^short = "Referenz zum Template, was erzeugt werden soll"
    * ^definition = "Verweist auf eine in .contained hinterlegte Template-Ressource, die als Vorlage für die neu zu erstellende Ressource dient. Die Template-Ressource wird über SDC-Extensions mit Werten befüllt und anschließend als neue Ressource ins Dokument eingefügt."
    
  * extension[extractAllocateId]
    * ^short = "Setzen einer neuen UUID für die Referenzierung"
    * ^definition = "Allokiert für jede Wiederholung des Items eine neue UUID, die in den templateExtract- und templateExtractValue-Ausdrücken verfügbar ist."
    * valueString 1..1 MS
  
  * extension[tiflowAddReferenceInDocument]
    * ^short = "Ort der Referenzhinzufügung"
    
  * item 0..* MS
    
* item[ressourceAeandern]
  * type = #group
  * repeats MS

  * item 1..2 MS
    * ^short = "Sub-Items für Identifikation und Wert"
    * ^definition = "Optional ein item für die Ressourcen-ID, und mindestens ein item für den neuen Wert."
    * type MS
  
  * item ^slicing.discriminator.type = #value
  * item ^slicing.discriminator.path = "type"
  * item ^slicing.rules = #open
  * item ^slicing.description = "Unterscheidung nach item type"
  * item ^slicing.ordered = false
  
  * item contains idItem 0..1 MS and valueItem 1..1 MS
  
  * item[idItem]
    * type = #reference (exactly)
    * repeats = false
    * ^short = "ID der zu ändernden Ressource"
  
  * item[valueItem]
    * type MS
    * repeats = false
    * ^short = "Neuer Wert für das zu ändernde Feld"
    * extension MS
      * ^slicing.discriminator.type = #value
      * ^slicing.discriminator.path = "url"
      * ^slicing.description = "Erweiterungen für das Ändern einer ressource"
      * ^slicing.rules = #open
      * ^slicing.ordered = false
    * extension contains TIFlowTargetPath named tiFlowTargetPath 1..1 MS

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


Extension: TIFlowAddReferenceInDocument
Id: tiflow-add-reference-in-document
Title: "TI Flow Add Reference In Document"
Description: "SDC - Extension zum Hinzufügen einer Referenz in einem Dokument"
* value[x] only string
* valueString 1..1 MS
  * ^short = "Ort der Referenz"
  * ^definition = "FHIR-Path Ausdruck zum Hinzufügen der Referenz"
 
Extension: TIFlowLaunchContextProfile
Id: tiflow-launch-context-profile
Title: "TI Flow Launch Context Profile"
Description: "SDC - Extension zur Angabe von Profil und Version des Fachdokuments"
* value[x] only canonical
* valueCanonical 1..1 MS
  * ^short = "Canonical des Fachdokuments"
  * ^definition = "Anzugeben als Canonical mit Version des Fachdokuments"
  * ^comment = "Der E-Rezept-Fachdienst nutzt diese Cannonical um zu validieren, dass ein Fachdokument in dieser Version vorliegt."

Extension: TIFlowTargetPath
Id: tiflow-target-path
Title: "TI Flow Target Path"
Description: "Spezifiziert den FHIRPath im FHIR-Dokument, wo ein Feld aktualisiert werden soll"
* value[x] only string
* valueString 1..1 MS
  * ^short = "Ziel-Feldpfad"
  * ^definition = "FHIRPath-Ausdruck (relativ zur identifizierten Ressource) der angibt, welches Feld in der Ressource aktualisiert werden soll"

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