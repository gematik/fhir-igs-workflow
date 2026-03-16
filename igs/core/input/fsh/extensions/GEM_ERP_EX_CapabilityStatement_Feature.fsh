Extension: GEM_ERP_EX_CapabilityStatement_Feature
Id: GEM-ERP-EX-CapabilityStatement-Feature
Title: "GEM ERP EX CapabilityStatement Feature"
Description: "Diese Compound-Extension deklariert ein einzelnes Feature eines konkreten Fachdienst-Deployments. Das Teilfeld definition verweist per Canonical auf den fachlichen Feature-Bezeichner (Workflow-Typ oder sonstiges Feature), während value den aktuellen Aktivierungszustand dieses Features am betrachteten Endpoint beschreibt."
* insert StructureDefinition(GEM_ERP_EX_CapabilityStatement_Feature)
* ^context[0].type = #element
* ^context[=].expression = "CapabilityStatement"

* . ^short = "Deklaration eines aktivierbaren CapabilityStatement-Features"
* . ^definition = "Compound-Extension mit den Teilslices coding und value zur Beschreibung eines einzelnen Features inklusive Aktivierungszustand."
* . ^comment = "Diese Extension kann auf CapabilityStatement-Ebene mehrfach wiederholt werden (0..*), um die komplette Feature-Menge eines konkreten Systems zu beschreiben."

* extension
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #closed
  * ^short = "Container für die Child-Slices coding und value"
  * ^definition = "Enthält die verpflichtenden Child-Slices für Feature-Code und Feature-Status."
  * ^comment = "Nur die Slices coding und value sind zulässig."

* extension contains
    coding 1..1 MS and
    value 1..1 MS

* extension[coding]
  * ^short = "Coding des Feature-Bezeichners"
  * ^definition = "Verweist per valueCoding auf ein Feature-Konzept aus GEM_ERP_CS_FlowType oder GEM_ERP_CS_Features."
  * ^comment = "Das Coding identifiziert, welches Feature beschrieben wird."
  * value[x] only Coding
  * valueCoding from GEM_ERP_VS_CapabilityStatement_Feature (required)
  * valueCoding 1..1
    * ^short = "Feature-Coding"
    * ^definition = "Coding eines Feature-Konzepts aus den zulässigen CodeSystemen des Feature-ValueSets."
    * ^comment = "Für Workflow-Typen auf GEM_ERP_CS_FlowType, für sonstige Features auf GEM_ERP_CS_Features referenzieren."
    * system 1..1
      * ^short = "CodeSystem des Features"
      * ^definition = "Referenziert das verwendete Feature-CodeSystem, z. B. GEM_ERP_CS_FlowType oder GEM_ERP_CS_Features."
    * code 1..1
      * ^short = "Feature-Code"
      * ^definition = "Konkreter Feature-Code innerhalb des gewählten CodeSystems."

* extension[value]
  * ^short = "Aktivierungszustand des Features"
  * ^definition = "Beschreibt, ob das in definition referenzierte Feature in dieser Umgebung aktiv ist."
  * ^comment = "true = aktiv; false = deklariert, aber derzeit nicht aktiv."
  * value[x] only boolean
  * valueBoolean 1..1
    * ^short = "Feature aktiv (true/false)"
    * ^definition = "Boolean-Wert zur Laufzeitaktivierung des referenzierten Features."
    * ^comment = "Soll den effektiven Betriebszustand der referenzierten Funktionalität wiedergeben."
