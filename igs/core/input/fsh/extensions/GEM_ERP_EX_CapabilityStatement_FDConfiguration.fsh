Extension: GEM_ERP_EX_CapabilityStatement_FDConfiguration
Id: GEM-ERP-EX-CapabilityStatement-FDConfiguration
Title: "GEM ERP EX CapabilityStatement FDConfiguration"
Description: "Diese Extension deklariert eine konkrete Konfigurationsausprägung des E-Rezept-Fachdienstes auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert und bevorzugt gegen GEM_ERP_VS_FDConfiguration geprüft."
* insert StructureDefinition(GEM_ERP_EX_CapabilityStatement_FDConfiguration)
* ^context[0].type = #element
* ^context[=].expression = "CapabilityStatement"

* . ^short = "Konfigurationskennzeichen für den Fachdienst"
* . ^definition = "Beschreibt eine konkrete FD-Konfiguration als Code im Kontext eines CapabilityStatements."
* . ^comment = "Die Codebedeutung wird über externe gematik-Releaseartefakte gepflegt." //TODO: Festlegen wo das veröffentlicht wird

* value[x] only code
* valueCode 1..1
* valueCode from GEM_ERP_VS_FDConfiguration (preferred)
* valueCode ^short = "FD-Konfigurationscode"
* valueCode ^definition = "Code für eine Fachdienstkonfiguration aus dem extern gepflegten FDConfiguration-CodeSystem."
* valueCode ^comment = "Preferred-Bindung erlaubt kontrollierte Erweiterung und rückwärtskompatible Verarbeitung bei neu eingeführten Codes."
