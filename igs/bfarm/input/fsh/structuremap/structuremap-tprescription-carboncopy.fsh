Instance: ERPTPrescriptionStructureMapCarbonCopy
InstanceOf: StructureMap
Usage: #definition
Title: "E-T-Rezept Structure Map for CarbonCopy"
Description: "Diese Ressource beschreibt das Mapping und führt die Mappings aller Teilressourcen zusammen. Weitere Informationen und Beschreibungen zum Mapping können auf der Seite [Mapping des digitalen Durchschlag E-T-Rezept](./trezept.html#mapping-des-digitalen-durchschlags-e-t-rezept) eingesehen werden."
* insert Instance(StructureMap, ERPTPrescriptionStructureMapCarbonCopy)

* import[+] = Canonical(ERPTPrescriptionStructureMapMedicationDispense)
* import[+] = Canonical(ERPTPrescriptionStructureMapMedicationRequest)
* import[+] = Canonical(ERPTPrescriptionStructureMapOrganization)
* import[+] = Canonical(ERPTPrescriptionStructureMapTask)
* import[+] = Canonical(ERPTPrescriptionStructureMapMedication)

* insert sd_structure(http://hl7.org/fhir/StructureDefinition/Bundle, source, bundle)
* insert sd_structure(https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-carbon-copy, target, erpTCarbonCopy)

// Map rxDispense
* group[+]
  * name = "erpTPrescriptionCarbonCopy"
  * typeMode = #none
  * documentation = "Mapping des digitalen Durchschlags T-Rezept aus einem E-Rezept Bundle in das BfArM CarbonCopy Format"

  * insert sd_input(bundle, source)
  * insert sd_input(erpTCarbonCopy, target)

  // set meta profile
  * rule[+]
    * name = "tgtMeta"
    * documentation = "Setzt die Metadaten für den digitalen Durchschlag"
    * source.context = "bundle"
    * insert treeTarget(erpTCarbonCopy, meta, erpTCarbonCopyMeta)
    * rule[+]
      * name = "tgtMetaProfile"
      * source.context = "bundle"
      * insert setMetaProfileCC(erpTCarbonCopyMeta, profile)
      * documentation = "Setzt das meta.profile des digitalen Durchschlags T-Rezept"

  // Parameter rxPrescription
  * rule[+]
    * name = "rxPrescriptionRule"
    * source.context = "bundle"
    * documentation = "Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen"
    * insert treeTarget(erpTCarbonCopy, parameter, tgtRxPrescription)
    * insert treeTarget(tgtRxPrescription, part, tgtRxPrescriptionPartId)
    * insert treeTarget(tgtRxPrescription, part, tgtRxPrescriptionPartMR)
    * insert treeTarget(tgtRxPrescription, part, tgtRxPrescriptionPartMed)
    * insert targetSetStringVariable(tgtRxPrescription, name, rxPrescription)

    * rule[+]
      * name = "bundleEntries"
      * documentation = "Verarbeitet alle Einträge des Quell-Bundles für Verschreibungsinformationen"
      * insert treeSource(bundle, entry, srcEntryVar)

      * rule[+]
        * name = "rxPrescriptionParameter"
        * documentation = "Extrahiert relevante Ressourcen für die Verschreibung"
        * insert treeSource(srcEntryVar, resource, srcEntryResourceVar)
        
        // part prescriptionId
        * rule[+]
          * name = "parameterrXPrescriptionPart"
          * source[+].context = "srcEntryResourceVar"
          * source[=].variable = "srcEntryTaskVar"
          * source[=].condition = "ofType(Task)"
          // * source[=].logMessage = "ofType(Task)"
          * insert targetSetStringVariable(tgtRxPrescriptionPartId, name, prescriptionId)
          * insert createType(tgtRxPrescriptionPartId, value, newIdentifier, Identifier)
          * documentation = "Extrahiert die E-Rezept-ID aus dem Task und erstellt den prescriptionId Parameter"
          * rule[+]
            * name = "parameterrXPrescriptionPartIdentifier"
            * documentation = "Mappt Task-Informationen auf Identifier für die Rezept-ID"
            * source.context = "srcEntryTaskVar"
            * insert dependent(ERPTPrescriptionStructureMapTask, srcEntryTaskVar, newIdentifier)
          
        
        // part medicationRequest
        * rule[+]
          * name = "entryMedicationRequest"
          * source[+].context = "srcEntryResourceVar"
          * source[=].variable = "srcEntryBundleMRVar"
          * source[=].condition = "ofType(MedicationRequest)"
          // * source[=].logMessage = "ofType(MedicationRequest)"
          * insert targetSetStringVariable(tgtRxPrescriptionPartMR, name, medicationRequest)
          * documentation = "Erstellt den medicationRequest Parameter für Verschreibungsdetails"
          * rule[+]
            * name = "entryMedicationRequestPart"
            * source.context = "srcEntryBundleMRVar"
            * insert createType(tgtRxPrescriptionPartMR, resource, newMedicationRequest, MedicationRequest)
            * documentation = "Transformiert KBV-MedicationRequest in BfArM MedicationRequest Format"
            * rule[+]
              * name = "entryMedicationRequestPartResourceSet"
              * documentation = "Führt die detaillierte MedicationRequest-Transformation durch"
              * source.context = "srcEntryBundleMRVar"
              * insert dependent(ERPTPrescriptionStructureMapMedicationRequest, srcEntryBundleMRVar, newMedicationRequest)

        // part Medication
        * rule[+]
          * name = "entryMedicationRequestMedication"
          * source[+].context = "srcEntryVar"
          * source[=].variable = "srcMedicationRequestId"
          * source[=].condition = "resource.ofType(MedicationRequest)"
          // * source[=].logMessage = "resource.ofType(MedicationRequest)"
          * insert targetSetStringVariable(tgtRxPrescriptionPartMed, name, medication)
          * documentation = "Erstellt den medication Parameter für das verschriebene Arzneimittel"
          * rule[+]
            * name = "prepMedication"
            * documentation = "Bereitet die Suche nach der referenzierten Medication vor"
            * insert treeSource(bundle, entry, srcEntryVar2)
            * rule[+]
              * name = "entryMedicationPrescriptionMedicationPart"
              * source[+].context = "srcEntryVar2"
              * source[=].variable = "srcEntryBundleMRMedIdVar"
              * source[=].condition = "resource.ofType(Medication).where(id=%srcMedicationRequestId.resource.medicationReference.reference.replace('urn:uuid:', '').split('/').last())"
              // * source[=].logMessage = "resource.ofType(Medication).where(id=%srcMedicationRequestId.resource.medicationReference.reference.replace('urn:uuid:', '').split('/').last())"
              * insert createType(tgtRxPrescriptionPartMed, resource, newMedicationPrescriptionMedication, Medication)
              * documentation = "Findet die vom MedicationRequest referenzierte Medication und transformiert sie in BfArM Format"
              * rule[+]
                * name = "entryMedicationPrescriptionMedicationPartResourceSet"
                * documentation = "Führt die detaillierte Medication-Transformation für das verschriebene Arzneimittel durch"
                * source[+].context = "srcEntryBundleMRMedIdVar"
                * source[=].variable = "srcEntryBundleMRMedIdVarRes"
                * source[=].element = "resource"
                // * source[=].logMessage = "%srcEntryBundleMRMedIdVar"
                * insert dependent(ERPTPrescriptionStructureMapMedication, srcEntryBundleMRMedIdVarRes, newMedicationPrescriptionMedication)

  // Parameter rxDispensation
  * rule[+]
    * name = "MedicationDispenseFromBundle"
    * source.context = "bundle"
    * documentation = "Erstellt den rxDispensation Parameter mit allen Abgabeinformationen"
    * insert treeTarget(erpTCarbonCopy, parameter, tgtRxDispensation)
    * insert treeTarget(tgtRxDispensation, part, tgtRxDispensationPartOrg)
    * insert targetSetStringVariable(tgtRxDispensation, name, rxDispensation)

    * rule[+]
      * name = "bundleEntries"
      * documentation = "Verarbeitet alle Einträge des Quell-Bundles für Abgabeinformationen"
      * insert treeSource(bundle, entry, srcEntryVar)

      * rule[+]
        * name = "rxDispensationParameter"
        * documentation = "Extrahiert relevante Ressourcen für die Abgabe"
        * insert treeSource(srcEntryVar, resource, srcEntryResourceVar)

        // part Organization
        * rule[+]
          * name = "entryVZDSearchSet"
          * source[+].context = "srcEntryResourceVar"
          * source[=].variable = "srcEntryBundleOrgVar"
          * source[=].condition = "ofType(Bundle).where(entry.first().fullUrl.contains('fhir-directory'))"
          // * source[=].logMessage = "ofType(Bundle).where(entry.first().fullUrl.contains('fhir-directory'))"
          * insert targetSetStringVariable(tgtRxDispensationPartOrg, name, dispenseOrganization)
          * documentation = "Identifiziert VZD SearchSet Bundle für Apothekeninformationen"
          * rule[+]
            * name = "entryOrganizationPart"
            * source.context = "srcEntryBundleOrgVar"
            * insert createType(tgtRxDispensationPartOrg, resource, newOrganization, Organization)
            * documentation = "Transformiert VZD SearchSet in BfArM Organization Format für die abgebende Apotheke"
            * rule[+]
              * name = "entryOrganizationPartResourceSet"
              * documentation = "Führt die detaillierte Organization-Transformation durch"
              * source.context = "srcEntryBundleOrgVar"
              * insert dependent(ERPTPrescriptionStructureMapOrganization, srcEntryBundleOrgVar, newOrganization)

        // part MedicationDispense inkl. Medication
        * rule[+]
          * name = "entryMedicationDispense"
          * source[+].context = "srcEntryResourceVar"
          * source[=].variable = "srcEntryBundleMDVar"
          * source[=].condition = "ofType(MedicationDispense)"
          //* source[=].logMessage = "ofType(MedicationDispense)"
          * insert treeTarget(tgtRxDispensation, part, tgtDispenseInformationPart)
          * documentation = "Erstellt eine dispenseInformation Part pro abgegebener MedicationDispense"
          * rule[+]
            * name = "entryDispenseInformation"
            * source.context = "srcEntryBundleMDVar"
            * documentation = "Bündelt MedicationDispense und zugehörige Medication unter dispenseInformation"
            * insert targetSetStringVariable(tgtDispenseInformationPart, name, dispenseInformation)
            * insert treeTarget(tgtDispenseInformationPart, part, tgtDispenseInformationMedDispPart)
            * insert treeTarget(tgtDispenseInformationPart, part, tgtDispenseInformationMedicationPart)

            * rule[+]
              * name = "entryDispenseInformationMedicationDispense"
              * source.context = "srcEntryBundleMDVar"
              * documentation = "Transformiert gematik MedicationDispense in BfArM MedicationDispense Format"
              * insert targetSetStringVariable(tgtDispenseInformationMedDispPart, name, medicationDispense)
              * insert createType(tgtDispenseInformationMedDispPart, resource, newMedicationDispense, MedicationDispense)
              * rule[+]
                * name = "entryMedicationDispensePartResourceSet"
                * documentation = "Führt die detaillierte MedicationDispense-Transformation durch"
                * source.context = "srcEntryBundleMDVar"
                * insert dependent(ERPTPrescriptionStructureMapMedicationDispense, srcEntryBundleMDVar, newMedicationDispense)

            * rule[+]
              * name = "entryDispenseInformationMedication"
              * source.context = "srcEntryBundleMDVar"
              * documentation = "Findet die vom MedicationDispense referenzierte Medication und transformiert sie in BfArM Format"
              * insert targetSetStringVariable(tgtDispenseInformationMedicationPart, name, medication)
              * rule[+]
                * name = "prepDispenseMedication"
                * documentation = "Bereitet die Suche nach der referenzierten Medication im Bundle vor"
                * insert treeSource(bundle, entry, srcEntryVarDisp)
                * rule[+]
                  * name = "entryDispenseMedicationPart"
                  * source[+].context = "srcEntryVarDisp"
                  * source[=].variable = "srcEntryBundleMDMedIdVar"
                  * source[=].condition = "resource.ofType(Medication).where(id=%srcEntryBundleMDVar.medicationReference.reference.replace('urn:uuid:', '').split('/').last())"
                  // * source[=].logMessage = "resource.ofType(Medication).where(id=%srcEntryBundleMDVar.medicationReference.reference.replace('urn:uuid:', '').split('/').last())"
                  * insert createType(tgtDispenseInformationMedicationPart, resource, newMedicationDispensationMedication, Medication)
                  * rule[+]
                    * name = "entryMedicationDispensationMedicationPartResourceSet"
                    * documentation = "Führt die detaillierte Medication-Transformation für das abgegebene Arzneimittel durch"
                    * source[+].context = "srcEntryBundleMDMedIdVar"
                    * source[=].variable = "srcEntryBundleMDMedIdVarRes"
                    * source[=].element = "resource"
                    // * source[=].logMessage = "%srcEntryBundleMDMedIdVar"
                    * insert dependent(ERPTPrescriptionStructureMapMedication, srcEntryBundleMDMedIdVarRes, newMedicationDispensationMedication)
