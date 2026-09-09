Instance: Example-GEM-ERPCHRG-ChargeItem-Complete
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title: "ChargeItem mit vollständigen Abrechnungsdaten"
Description: "Beispiel-ChargeItem des E-Rezept-Fachdienstes mit Referenzen auf Verordnungs- und Abgabedatensatz (contained) sowie Quittung"
Usage: #example
* insert ChargeItemComplete

RuleSet: ChargeItemComplete
* insert ChargeItem
* contained[+] = Example-DAV-PKV-AbgabedatenBundle
* contained[+] = Example-GEM-ERP-Bundle
* supportingInformation[prescriptionItemBundle] = Reference($URN_KBV_PR_ERP_Bundle)
* supportingInformation[dispenseItemBundle] = Reference(Example-DAV-PKV-AbgabedatenBundle)
* supportingInformation[receiptBundle] = Reference(Example-GEM-ERP-Bundle)

RuleSet: ChargeItemCompleteWithAccessCode
* insert ChargeItemComplete
* insert AccessCode(identifier[AccessCode])

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