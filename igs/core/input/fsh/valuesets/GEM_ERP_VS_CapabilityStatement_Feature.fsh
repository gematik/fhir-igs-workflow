ValueSet: GEM_ERP_VS_CapabilityStatement_Feature
Id: GEM-ERP-VS-CapabilityStatement-Feature
Title: "ERP CapabilityStatement Feature ValueSet"
Description: "Dieses ValueSet kombiniert Workflow-Typ-Codes aus GEM_ERP_CS_FlowType und nicht-workflowbezogene Feature-Codes aus GEM_ERP_CS_Features. Damit bildet es die vollständige Menge deklarierbarer Feature-Flags für CapabilityStatements des E-Rezept-Fachdienstes ab."
* insert ValueSet(GEM_ERP_VS_CapabilityStatement_Feature)
* ^short = "Kombinierte Feature-Code-Menge für CapabilityStatement-Features"
* ^definition = "Enthält alle zulässigen Codes für die Definition deklarierter Features im Extension-Muster GEM_ERP_EX_CapabilityStatement_Feature."
* ^comment = "Enthält bewusst sowohl Workflow-Typ-Codes als auch weitere technische/funktionale Feature-Codes."
* include codes from system https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType
* include codes from system GEM_ERP_CS_Features
