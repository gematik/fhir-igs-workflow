Instance: ERPTPrescriptionStructureMapKBVFreeTextMedication
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for KBV FreeText Medication"
Description: "Maps KBV FreeText Medication to BfArM T-Prescription Medication format"
* insert Instance(StructureMap, ERPTPrescriptionStructureMapKBVFreeTextMedication)

* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, source, kbvMedicationFreeText)
* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Medication, target, bfarmMedication)

// KBV FreeText Medication
* group[+]
  * name = "ERPTPrescriptionStructureMapKBVFreeTextMedication"
  * typeMode = #none
  * documentation = "Mapping-Anweisungen zur Transformation von KBV Freitext-Medikamenten zu BfArM T-Prescription Format"

  * insert sd_input(kbvMedicationFreeText, source)
  * insert sd_input(bfarmMedication, target)

  // Id
  * rule[+]
    * name = "medicationId"
    * insert treeSource(kbvMedicationFreeText, id, IdVar)
    * insert targetSetIdVariable(bfarmMedication, id, IdVar)
    * documentation = "Übernimmt die eindeutige Medication-ID unverändert"

  // code
  * rule[+]
    * name = "medicationCode"
    * documentation = "Mappt den Medikamentencode mit Freitext-Beschreibung"
    * insert treeSource(kbvMedicationFreeText, code, srcCodeVar)
    * insert treeTarget(bfarmMedication, code, tgtCodeVar)
    * rule[+]
      * name = "medicationCodeText"
      * insert treeSource(srcCodeVar, text, srcCodeTextVar)
      * insert targetSetIdVariable(tgtCodeVar, text, srcCodeTextVar)
      * documentation = "Kopiert die Freitext-Bezeichnung des Medikaments (z.B. 'Aspirin 500mg Tabletten')"
  
  // form
  * rule[+]
    * name = "medicationForm"
    * documentation = "Mappt die Darreichungsform als Freitext"
    * insert treeSource(kbvMedicationFreeText, form, srcFormVar)
    * insert treeTarget(bfarmMedication, form, tgtFormVar)
    * rule[+]
      * name = "medicationFormText"
      * insert treeSource(srcFormVar, text, srcformTextVar)
      * insert targetSetIdVariable(tgtFormVar, text, srcformTextVar)
      * documentation = "Übernimmt die Freitext-Darreichungsform (z.B. 'Tabletten', 'Tropfen zum Einnehmen')"
