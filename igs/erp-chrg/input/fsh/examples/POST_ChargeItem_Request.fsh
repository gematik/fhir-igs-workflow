Instance: Example-GEM-ERPCHRG-ChargeItem-POST-Request
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title: "PKV-Abrechnungsinformationen bereitstellen"
Description: "Apotheker stellt PKV-Abrechnungsinformationen am E-Rezept-Fachdienst bereit, inkl. Verordnungs-, Abgabedatensatz (contained Binary) und Quittung"
Usage: #example
* contained = Example-Binary
* insert ChargeItem
* supportingInformation[dispenseItemBinary] = Reference(Example-Binary)