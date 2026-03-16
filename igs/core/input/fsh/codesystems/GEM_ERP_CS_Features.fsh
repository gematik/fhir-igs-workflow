CodeSystem: GEM_ERP_CS_Features
Id: GEM-ERP-CS-Features
Title: "ERP Feature CodeSystem"
Description: "Dieses CodeSystem beschreibt serverseitige Feature-Flags des E-Rezept-Fachdienstes, die keine Workflow-Typen sind. Workflow-Typ-Codes werden weiterhin in GEM_ERP_CS_FlowType gepflegt; dieses CodeSystem ergänzt diese um weitere funktionale Fahigkeiten und Betriebsmerkmale, die in CapabilityStatements als deklarierbare Features verwendet werden."
* insert CodeSystem(GEM_ERP_CS_Features)
* ^content = #complete

* #eu-prescription "EU cross-border prescription support" "Unterstützung grenzüberschreitender E-Rezept-Prozesse für EU-Workflows."
* #medication-dispense-v2 "MedicationDispense V2 profile support" "Unterstützung für MedicationDispense Version 2 inklusive zugehöriger Validierungsregeln."
* #subscription "Push notification via Subscription resource" "Unterstützung für Benachrichtigungen über die FHIR-Ressource Subscription."
* #multi-prescription "Mehrfachverordnung (MVO) support" "Unterstützung für Mehrfachverordnung (MVO) inklusive workflowrelevanter Fachlogik."
