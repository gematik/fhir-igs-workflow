Extension: GEM_ERP_EX_PrescriptionType
Id: GEM-ERP-EX-PrescriptionType
Title: "TI Flow Type"
Description: "Definiert den Typ eines Workflows im TIFlow."
* insert Meta
* insert LegacyERPUrl(StructureDefinition, GEM_ERP_EX_PrescriptionType)
// preserve the version of this resource
* ^version = "1.0.0"
* ^date = "2026-06-01"
* ^status = #active

* value[x] only Coding
* value[x] from GEM_ERP_VS_FlowType (required)
  * system 1..1
  * code 1..1


