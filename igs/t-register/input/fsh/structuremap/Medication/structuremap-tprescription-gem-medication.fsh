Instance: ERPTPrescriptionStructureMapGEMMedication
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for Medication"
Description: "Maps GEM ERP Medication to BfArM T-Prescription Medication format"
* insert Instance(StructureMap, ERPTPrescriptionStructureMapGEMMedication)

* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, source, gematikMedication)
* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, target, bfarmMedication)

* group[+]
  * name = "ERPTPrescriptionStructureMapGEMMedication"
  * typeMode = #none
  * documentation = "Mapping-Anweisungen zur Transformation von gematik ERP-Medikamenten zu BfArM T-Prescription Format"

  * insert sd_input(gematikMedication, source)
  * insert sd_input(bfarmMedication, target)

  // Id
  * rule[+]
    * name = "medicationId"
    * insert treeSource(gematikMedication, id, IdVar)
    * insert targetSetIdVariable(bfarmMedication, id, IdVar)
    * documentation = "Übernimmt die eindeutige Medication-ID unverändert"

  // Contained Medications
  * rule[+]
    * name = "mapContainedRessources"
    * insert treeSource(gematikMedication, contained, ContainedVar)
    * insert targetSetIdVariable(bfarmMedication, contained, ContainedVar)
    * documentation = "Kopiert eingebettete Ressourcen (z.B. referenzierte Medications oder Organizations)"

  // Extensions
  * rule[+]
    * name = "medicationExtension"
    * insert treeSource(gematikMedication, extension, extVar)
    * insert treeTarget(bfarmMedication, extension, tgtExtVar)
    * documentation = "Mappt gematik-spezifische Medication-Extensions zu BfArM-Format"
    
    // Normgroesse
    * rule[+]
      * name = "copyNormgroesseExtensionUrl"
      * documentation = "Übernimmt die Normgröße-Extension unverändert (deutsche Packungsgrößenangabe N1, N2, N3)"
      * source[+].context = "extVar"
      * source[=].condition = "url='http://fhir.de/StructureDefinition/normgroesse'"
      * insert targetSetStringVariable(tgtExtVar, url, http://fhir.de/StructureDefinition/normgroesse)
      * rule[+]
        * name = "copyExtensionValue"
        * documentation = "Kopiert den Wert der Normgröße-Extension"
        * insert treeSource(extVar, value, extValVar)
        * insert targetSetIdVariable(tgtExtVar, value, extValVar)

    //Packaging
    * rule[+]
      * name = "copyPackagingExtensionUrl"
      * documentation = "Übernimmt die gematik-Verpackungs-Extension für Formulierungen"
      * source[+].context = "extVar"
      * source[=].condition = "url='https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension'"
      * insert targetSetStringVariable(tgtExtVar, url, https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension)
      * rule[+]
        * name = "copyExtensionValue"
        * documentation = "Kopiert den Wert der Verpackungs-Extension"
        * insert treeSource(extVar, value, extValVar)
        * insert targetSetIdVariable(tgtExtVar, value, extValVar)
  
  // code
  * rule[+]
    * name = "medicationCode"
    * insert treeSource(gematikMedication, code, codeVar)
    * insert targetSetIdVariable(bfarmMedication, code, codeVar)
    * documentation = "Kopiert den Medikamentencode (PZN oder andere Identifikation) des abgegebenen Arzneimittels"
  
  // form
  * rule[+]
    * name = "medicationForm"
    * insert treeSource(gematikMedication, form, formVar)
    * insert targetSetIdVariable(bfarmMedication, form, formVar)
    * documentation = "Übernimmt die Darreichungsform des tatsächlich abgegebenen Arzneimittels"
  
  // amount
  * rule[+]
    * name = "medicationAmount"
    * insert treeSource(gematikMedication, amount, amountVar)
    * insert targetSetIdVariable(bfarmMedication, amount, amountVar)
    * documentation = "Kopiert die Mengenangaben des abgegebenen Arzneimittels (tatsächlich ausgehändigte Menge)"
  
  // ingredient
  * rule[+]
    * name = "medicationIngredient"
    * insert treeSource(gematikMedication, ingredient, ingredientVar)
    * insert targetSetIdVariable(bfarmMedication, ingredient, ingredientVar)
    * documentation = "Übernimmt Wirkstoffinformationen des abgegebenen Arzneimittels (falls vorhanden)"
