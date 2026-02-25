Instance: ChargeItem-GET-Completed
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title:   "ChargeItem with Bundles completed by Fachdienst"
Usage: #example
* extension[markingFlag].extension[insuranceProvider].valueBoolean = false
* extension[markingFlag].extension[subsidy].valueBoolean = false
* extension[markingFlag].extension[taxOffice].valueBoolean = false
* identifier[PrescriptionID].value = "200.000.000.000.000.01"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #billable
* code = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "P987654321"
* enterer.identifier.system = $identifier-telematik-id
* enterer.identifier.value = "3-2-APO-XanthippeVeilchenblau01"
* insert DateTimeStamp(enteredDate)
* supportingInformation[dispenseItemBundle] = Reference(Bundle/72bd741c-7ad8-41d8-97c3-9aabbdd0f5b4)
* supportingInformation[receiptBundle] = Reference(Bundle/200.000.000.000.000.01)
* supportingInformation[prescriptionItemBundle] = Reference(Bundle/0428d416-149e-48a4-977c-394887b3d85c)

Instance: ChargeItem-POST-Binary
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title:   "ChargeItem with contained Binary to Fachdienst"
Usage: #example
* contained[+] = DispenseItemBinaryExample
* identifier[PrescriptionID].system = $GEM_ERP_NS_PrescriptionId
* identifier[PrescriptionID].value = "200.000.000.000.000.01"
* identifier[AccessCode].system = $GEM_ERP_NS_AccessCode
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #billable
* code = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "P987654321"
* enterer.identifier.system = $identifier-telematik-id
* enterer.identifier.value = "3-2-APO-XanthippeVeilchenblau01"
* insert DateTimeStamp(enteredDate)
* supportingInformation[dispenseItemBinary].reference = "#c8720f99-6641-432d-94be-d49eaa164755"
* supportingInformation[dispenseItemBinary].display = "Binary"
