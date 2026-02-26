Instance: ERPTPrescriptionStructureMapKBVPZNMedication
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for KBV PZN Medication"
Description: "Mapping-Anweisungen zur Transformation von KBV PZN-Medikamenten zu BfArM T-Prescription Format"
* insert Instance(StructureMap, ERPTPrescriptionStructureMapKBVPZNMedication)

* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, source, kbvMedicationPZN)
* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, target, bfarmMedication)

* group[+]
  * name = "ERPTPrescriptionStructureMapKBVPZNMedication"
  * typeMode = #none
  * documentation = "Mapping-Anweisungen zur Transformation von KBV PZN-Medikamenten zu BfArM T-Prescription Format"

  * insert sd_input(kbvMedicationPZN, source)
  * insert sd_input(bfarmMedication, target)

  // Extensions
  * rule[+]
    * name = "medicationExt"
    * insert treeSource(kbvMedicationPZN, extension, extVar)
    * insert treeTarget(bfarmMedication, extension, tgtExtVar)
    * documentation = "Mappt Medication-Extensions von KBV- zu BfArM-Format"
    * rule[+]
      * name = "copyNormgroesseExtensionUrl"
      * documentation = "Übernimmt die Normgröße-Extension unverändert (deutsche Packungsgrößenangabe)"
      * source[+].context = "extVar"
      * source[=].condition = "url='http://fhir.de/StructureDefinition/normgroesse'"
      * insert targetSetStringVariable(tgtExtVar, url, http://fhir.de/StructureDefinition/normgroesse)
      * rule[+]
        * name = "copyExtensionValue"
        * documentation = "Kopiert den Wert der Normgröße-Extension (N1, N2, N3)"
        * insert treeSource(extVar, value, extValVar)
        * insert targetSetIdVariable(tgtExtVar, value, extValVar)

  
  // Id
  * rule[+]
    * name = "medicationId"
    * insert treeSource(kbvMedicationPZN, id, IdVar)
    * insert targetSetIdVariable(bfarmMedication, id, IdVar)
    * documentation = "Übernimmt die eindeutige Medication-ID unverändert"

  // code
  * rule[+]
    * name = "medicationCode"
    * insert treeSource(kbvMedicationPZN, code, codeVar)
    // * source[=].logMessage = "$this"
    * insert targetSetIdVariable(bfarmMedication, code, codeVar)
    * documentation = "Kopiert den Medikamentencode (PZN - Pharmazentralnummer) für die eindeutige Identifikation"

  // form
  * rule[+]
    * name = "medicationForm"
    * insert treeSource(kbvMedicationPZN, form, formVar)
    * insert targetSetIdVariable(bfarmMedication, form, formVar)
    * documentation = "Übernimmt die Darreichungsform (Tabletten, Kapseln, Tropfen, etc.)"
  
   // amount
  * rule[+]
    * name = "medicationAmount"
    * insert treeSource(kbvMedicationPZN, amount, amountVar)
    * insert treeTarget(bfarmMedication, amount, tgtAmountVar)
    * documentation = "Mappt die Mengenangaben des Fertigarzneimittels (Packungsgröße und Inhalt)"

    * rule[+]
      * name = "medicationAmountDenominator"
      * insert treeSource(amountVar, denominator, amountDenominatorVar)
      * insert targetSetIdVariable(tgtAmountVar, denominator, amountDenominatorVar)
      * documentation = "Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Packung')"
    
    // Amount Numerator Values
    * rule[+]
      * name = "medicationAmountNumerator"
      * documentation = "Mappt den Zähler der Mengenangabe mit allen Details (Wert, Einheit, Extensions)"
      * insert treeSource(amountVar, numerator, amountNumeratorVar)
      * insert treeTarget(tgtAmountVar, numerator, tgtAmountNumeratorVar)
      
      // Amount Numerator Extensions
      * rule[+]
        * name = "medicationAmountExt"
        * insert treeSource(amountNumeratorVar, extension, amountNumExtVar)
        * insert treeTarget(tgtAmountNumeratorVar, extension, tgtAmountNumExtVar)
        * documentation = "Transformiert Packungsgrößen-Extensions von KBV- zu gematik-Format"
        * rule[+]
          * name = "copyPackagingSizeExtensionUrl"
          * documentation = "Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um"
          * source[+].context = "amountNumExtVar"
          * source[=].condition = "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize'"
          * insert targetSetStringVariable(tgtAmountNumExtVar, url, https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension)
          * rule[+]
            * name = "copyExtensionValue"
            * documentation = "Übernimmt den Packungsgrößenwert unverändert"
            * insert treeSource(amountNumExtVar, value, extValVar)
            * insert targetSetIdVariable(tgtAmountNumExtVar, value, extValVar)

      // Amount Numerator Values
      * rule[+]
        * name = "medicationAmountNumeratorValue"
        * insert treeSource(amountNumeratorVar, value, amountNumeratorValueVar)
        * insert targetSetIdVariable(tgtAmountNumeratorVar, value, amountNumeratorValueVar)
        * documentation = "Kopiert den numerischen Wert der Menge (z.B. '20' für 20 Tabletten)"
      * rule[+]
        * name = "medicationAmountNumeratorUnit"
        * insert treeSource(amountNumeratorVar, unit, amountNumeratorUnitVar)
        * insert targetSetIdVariable(tgtAmountNumeratorVar, unit, amountNumeratorUnitVar)
        * documentation = "Übernimmt die Mengeneinheit (Stück, ml, g, etc.)"
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
    * insert treeSource(kbvMedicationPZN, ingredient, ingredientVar)
    * insert targetSetIdVariable(bfarmMedication, ingredient, ingredientVar)
    * documentation = "Kopiert Wirkstoffinformationen (bei PZN-Medikamenten meist nicht detailliert angegeben)"
