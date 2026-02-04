Instance: ERPTPrescriptionStructureMapKBVCompoundingMedication
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for KBV Compounding Medication"
Description: "Mapping-Anweisungen zur Transformation von KBV Rezeptur-Medikamenten zu BfArM T-Prescription Format"

* insert Instance(StructureMap, ERPTPrescriptionStructureMapKBVCompoundingMedication)
* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, source, kbvMedicationCompounding)
* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, target, bfarmMedication)

* group[+]
  * name = "ERPTPrescriptionStructureMapKBVCompoundingMedication"
  * typeMode = #none
  * documentation = "Mapping-Anweisungen zur Transformation von KBV Rezeptur-Medikamenten zu BfArM T-Prescription Format"
  * insert sd_input(kbvMedicationCompounding, source)
  * insert sd_input(bfarmMedication, target)
  
  // Extensions
  * rule[+]
    * name = "medicationExt"
    * insert treeSource(kbvMedicationCompounding, extension, extVar)
    * insert treeTarget(bfarmMedication, extension, tgtExtVar)
    * documentation = "Mappt Rezeptur-spezifische Extensions von KBV- zu BfArM-Format"
    * rule[+]
      * name = "copyFormulaPackagingExtensionUrl"
      * documentation = "Transformiert KBV-Verpackungs-Extension in gematik-Formulierungs-Verpackungs-Extension"
      * source[+].context = "extVar"
      * source[=].variable = "extMatchVar"
      * source[=].condition = "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging'"
      * insert targetSetStringVariable(tgtExtVar, url, https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension)
      * rule[+]
        * name = "copyExtensionValue"
        * documentation = "Übernimmt den Verpackungswert für die Rezeptur"
        * insert treeSource(extMatchVar, value, extValVar)
        * insert targetSetIdVariable(tgtExtVar, value, extValVar)

  // Id
  * rule[+]
    * name = "medicationId"
    * insert treeSource(kbvMedicationCompounding, id, IdVar)
    * insert targetSetIdVariable(bfarmMedication, id, IdVar)
    * documentation = "Übernimmt die eindeutige Medication-ID unverändert"

  // code
  * rule[+]
    * name = "medicationCode"
    * documentation = "Mappt den Rezeptur-Code mit Bezeichnung"
    * insert treeSource(kbvMedicationCompounding, code, srcCodeVar)
    * insert treeTarget(bfarmMedication, code, tgtCodeVar)
    * rule[+]
      * name = "medicationCodeText"
      * insert treeSource(srcCodeVar, text, srcCodeTextVar)
      * insert targetSetIdVariable(tgtCodeVar, text, srcCodeTextVar)
      * documentation = "Kopiert die Bezeichnung der Rezeptur (z.B. 'Hydrocortison-Salbe 1%')"

  // form
  * rule[+]
    * name = "medicationForm"
    * insert treeSource(kbvMedicationCompounding, form, formVar)
    * insert targetSetIdVariable(bfarmMedication, form, formVar)
    * documentation = "Übernimmt die Darreichungsform der Rezeptur (Salbe, Creme, Kapseln, etc.)"
   
  // amount
  * rule[+]
    * name = "medicationAmount"
    * insert treeSource(kbvMedicationCompounding, amount, amountVar)
    * insert treeTarget(bfarmMedication, amount, tgtAmountVar)
    * documentation = "Mappt die Gesamtmenge der herzustellenden Rezeptur"
    * rule[+]
      * name = "medicationAmountDenominator"
      * insert treeSource(amountVar, denominator, amountDenominatorVar)
      * insert targetSetIdVariable(tgtAmountVar, denominator, amountDenominatorVar)
      * documentation = "Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Rezeptur')"
      
    // Amount Numerator Values
    * rule[+]
      * name = "medicationAmountNumerator"
      * documentation = "Mappt die detaillierte Mengenangabe der Rezeptur"
      * insert treeSource(amountVar, numerator, amountNumeratorVar)
      * insert treeTarget(tgtAmountVar, numerator, tgtAmountNumeratorVar)
      
      // Amount Numerator Extensions
      * rule[+]
        * name = "medicationAmountExt"
        * insert treeSource(amountNumeratorVar, extension, amountNumExtVar)
        * insert treeTarget(tgtAmountNumeratorVar, extension, tgtAmountNumExtVar)
        * documentation = "Transformiert Packungsgrößen-Extensions für Rezepturen"
        * rule[+]
          * name = "copyPackagingSizeExtensionUrl"
          * documentation = "Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um"
          * source[+].context = "amountNumExtVar"
          * source[=].condition = "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize'"
          * insert targetSetStringVariable(tgtAmountNumExtVar, url, https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension)
        * rule[+]
          * name = "copyExtensionValue"
          * documentation = "Übernimmt den Packungsgrößenwert für die Rezeptur"
          * insert treeSource(amountNumExtVar, value, extValVar)
          * insert targetSetIdVariable(tgtAmountNumExtVar, value, extValVar)
      
      // Amount Numerator Values
      * rule[+]
        * name = "medicationAmountNumeratorValue"
        * insert treeSource(amountNumeratorVar, value, amountNumeratorValueVar)
        * insert targetSetIdVariable(tgtAmountNumeratorVar, value, amountNumeratorValueVar)
        * documentation = "Kopiert den numerischen Wert der Gesamtmenge (z.B. '50' für 50g Salbe)"
      * rule[+]
        * name = "medicationAmountNumeratorUnit"
        * insert treeSource(amountNumeratorVar, unit, amountNumeratorUnitVar)
        * insert targetSetIdVariable(tgtAmountNumeratorVar, unit, amountNumeratorUnitVar)
        * documentation = "Übernimmt die Mengeneinheit für die Rezeptur (g, ml, Stück, etc.)"
      * rule[+]
        * name = "medicationAmountNumeratorSystem"
        * insert treeSource(amountNumeratorVar, system, amountNumeratorSystemVar)
        * insert targetSetIdVariable(tgtAmountNumeratorVar, system, amountNumeratorSystemVar)
        * documentation = "Kopiert das Codesystem für die Mengeneinheit (meist UCUM)"
      * rule[+]
        * name = "medicationAmountNumeratorCode"
        * insert treeSource(amountNumeratorVar, code, amountNumeratorCodeVar)
        * insert targetSetIdVariable(tgtAmountNumeratorVar, code, amountNumeratorCodeVar)
        * documentation = "Übernimmt den standardisierten Code für die Mengeneinheit"

  // Compounding Ingredient
  * rule[+]
    * name = "medicationIngredient"
    * documentation = "Mappt die Bestandteile der Rezeptur mit detaillierten Mengen- und Stärkeangaben"
    * insert treeSource(kbvMedicationCompounding, ingredient, ingredientVar)
    * insert treeTarget(bfarmMedication, ingredient, tgtIngredientVar)
    
    // Copy item[x]
    * rule[+]
      * name = "medicationIngredientItemValue"
      * documentation = "Kopiert die Referenz oder den Code des Rezeptur-Bestandteils"
      * insert treeSource(ingredientVar, item, IngredientItemValueVar)
      * insert targetSetIdVariable(tgtIngredientVar, item, IngredientItemValueVar)
    
    // Extension
    * rule[+]
      * name = "medicationIngredientExt"
      * insert treeSource(ingredientVar, extension, IngredientExtVar)
      * insert treeTarget(tgtIngredientVar, extension, tgtIngredientExtVar)
      * documentation = "Transformiert Bestandteil-spezifische Extensions"
      * rule[+]
        * name = "copyIngredientFormExtensionUrl"
        * documentation = "Wandelt KBV-Bestandteil-Darreichungsform-Extension in gematik-Format um"
        * source[+].context = "IngredientExtVar"
        * source[=].condition = "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Ingredient_Form'"
        * insert targetSetStringVariable(tgtIngredientExtVar, url, https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-darreichungsform-extension)
        * rule[+]
          * name = "copyExtensionValue"
          * documentation = "Übernimmt die Darreichungsform des Bestandteils"
          * insert treeSource(IngredientExtVar, value, extValVar)
          * insert targetSetIdVariable(tgtIngredientExtVar, value, extValVar)
    
    // Copy strength
    * rule[+]
      * name = "medicationIngredientStrength"
      * documentation = "Mappt die Stärke/Konzentration des Bestandteils in der Rezeptur"
      * insert treeSource(ingredientVar, strength, IngredientStrengthValueVar)
      * insert treeTarget(tgtIngredientVar, strength, IngredientStrengthValueVar)
      
      // Copy numerator and denominator
      * rule[+]
        * name = "medicationIngredientDenominator"
        * documentation = "Kopiert den Nenner für die Stärkeangabe (Bezugsmenge)"
        * insert treeSource(IngredientStrengthValueVar, denominator, ingredientDenominatorVar)
        * insert targetSetIdVariable(IngredientStrengthValueVar, denominator, ingredientDenominatorVar)
      * rule[+]
        * name = "medicationIngredientNumerator"
        * documentation = "Kopiert den Zähler für die Stärkeangabe (Wirkstoffmenge)"
        * insert treeSource(IngredientStrengthValueVar, numerator, ingredientNumeratorVar)
        * insert targetSetIdVariable(IngredientStrengthValueVar, numerator, ingredientNumeratorVar)
      
      // Strength Extension
      * rule[+]
        * name = "medicationIngredientStrengthExt"
        * insert treeSource(IngredientStrengthValueVar, extension, IngredientStrExtVar)
        * insert treeTarget(IngredientStrengthValueVar, extension, tgtIngredientStrExtVar)
        * documentation = "Transformiert Bestandteil-Mengen-Extensions"
        * rule[+]
          * name = "copyIngredientAmountExtensionUrl"
          * documentation = "Wandelt KBV-Bestandteil-Mengen-Extension in gematik-Format um"
          * source[+].context = "IngredientStrExtVar"
          * source[=].condition = "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Ingredient_Amount'"
          * insert targetSetStringVariable(tgtIngredientStrExtVar, url, https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-amount-extension)
          * rule[+]
            * name = "copyExtensionValue"
            * documentation = "Übernimmt die Mengenangabe des Bestandteils"
            * insert treeSource(IngredientStrExtVar, value, extValVar)
            * insert targetSetIdVariable(tgtIngredientStrExtVar, value, extValVar)
