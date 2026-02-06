Instance: ERPTPrescriptionStructureMapMedication
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for Medication"
Description: "Router-Mapping zur Auswahl der korrekten Medication-Transformation basierend auf dem KBV/gematik Profil"
* insert Instance(StructureMap, ERPTPrescriptionStructureMapMedication)

* import[+] = Canonical(ERPTPrescriptionStructureMapGEMMedication)
* import[+] = Canonical(ERPTPrescriptionStructureMapKBVCompoundingMedication)
* import[+] = Canonical(ERPTPrescriptionStructureMapKBVPZNMedication)
* import[+] = Canonical(ERPTPrescriptionStructureMapKBVFreeTextMedication)
* import[+] = Canonical(ERPTPrescriptionStructureMapKBVIngredientMedication)

* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, source, srcMedication)
* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, target, tgtMedication)

* group[+]
  * name = "ERPTPrescriptionStructureMapMedication"
  * typeMode = #none
  * documentation = "Router-Mapping zur Auswahl der korrekten Medication-Transformation basierend auf dem KBV/gematik Profil"

  * insert sd_input(srcMedication, source)
  * insert sd_input(tgtMedication, target)

  // PZN
  * rule[+]
    * name = "decideOnMedicationPZN"
    * documentation = "Erkennt PZN-basierte Medikamente und leitet an spezialisiertes PZN-Mapping weiter"
    * source[+].context = "srcMedication"
    * source[=].variable = "srcPZN"
    * source[=].condition = "meta.profile.contains('KBV_PR_ERP_Medication_PZN')"
    
    * rule[+]
      * name = "mapPZN"
      * documentation = "Führt die Transformation für PZN-Medikamente durch (Fertigarzneimittel mit Pharmazentralnummer)"
      * source[+].context = "srcPZN"
      * insert dependent(ERPTPrescriptionStructureMapKBVPZNMedication, srcMedication, tgtMedication)
  
  // FreeText
  * rule[+]
    * name = "decideOnMedicationFreeText"
    * documentation = "Erkennt Freitext-Medikamente und leitet an spezialisiertes FreeText-Mapping weiter"
    * source[+].context = "srcMedication"
    * source[=].variable = "srcFreeText"
    * source[=].condition = "meta.profile.contains('KBV_PR_ERP_Medication_FreeText')"
    
    * rule[+]
      * name = "mapFreeText"
      * documentation = "Führt die Transformation für Freitext-Medikamente durch (nicht standardisierte Arzneimittelangaben)"
      * source[+].context = "srcFreeText"
      * insert dependent(ERPTPrescriptionStructureMapKBVFreeTextMedication, srcMedication, tgtMedication)
  
  // Ingredient
  * rule[+]
    * name = "decideOnMedicationIngredient"
    * documentation = "Erkennt wirkstoffbasierte Medikamente und leitet an spezialisiertes Ingredient-Mapping weiter"
    * source[+].context = "srcMedication"
    * source[=].variable = "srcIngredient"
    * source[=].condition = "meta.profile.contains('KBV_PR_ERP_Medication_Ingredient')"
    
    * rule[+]
      * name = "mapIngredient"
      * documentation = "Führt die Transformation für wirkstoffbasierte Medikamente durch (Rezeptur nach Wirkstoffen)"
      * source[+].context = "srcIngredient"
      * insert dependent(ERPTPrescriptionStructureMapKBVIngredientMedication, srcMedication, tgtMedication)
  
  // Compounding
  * rule[+]
    * name = "decideOnMedicationCompounding"
    * documentation = "Erkennt Rezeptur-Medikamente und leitet an spezialisiertes Compounding-Mapping weiter"
    * source[+].context = "srcMedication"
    * source[=].variable = "srcCompounding"
    * source[=].condition = "meta.profile.contains('KBV_PR_ERP_Medication_Compounding')"
    
    * rule[+]
      * name = "mapCompounding"
      * documentation = "Führt die Transformation für Rezeptur-Medikamente durch (individuell hergestellte Arzneimittel)"
      * source[+].context = "srcCompounding"
      * insert dependent(ERPTPrescriptionStructureMapKBVCompoundingMedication, srcMedication, tgtMedication)
  
  // GematikMedication
  * rule[+]
    * name = "decideOnMedicationGematik"
    * documentation = "Erkennt gematik-Medikamente und leitet an spezialisiertes gematik-Mapping weiter"
    * source[+].context = "srcMedication"
    * source[=].variable = "srcGemMed"
    * source[=].condition = "meta.profile.contains('GEM_ERP_PR_Medication')"
    
    * rule[+]
      * name = "mapGemMed"
      * documentation = "Führt die Transformation für gematik-Medikamente durch (abgegebene Arzneimittel aus der Apotheke)"
      * source[+].context = "srcGemMed"
      * insert dependent(ERPTPrescriptionStructureMapGEMMedication, srcMedication, tgtMedication)
