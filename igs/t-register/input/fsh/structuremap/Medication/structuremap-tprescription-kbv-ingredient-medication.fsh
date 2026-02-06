Instance: ERPTPrescriptionStructureMapKBVIngredientMedication
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for KBV Ingredient Medication"
Description: "Maps KBV-Ingredient ERP Medication to BfArM T-Prescription Medication format"
* insert Instance(StructureMap, ERPTPrescriptionStructureMapKBVIngredientMedication)

* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, source, kbvMedicationIngredient)
* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, target, bfarmMedication)

* group[+]
  * name = "ERPTPrescriptionStructureMapKBVIngredientMedication"
  * typeMode = #none
  * documentation = "Mapping-Anweisungen zur Transformation von KBV Wirkstoff-Medikamenten zu BfArM T-Prescription Format"

  * insert sd_input(kbvMedicationIngredient, source)
  * insert sd_input(bfarmMedication, target)

  // Id
  * rule[+]
    * name = "medicationId"
    * insert treeSource(kbvMedicationIngredient, id, IdVar)
    * insert targetSetIdVariable(bfarmMedication, id, IdVar)
    * documentation = "Übernimmt die eindeutige Medication-ID unverändert"

  // form
  * rule[+]
    * name = "medicationForm"
    * insert treeSource(kbvMedicationIngredient, form, formVar)
    * insert targetSetIdVariable(bfarmMedication, form, formVar)
    * documentation = "Kopiert die gewünschte Darreichungsform für die Wirkstoff-Verordnung (Kapseln, Salbe, Lösung, etc.)"
  
  
   // amount
  * rule[+]
    * name = "medicationAmount"
    * insert treeSource(kbvMedicationIngredient, amount, amountVar)
    * insert treeTarget(bfarmMedication, amount, tgtAmountVar)
    * documentation = "Mappt die Gesamtmenge der herzustellenden Wirkstoff-Verordnung"

    * rule[+]
      * name = "medicationAmountDenominator"
      * insert treeSource(amountVar, denominator, amountDenominatorVar)
      * insert targetSetIdVariable(tgtAmountVar, denominator, amountDenominatorVar)
      * documentation = "Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Herstellung')"
    
    // Amount Numerator Values
    * rule[+]
      * name = "medicationAmountNumerator"
      * documentation = "Mappt die detaillierte Mengenangabe"
      * insert treeSource(amountVar, numerator, amountNumeratorVar)
      * insert treeTarget(tgtAmountVar, numerator, tgtAmountNumeratorVar)
      
      // Amount Numerator Extensions
      * rule[+]
        * name = "medicationAmountExt"
        * insert treeSource(amountNumeratorVar, extension, amountNumExtVar)
        * insert treeTarget(tgtAmountNumeratorVar, extension, tgtAmountNumExtVar)
        * documentation = "Transformiert Packungsgrößen-Extensions von KBV- zu gematik-Format für Wirkstoff Verordnung"
        * rule[+]
          * name = "copyPackagingSizeExtensionUrl"
          * documentation = "Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um"
          * source[+].context = "amountNumExtVar"
          * source[=].condition = "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize'"
          * insert targetSetStringVariable(tgtAmountNumExtVar, url, https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension)
          * rule[+]
            * name = "copyExtensionValue"
            * documentation = "Übernimmt den Packungsgrößenwert"
            * insert treeSource(amountNumExtVar, value, extValVar)
            * insert targetSetIdVariable(tgtAmountNumExtVar, value, extValVar)

      // Amount Numerator Values
      * rule[+]
        * name = "medicationAmountNumeratorValue"
        * insert treeSource(amountNumeratorVar, value, amountNumeratorValueVar)
        * insert targetSetIdVariable(tgtAmountNumeratorVar, value, amountNumeratorValueVar)
        * documentation = "Kopiert den numerischen Wert der Gesamtmenge (z.B. '100' für 100g Salbe)"
      * rule[+]
        * name = "medicationAmountNumeratorUnit"
        * insert treeSource(amountNumeratorVar, unit, amountNumeratorUnitVar)
        * insert targetSetIdVariable(tgtAmountNumeratorVar, unit, amountNumeratorUnitVar)
        * documentation = "Übernimmt die Mengeneinheit (g, ml, Stück, etc.)"
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

  // ingredient
  * rule[+]
    * name = "medicationIngredient"
    * insert treeSource(kbvMedicationIngredient, ingredient, ingredientVar)
    * insert targetSetIdVariable(bfarmMedication, ingredient, ingredientVar)
    * documentation = "Kopiert die detaillierten Wirkstoffinformationen mit Konzentrationen und Mengenangaben"
