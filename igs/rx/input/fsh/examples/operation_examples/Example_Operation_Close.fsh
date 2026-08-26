Instance: ExampleOperationCloseError
InstanceOf: TIFlowOperationOutcome
Title: "Error 400 - Beispiel für Close-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Close-Operation mit FHIR-Validierungsfehlern"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $ti-oo
  * details.coding.code = #SVC_VALIDATION_FAILED
  * details.text = "FHIR Profile Validation Failed"
  
Instance: ExampleOperationCloseProfileError
InstanceOf: TIFlowOperationOutcome
Title: "Error 400 - Beispiel für Close-Operation Fehlerantwort bei Profilprüfung MedicationDispense"
Description: "Beispiel für eine Fehlerantwort bei der Close-Operation mit Profilprüfung MedicationDispense"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $tiflow-core-oo-cs
  * details.coding.code = #TIFLOW_MEDICATION_DISPENSE_INVALID
  * details.text = "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig."

/*
Instance: ExampleCloseInputParameters
InstanceOf: GEM_ERP_PR_PAR_CloseOperation_Input 
Usage: #example
Title: "Example Close Parameters"
Description: "Beispiel der Eingabeparameter für die $close-Operation im ERP-Workflow"
* parameter[+]
  * name = "rxDispensation"
  * part[+] //TODO: Named Slices
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Dosage-tageszeit
*/

Instance: ExampleCloseOutputParameters
InstanceOf: GEM_ERP_PR_PAR_CloseOperation_Output
Usage: #example
Title: "Example Close Parameters"
Description: "Beispiel der Ausgabeparameter der $close-Operation im ERP-Workflow"
* parameter[+]
  * name = "return"
  * resource = ReceiptBundleQuittung 

/*
Instance: ExampleOperationCloseOutput
InstanceOf: TIFlowDiGAReceiptBundle
Title: "Quittungs-Bundle für abgeschlossene Rezeptabgabe"
Description: "Beispiel für ein Quittungs-Bundle nach erfolgter Abgabe einer DiGA"
Usage: #example
//* id = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
* meta.tag.display = "Receipt Bundle 'Quittung' for completed dispensation of a prescription"
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "162.000.033.491.280.78"
* type = #document
* insert DateTime(timestamp)
* entry[DocumentInformation].fullUrl = "urn:uuid:c624cf47-e235-4624-af71-0a09dc9254dc"
* entry[DocumentInformation].resource = ReceiptBundleComposition
* entry[SigningDevice].fullUrl = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* entry[SigningDevice].resource = ReceiptBundleDevice
* entry[PrescriptionDigest].fullUrl = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
* entry[PrescriptionDigest].resource = ReceiptBundleBinary
* signature.type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* signature.type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* insert DateTime(signature.when)
* signature.who.reference = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="
*/

/*
Instance: ReceiptBundleComposition
InstanceOf: TIFlowDiGAReceiptComposition
Title: "Zusammenstellung für Quittungs-Bundle"
Description: "Beispiel für eine Zusammenstellung (Composition) für ein DiGA-Quittungs-Bundle"
Usage: #inline
* id = "c624cf47-e235-4624-af71-0a09dc9254dc"
* extension[Beneficiary].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary"
* extension[Beneficiary].valueIdentifier.system = $identifier-telematik-id
* extension[Beneficiary].valueIdentifier.value = "8-SMC-B-Testkarte-883110000129070"
* status = #final
* type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#3 "Receipt"
* insert DateTime(date)
* insert DateTime(event.period.start)
* insert DateTime(event.period.end)
* author.reference = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* title = "Quittung"
* section[+].entry.reference = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
*/

/*Instance: ExampleReceiptBundle
InstanceOf: TIFlowDiGAReceiptBundle
Title: "Quittungs-Bundle für abgeschlossene Rezeptabgabe"
Description: "Beispiel für ein Quittungs-Bundle nach erfolgter Abgabe einer DiGA"
Usage: #inline
* id = "ExampleReceiptBundle"
* type = #document
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "162.000.033.491.280.78"
* insert DateTime(timestamp)
* entry[+].fullUrl = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* entry[=].resource = ReceiptBundleDevice
* entry[+].fullUrl = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
* entry[=].resource = ReceiptBundleBinary*/