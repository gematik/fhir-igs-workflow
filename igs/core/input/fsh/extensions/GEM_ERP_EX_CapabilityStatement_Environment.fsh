Extension: GEM_ERP_EX_CapabilityStatement_Environment
Id: GEM-ERP-EX-CapabilityStatement-Environment
Title: "GEM ERP EX CapabilityStatement Environment"
Description: "Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren."
* insert StructureDefinition(GEM_ERP_EX_CapabilityStatement_Environment)
* ^context[0].type = #element
* ^context[=].expression = "CapabilityStatement"

* . ^short = "Umgebungskennzeichen für ein CapabilityStatement"
* . ^definition = "Kennzeichnet die Betriebsumgebung, für die die in diesem CapabilityStatement beschriebenen Fähigkeiten gelten."
* . ^comment = "Empfohlen für jede Server-Instanz, damit die Fähigkeitsdeklaration eindeutig einer Umgebung zugeordnet werden kann."

* value[x] only code
* valueCode 1..1
* valueCode from GEM_ERP_VS_CapabilityStatement_Environment (required)
* valueCode ^short = "Code der Zielumgebung"
* valueCode ^definition = "Umgebungscode gemäß GEM_ERP_CS_CapabilityStatement_Environment (PU, RU, TU, DEV)."
* valueCode ^comment = "Der Code beschreibt die Umgebung des konkreten Endpoints, nicht die generische Spezifikation."
