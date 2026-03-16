ValueSet: GEM_ERP_VS_FDConfiguration
Id: GEM-ERP-VS-FDConfiguration
Title: "ERP FDConfiguration ValueSet"
Description: "Dieses ValueSet bildet den zulässigen Wertebereich für Konfigurationskennzeichen des E-Rezept-Fachdienstes ab und inkludiert alle Codes aus GEM_ERP_CS_FDConfiguration."
* insert ValueSet(GEM_ERP_VS_FDConfiguration)
* ^short = "Wertebereich für FD-Konfigurationskennzeichen"
* ^definition = "Enthält alle Konfigurationscodes aus GEM_ERP_CS_FDConfiguration für die Verwendung in CapabilityStatement-Erweiterungen."
* ^comment = "Da das zugrunde liegende CodeSystem #not-present verwendet, kann die konkrete Codeauflistung zur Laufzeit aus externen gematik-Releaseartefakten bezogen werden."
* include codes from system GEM_ERP_CS_FDConfiguration
