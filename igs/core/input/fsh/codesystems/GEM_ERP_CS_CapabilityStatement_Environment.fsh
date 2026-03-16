CodeSystem: GEM_ERP_CS_CapabilityStatement_Environment
Id: GEM-ERP-CS-CapabilityStatement-Environment
Title: "ERP CapabilityStatement Environment CodeSystem"
Description: "Dieses CodeSystem definiert standardisierte Umgebungskennzeichen für CapabilityStatements des E-Rezept-Fachdienstes. Es erlaubt die eindeutige Kennzeichnung, ob die beschriebene Fähigkeit für Produktions-, Referenz-, Test- oder Entwicklungsumgebung gilt."
* insert CodeSystem(GEM_ERP_CS_CapabilityStatement_Environment)
* ^short = "CodeSystem für Umgebungskennzeichen eines CapabilityStatements"
* ^definition = "Normiert zulässige Umgebungswerte für die Extension GEM_ERP_EX_CapabilityStatement_Environment."
* ^comment = "Die Codes beschreiben die Zielumgebung des konkret ausgerollten Fachdienst-Endpoints."
* ^content = #complete

* #PU "Produktivumgebung" "Produktive Betriebsumgebung für realen Versorgungseinsatz."
* #RU "Referenzumgebung" "Referenzumgebung für Interoperabilitäts- und Konformitätsabgleiche."
* #TU "Testumgebung" "Testumgebung für technische und fachliche Verifikation."
* #DEV "Entwicklungsumgebung" "Entwicklungsumgebung für Implementierung und frühe Integrationsprüfung."
