RuleSet: ChargeItem
* status = #billable
* code = $cs-data-absent-reason#not-applicable
* insert ChargeItemIdentifier
* insert PKV_Identifier(subject.identifier)
* insert ApoTelematikID(enterer.identifier)
* insert ChargeItemExtension
* insert DateTimeStamp(enteredDate)

RuleSet: ChargeItemWithAccessCode
* insert ChargeItem
* insert AccessCode(identifier[AccessCode])

RuleSet: ChargeItemIdentifier
* identifier[PrescriptionID].value = "200.000.000.000.000.01"

RuleSet: ChargeItemExtension
* extension[markingFlag]
  * extension[insuranceProvider].valueBoolean = false
  * extension[subsidy].valueBoolean = false
  * extension[taxOffice].valueBoolean = false

Instance: ChargeItem-KBV-Bundle
InstanceOf: KBV_PR_ERP_Bundle
Usage: #inline
* id = $UUID_KBV_PR_ERP_Bundle
* insert PKV_Verordnungsdatensatz

Instance: ChargeItem-DispenseItem-Bundle
InstanceOf: DAV_PKV_PR_ERP_AbgabedatenBundle
Usage: #inline
* id = $UUID_DAV_PKV_AbgabedatenBundle
* insert PKV_Abgabedatensatz