Extension: GEM_ERP_EX_CapabilityStatement_Feature
Id: GEM-ERP-EX-CapabilityStatement-Feature
Title: "GEM ERP EX CapabilityStatement Feature"
Description: "Diese Compound-Extension deklariert ein einzelnes Feature eines konkreten Fachdienst-Deployments. Das Teilfeld definition verweist per Canonical auf den fachlichen Feature-Bezeichner (Workflow-Typ oder sonstiges Feature), während value den aktuellen Aktivierungszustand dieses Features am betrachteten Endpoint beschreibt."
* insert StructureDefinition(GEM_ERP_EX_CapabilityStatement_Feature)
* ^context[0].type = #element
* ^context[=].expression = "CapabilityStatement"

* . ^short = "Deklaration eines aktivierbaren CapabilityStatement-Features"
* . ^definition = "Compound-Extension mit den Teilslices definition und value zur Beschreibung eines einzelnen Features inklusive Aktivierungszustand."
* . ^comment = "Diese Extension kann auf CapabilityStatement-Ebene mehrfach wiederholt werden (0..*), um die komplette Feature-Menge eines konkreten Systems zu beschreiben."

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension ^short = "Container für die Child-Slices definition und value"
* extension ^definition = "Enthält die verpflichtenden Child-Slices für Feature-Referenz und Feature-Status."
* extension ^comment = "Nur die Slices definition und value sind zulässig."

* extension contains
    definition 1..1 MS and
    value 1..1 MS

* extension[definition] ^short = "Canonical-Referenz auf den Feature-Bezeichner"
* extension[definition] ^definition = "Verweist per valueCanonical auf ein Feature-Konzept aus GEM_ERP_CS_FlowType oder GEM_ERP_CS_Features."
* extension[definition] ^comment = "Das referenzierte Canonical identifiziert, welches Feature beschrieben wird."
* extension[definition].value[x] only canonical
* extension[definition].valueCanonical 1..1
* extension[definition].valueCanonical from GEM_ERP_VS_CapabilityStatement_Feature (required)
* extension[definition].valueCanonical ^short = "Feature-Canonical"
* extension[definition].valueCanonical ^definition = "Canonical URL eines Feature-Konzepts aus den zulässigen CodeSystemen des Feature-ValueSets."
* extension[definition].valueCanonical ^comment = "Für Workflow-Typen auf GEM_ERP_CS_FlowType, für sonstige Features auf GEM_ERP_CS_Features referenzieren."

* extension[value] ^short = "Aktivierungszustand des Features"
* extension[value] ^definition = "Beschreibt, ob das in definition referenzierte Feature in dieser Umgebung aktiv ist."
* extension[value] ^comment = "true = aktiv; false = deklariert, aber derzeit nicht aktiv."
* extension[value].value[x] only boolean
* extension[value].valueBoolean 1..1
* extension[value].valueBoolean ^short = "Feature aktiv (true/false)"
* extension[value].valueBoolean ^definition = "Boolean-Wert zur Laufzeitaktivierung des referenzierten Features."
* extension[value].valueBoolean ^comment = "Soll den effektiven Betriebszustand der referenzierten Funktionalität wiedergeben."
