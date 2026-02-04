Mapping: GEM_ERPEU_MAP_Dispense_Data_Practitioner
Source: GEM_ERPEU_LOG_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPEU_PR_Practitioner"
Id: GEM-ERPEU-MAP-EU-Data-Practitioner
Title: "Mapping for EU DispenseData to EU-Practitioner"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-Practitioner"
* HealthCareProfessionalData -> "GEM_ERPEU_PR_Practitioner"
  * HPIdentifier -> "Practitioner.identifier"
  * GivenName -> "Practitioner.name.given"
  * FamilyNameSurname -> "Practitioner.family"