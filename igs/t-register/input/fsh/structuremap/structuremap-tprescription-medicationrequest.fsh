Instance: ERPTPrescriptionStructureMapMedicationRequest
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for MedicationRequest"
Description: "Mapping-Anweisungen zur Transformation von KBV MedicationRequest zu BfArM T-Prescription MedicationRequest"
* insert Instance(StructureMap, ERPTPrescriptionStructureMapMedicationRequest)
* insert sd_structure(https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription, source, kbvMedicationRequest)
* insert sd_structure(https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication-request, target, bfarmMedicationRequest)

* group[+]
  * name = "ERPTPrescriptionStructureMapMedicationRequest"
  * typeMode = #none
  * documentation = "Mapping-Anweisungen zur Transformation von KBV MedicationRequest zu BfArM T-Prescription MedicationRequest"

  * insert sd_input(kbvMedicationRequest, source)
  * insert sd_input(bfarmMedicationRequest, target)

  // set status to completed
  * rule[+]
    * name = "medicationRequestStatus"
    * insert treeSource(kbvMedicationRequest, status, srcStatus)
    * insert targetSetStringVariable(bfarmMedicationRequest, status, completed)
    * documentation = "Setzt den Status auf 'completed' für den digitalen Durchschlag (Verschreibung ist bereits abgeschlossen)"

  // set intent to order
  * rule[+]
    * name = "medicationRequestIntent"
    * source.context = "kbvMedicationRequest"
    * source.element = "intent"
    * insert targetSetStringVariable(bfarmMedicationRequest, intent, order)
    * documentation = "Setzt den Intent auf 'order' entsprechend der BfArM-Spezifikation für T-Prescription"

  //Copy T-Prescription Extensions
  * rule[+]
    * name = "medicationRequestExt"
    * documentation = "Mappt T-Rezept spezifische Extensions vom KBV- zum BfArM-Format"
    * insert treeSource(kbvMedicationRequest, extension, extVar)
    * source[=].condition = "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic'"
    * insert treeTarget(bfarmMedicationRequest, extension, tgtExtVar)
    * rule[+]
      * name = "copyTPrescriptionExtensionUrl"
      * documentation = "Kopiert teratogene Extensions für T-Rezept Kennzeichnung"
      * source[+].context = "extVar"
      * source[=].variable = "extMatchVar"
      * insert targetSetStringVariable(tgtExtVar, url,  https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension)
    * rule[+]
      * name = "mapOffLabelExtension"
      * documentation = "Mappt Off-Label Extension"
      * insert treeSource(extVar, extension, offLabelVar)
      * source[=].condition = "url='Off-Label'"
      * insert createType(tgtExtVar, extension, tgtOffLabelExt, Extension)
      * insert targetSetStringVariable(tgtOffLabelExt, url, off-label)
      * rule[+]
        * name = "mapOffLabelValue"
        * documentation = "Übernimmt den Off-Label Booleschen Wert"
        * insert treeSource(offLabelVar, value, offLabelValue)
        * insert targetSetIdVariable(tgtOffLabelExt, value, offLabelValue)
    * rule[+]
      * name = "mapGebaerfaehigeFrauExtension"
      * documentation = "Mappt GebaerfaehigeFrau Extension zu childbearing-potential"
      * insert treeSource(extVar, extension, gebaerfaehigeFrauVar)
      * source[=].condition = "url='GebaerfaehigeFrau'"
      * insert createType(tgtExtVar, extension, tgtGebaerfaehigeFrauExt, Extension)
      * insert targetSetStringVariable(tgtGebaerfaehigeFrauExt, url, childbearing-potential)
      * rule[+]
        * name = "mapGebaerfaehigeFrauValue"
        * documentation = "Übernimmt den Booleschen Wert für childbearing-potential"
        * insert treeSource(gebaerfaehigeFrauVar, value, gebaerfaehigeFrauValue)
        * insert targetSetIdVariable(tgtGebaerfaehigeFrauExt, value, gebaerfaehigeFrauValue)
    * rule[+]
      * name = "mapEinhaltungSicherheitsmassnahmenExtension"
      * documentation = "Mappt EinhaltungSicherheitsmassnahmen Extension zu security-compliance"
      * insert treeSource(extVar, extension, sicherheitsVar)
      * source[=].condition = "url='EinhaltungSicherheitsmassnahmen'"
      * insert createType(tgtExtVar, extension, tgtSicherheitsExt, Extension)
      * insert targetSetStringVariable(tgtSicherheitsExt, url, security-compliance)
      * rule[+]
        * name = "mapEinhaltungSicherheitsmassnahmenValue"
        * documentation = "Übernimmt den Booleschen Wert für security-compliance"
        * insert treeSource(sicherheitsVar, value, sicherheitsValue)
        * insert targetSetIdVariable(tgtSicherheitsExt, value, sicherheitsValue)
    * rule[+]
      * name = "mapAushaendigungInformationsmaterialienExtension"
      * documentation = "Mappt AushaendigungInformationsmaterialien Extension zu hand-out-information-material"
      * insert treeSource(extVar, extension, infoMatVar)
      * source[=].condition = "url='AushaendigungInformationsmaterialien'"
      * insert createType(tgtExtVar, extension, tgtInfoMatExt, Extension)
      * insert targetSetStringVariable(tgtInfoMatExt, url, hand-out-information-material)
      * rule[+]
        * name = "mapAushaendigungInformationsmaterialienValue"
        * documentation = "Übernimmt den Booleschen Wert für hand-out-information-material"
        * insert treeSource(infoMatVar, value, infoMatValue)
        * insert targetSetIdVariable(tgtInfoMatExt, value, infoMatValue)
    * rule[+]
      * name = "mapErklaerungSachkenntnisExtension"
      * documentation = "Mappt ErklaerungSachkenntnis Extension zu declaration-of-expertise"
      * insert treeSource(extVar, extension, sachkenntnisVar)
      * source[=].condition = "url='ErklaerungSachkenntnis'"
      * insert createType(tgtExtVar, extension, tgtSachkenntnisExt, Extension)
      * insert targetSetStringVariable(tgtSachkenntnisExt, url, declaration-of-expertise)
      * rule[+]
        * name = "mapErklaerungSachkenntnisValue"
        * documentation = "Übernimmt den Booleschen Wert für declaration-of-expertise"
        * insert treeSource(sachkenntnisVar, value, sachkenntnisValue)
        * insert targetSetIdVariable(tgtSachkenntnisExt, value, sachkenntnisValue)

  // Copy Dosage Extensions
  * rule[+]
    * name = "medicationRequestExt"
    * documentation = "Kopiert Dosage Metadata Extension"
    * insert treeSource(kbvMedicationRequest, extension, extDosageMetaVar)
    * source[=].condition = "url='http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta'"
    * insert targetSetIdVariable(bfarmMedicationRequest, extension, extDosageMetaVar)
  * rule[+]
    * name = "medicationRequestExt"
    * documentation = "Kopiert RenderedDosageText"
    * insert treeSource(kbvMedicationRequest, extension, extDosageRenderedVar)
    * source[=].condition = "url='http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction'"
    * insert targetSetIdVariable(bfarmMedicationRequest, extension, extDosageRenderedVar)
  
  // set subject to not-permitted
  * rule[+]
    * name = "medicationRequestsubject"
    * documentation = "Entfernt Patientenbezug durch data-absent-reason Extension für Datenschutz im digitalen Durchschlag"
    * insert treeSource(kbvMedicationRequest, subject, srcSubject)
    * insert treeTarget(bfarmMedicationRequest, subject, tgtSubject)
    * rule[+]
      * name = "medicationRequestsubjectIdentifier"
      * insert treeSource(kbvMedicationRequest, subject, srcSubject)
      * insert treeTarget(tgtSubject, identifier, tgtSubjectIdentifier)
      * rule[+]
        * name = "medicationRequestsubjectIdentifierExtension"
        * documentation = "Erstellt data-absent-reason Extension für Subject Identifier"
        * insert treeSource(kbvMedicationRequest, subject, srcSubject)
        * insert treeTarget(tgtSubjectIdentifier, system, tgtSubjectIdentifierSystem)
        * insert treeTarget(tgtSubjectIdentifier, value, tgtSubjectIdentifierValue)

        * rule[+]
          * name = "medicationRequestsubjectIdentifierSystem"
          * documentation = "Erstellt data-absent-reason Extension für Subject Identifier"
          * insert treeSource(kbvMedicationRequest, subject, srcSubject)
          * insert treeTarget(tgtSubjectIdentifierSystem, extension, tgtSubjectIdentifierSystemEx)
          * insert treeTarget(tgtSubjectIdentifierValue, extension, tgtSubjectIdentifierValueEx)
          * rule[+]
            * name = "medicationRequestsubjectIdentifierSystemExtension"
            * documentation = "Setzt data-absent-reason auf 'not-permitted' um Patientendaten zu anonymisieren"
            * insert treeSource(kbvMedicationRequest, subject, srcSubject)
            * insert targetSetStringVariable(tgtSubjectIdentifierSystemEx, url, http://hl7.org/fhir/StructureDefinition/data-absent-reason)
            * insert targetSetCodeVariable(tgtSubjectIdentifierSystemEx, value, not-permitted)
          * rule[+]
            * name = "medicationRequestsubjectIdentifierValueExtension"
            * documentation = "Setzt data-absent-reason auf 'not-permitted' um Patientendaten zu anonymisieren"
            * insert treeSource(kbvMedicationRequest, subject, srcSubject)
            * insert targetSetStringVariable(tgtSubjectIdentifierValueEx, url, http://hl7.org/fhir/StructureDefinition/data-absent-reason)
            * insert targetSetCodeVariable(tgtSubjectIdentifierValueEx, value, not-permitted)
        

  // authoredOn
  * rule[+]
    * name = "medicationRequestAuthoredOn"
    * insert treeSource(kbvMedicationRequest, authoredOn, srcAuthoredOnVar)
    * insert targetSetIdVariable(bfarmMedicationRequest, authoredOn, srcAuthoredOnVar)
    * documentation = "Übernimmt das Verschreibungsdatum unverändert vom KBV MedicationRequest"

  // dosageInstruction
  * rule[+]
    * name = "medicationRequestDosageInstruction"
    * insert treeSource(kbvMedicationRequest, dosageInstruction, srcDosageInstructionVar)
    * insert targetSetIdVariable(bfarmMedicationRequest, dosageInstruction, srcDosageInstructionVar)
    * documentation = "Kopiert die Dosierungsanweisungen vollständig für den digitalen Durchschlag"

  // dispenseRequest
  * rule[+]
    * name = "medicationRequestDispenseRequest"
    * insert treeSource(kbvMedicationRequest, dispenseRequest, srcDispenseRequestVar)
    * insert targetSetIdVariable(bfarmMedicationRequest, dispenseRequest, srcDispenseRequestVar)
    * documentation = "Übernimmt Abgabeanweisungen (Menge, Wiederholungen) aus der ursprünglichen Verschreibung"

  // reference to Medication
  * rule[+]
    * name = "medicationReference"
    * insert treeSource(kbvMedicationRequest, medicationReference, medicationVar)
    * insert createType(bfarmMedicationRequest, medication, tgtMedicationReference, Reference)
    * rule[+]
      * name = "normalizeMedicationReference"
      * insert treeSource(medicationVar, reference, medicationReferenceValue)
      * rule[+]
        * name = "normalizeMedicationReferenceTransformation"
        * source.context = "medicationReferenceValue"
        * target[+]
          * context = "tgtMedicationReference"
          * contextType = #variable
          * element = "reference"
          * transform = #evaluate
          * parameter[+].valueString = "iif(%medicationReferenceValue.startsWith('urn:uuid:'), %medicationReferenceValue, 'urn:uuid:' & %medicationReferenceValue.replaceMatches('.*[:/]', ''))"
     
