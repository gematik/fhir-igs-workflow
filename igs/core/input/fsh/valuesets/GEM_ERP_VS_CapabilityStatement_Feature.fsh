ValueSet: GEM_ERP_VS_CapabilityStatement_Feature
Id: GEM-ERP-VS-CapabilityStatement-Feature
Title: "ERP CapabilityStatement Feature ValueSet"
Description: "Dieses ValueSet kombiniert Workflow-Typ-Codes aus GEM_ERP_CS_FlowType und nicht-workflowbezogene Feature-Codes aus GEM_ERP_CS_Features. Damit bildet es die vollständige Menge deklarierbarer Feature-Flags für CapabilityStatements des E-Rezept-Fachdienstes ab."
* insert ValueSet(GEM_ERP_VS_CapabilityStatement_Feature)
* include codes from system GEM_ERP_CS_FlowType
* include codes from system GEM_ERP_CS_Features
