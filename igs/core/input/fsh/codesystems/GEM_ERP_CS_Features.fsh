CodeSystem: GEM_ERP_CS_Features
Id: GEM-ERP-CS-Features
Title: "ERP Feature CodeSystem"
Description: "Dieses CodeSystem beschreibt serverseitige Feature-Flags des E-Rezept-Fachdienstes, die keine Workflow-Typen sind. Workflow-Typ-Codes werden weiterhin in GEM_ERP_CS_FlowType gepflegt; dieses CodeSystem ergänzt diese um weitere funktionale Fahigkeiten und Betriebsmerkmale, die in CapabilityStatements als deklarierbare Features verwendet werden."
* insert CodeSystem(GEM_ERP_CS_Features)
* ^short = "CodeSystem fuer nicht-workflowbezogene Feature-Flags"
* ^definition = "Enthaelt deklarierbare serverseitige Features des E-Rezept-Fachdienstes ausserhalb der Workflow-Typ-Codes."
* ^comment = "Zur vollstaendigen Feature-Deklaration in CapabilityStatements zusammen mit GEM_ERP_CS_FlowType ueber GEM_ERP_VS_CapabilityStatement_Feature verwenden."
* ^content = #complete

* #eu-prescription "EU cross-border prescription support" "Unterstuetzung grenzueberschreitender E-Rezept-Prozesse fuer EU-Workflows."
* #medication-dispense-v2 "MedicationDispense V2 profile support" "Unterstuetzung fuer MedicationDispense Version 2 inklusive zugehoeriger Validierungsregeln."
* #subscription "Push notification via Subscription resource" "Unterstuetzung fuer Benachrichtigungen ueber die FHIR-Ressource Subscription."
* #multi-prescription "Mehrfachverordnung (MVO) support" "Unterstuetzung fuer Mehrfachverordnung (MVO) inklusive workflowrelevanter Fachlogik."
