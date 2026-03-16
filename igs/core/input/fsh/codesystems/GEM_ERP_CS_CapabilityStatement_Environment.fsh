CodeSystem: GEM_ERP_CS_CapabilityStatement_Environment
Id: GEM-ERP-CS-CapabilityStatement-Environment
Title: "ERP CapabilityStatement Environment CodeSystem"
Description: "Dieses CodeSystem definiert standardisierte Umgebungskennzeichen fuer CapabilityStatements des E-Rezept-Fachdienstes. Es erlaubt die eindeutige Kennzeichnung, ob die beschriebene Faehigkeit fuer Produktions-, Referenz-, Test- oder Entwicklungsumgebung gilt."
* insert CodeSystem(GEM_ERP_CS_CapabilityStatement_Environment)
* ^short = "CodeSystem fuer Umgebungskennzeichen eines CapabilityStatements"
* ^definition = "Normiert zulaessige Umgebungswerte fuer die Extension GEM_ERP_EX_CapabilityStatement_Environment."
* ^comment = "Die Codes beschreiben die Zielumgebung des konkret ausgerollten Fachdienst-Endpoints."
* ^content = #complete

* #PU "Produktivumgebung" "Produktive Betriebsumgebung fuer realen Versorgungseinsatz."
* #RU "Referenzumgebung" "Referenzumgebung fuer Interoperabilitaets- und Konformitaetsabgleiche."
* #TU "Testumgebung" "Testumgebung fuer technische und fachliche Verifikation."
* #DEV "Entwicklungsumgebung" "Entwicklungsumgebung fuer Implementierung und fruehe Integrationspruefung."
