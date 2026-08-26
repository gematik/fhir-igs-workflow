
Instance: ReceiptBundleBinary
InstanceOf: GEM_ERP_PR_Digest
Title: "Quittungs-Hash Binärdaten"
Description: "Binäre Digest-Daten für ein E-Rezept-Quittungs-Bundle"
Usage: #example
* id = "b939a82a-9c23-4b6d-a139-f468d1b9d652"
* contentType = #application/octet-stream
* data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="

Instance: Bundle-AcceptOperation
InstanceOf: GEM_ERP_PR_Bundle_OP_Accept
Usage: #example
Title: "Beispiel Accept-Bundle"
Description: "Dieses Bundle enthält den Task und das qualifiziert signierte E-Rezept für die Accept-Operation"
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/160.000.033.491.280.78/$accept/"
* entry[task].resource = TaskIn-ProgressState
* entry[task].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e"
* entry[binary].resource = PrescriptionBinaryWithMeta
* entry[binary].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Binary/PrescriptionBinaryWithMeta"

Instance: ExampleAcceptResponseBundle
InstanceOf: GEM_ERP_PR_Bundle_OP_Accept
Usage: #example
Title: "Beispielantwort fuer die $accept-Operation"
Description: "Bundle-Antwort der $accept-Operation mit Task und qualifiziert signiertem E-Rezept"
* id = "ExampleAcceptResponseBundle"
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/160.000.033.491.280.78/$accept/"
* entry[task].resource = TaskIn-ProgressState
* entry[task].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e"
* entry[binary].resource = PrescriptionBinaryWithMeta
* entry[binary].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Binary/PrescriptionBinaryWithMeta"

Instance: ExampleERPBundle
InstanceOf: Bundle
Usage: #example
Title: "E-Rezept-Verordnungs-Bundle (unvollständig)"
Description: "Unvollständiges Beispiel eines E-Rezept-Bundles nach KBV_PR_EVDGA_Bundle"
* meta.tag.display = "Unvollständiges Beispiel eines E-Rezept-Bundles - https://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle|1.2"
* id = "ExampleERPBundle"
* identifier.system = $prescription-id-ns
* identifier.value = "160.000.000.000.000.01"
* type = #document
* insert DateTimeStamp(timestamp)
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Composition/c624cf47-e235-4624-af71-0a09dc9254dc"
* entry[=].resource = ReceiptBundleComposition
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Device/ReceiptBundleDevice"
* entry[=].resource = ReceiptBundleDevice
* entry[+].fullUrl = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
* entry[=].resource = ReceiptBundleBinary

Instance: ExampleMedicationDispenseSearchResponse
InstanceOf: Bundle
Usage: #example
* type = #searchset
* insert DateTimeStamp(timestamp)
* total = 0
* link.relation = "self"
* link.url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/MedicationDispense?identifier=160.000.000.000.000.01"
* entry[0].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/MedicationDispense/Example-MedicationDispense"
* entry[=].resource = Example-MedicationDispense
* entry[=].search.mode = #match
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Medication/SumatripanMedication"
* entry[=].resource = SumatripanMedication
* entry[=].search.mode = #include