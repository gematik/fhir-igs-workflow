ValueSet: GEM_ERP_VS_CapabilityStatement_Environment
Id: GEM-ERP-VS-CapabilityStatement-Environment
Title: "ERP CapabilityStatement Environment ValueSet"
Description: "Dieses ValueSet enthaelt alle zulaessigen Umgebungskennzeichen fuer CapabilityStatements des E-Rezept-Fachdienstes und wird fuer die verpflichtende Kennzeichnung der Zielumgebung verwendet."
* insert ValueSet(GEM_ERP_VS_CapabilityStatement_Environment)
* ^short = "Zulaessige Umgebungswerte fuer CapabilityStatements"
* ^definition = "Wertebereich der Extension GEM_ERP_EX_CapabilityStatement_Environment zur Kennzeichnung der Betriebsumgebung."
* ^comment = "Die Bindung ist required, damit alle CapabilityStatements konsistent dieselben Umgebungskennzeichen verwenden."
* include codes from system GEM_ERP_CS_CapabilityStatement_Environment
