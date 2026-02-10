Extension: EFlowRxBeneficiaryExtension
Id: eflow-rx-beneficiary-extension
Title: "GEM ERP EX Beneficiary"
Description: "Der Begünstigte (z. B. Apotheke) des E-Rezept-Beleg, der erstellt wird, wenn der E-Rezept-Workflow abgeschlossen ist."
* insert Versioning
* ^context.type = #element
* ^context.expression = "Composition"
* . ^short = "The beneficiary of the receipt"
* value[x] only IdentifierTelematikId
