CodeSystem: GEM_ERP_CS_Features
Id: GEM-ERP-CS-Features
Title: "ERP Feature CodeSystem"
Description: "Dieses CodeSystem beschreibt serverseitige Feature-Flags des E-Rezept-Fachdienstes, die keine Workflow-Typen sind. Workflow-Typ-Codes werden weiterhin in GEM_ERP_CS_FlowType gepflegt; dieses CodeSystem ergänzt diese um weitere funktionale Fahigkeiten und Betriebsmerkmale, die in CapabilityStatements als deklarierbare Features verwendet werden."
* insert CodeSystem(GEM_ERP_CS_Features)
* ^content = #complete

* #eu-prescription "EU-Feature" "Unterstützung grenzüberschreitender E-Rezept-Prozesse."
* #t-prescription-transfer "Übertragung digitaler Durchschlag" "Unterstüztung der Übertragung von digitalen Durchschlägen an den BfArM Webdienst"

//TODO: Überlegen, ob das hier auch ein externes Valueset sein sollte