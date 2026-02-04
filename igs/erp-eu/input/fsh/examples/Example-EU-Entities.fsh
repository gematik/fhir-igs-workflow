Instance: Example-EU-Practitioner
InstanceOf: GEM_ERPEU_PR_Practitioner
Usage: #example
Title: "Example-EU-Practitioner"
Description: "Example of an EU Practitioner"
* identifier[+].value = "EU-1234567890"
* name[+].text = "Pedro Sanches"
* name[=].family = "Sanches"
* name[=].given = "Pedro"

Instance: Example-EU-Organization
InstanceOf: GEM_ERPEU_PR_Organization
Usage: #example
Title: "Example-EU-Organization"
Description: "Example of an EU Organization"
* identifier[+].value = "1234567890"
* identifier[+].value = "EU-136ad69f"
* name = "Pharmacia de Santa Maria"
* type.coding = $cs-organization-profession-oid#1.2.276.0.76.4.54 "Öffentliche Apotheke"
* address
  * line = "Rua da Alegria, 123"
  * city = "Lisbon"
  * country = "Portugal"
  * state = "Estremadura"
  * postalCode = "1234-567"

Instance: Example-EU-PractitionerRole
InstanceOf: GEM_ERPEU_PR_PractitionerRole
Usage: #example
Title: "Example-EU-PractitionerRole"
Description: "Example of an EU PractitionerRole"
* practitioner = Reference(Example-EU-Practitioner)
* organization = Reference(Example-EU-Organization)