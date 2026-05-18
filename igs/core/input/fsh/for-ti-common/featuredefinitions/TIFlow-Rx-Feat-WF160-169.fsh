Logical: TIFlowFeatureWF160
Id: ti-flow-feature-wf160
Parent: TIFeatureDefinition
Title: "Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel"
Description: "Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln"
* insert Meta

* url = "https://gematik.de/fhir/tiflow/FeatureDefinition/WF160"

* status = #active

* description = """
Dieses Feature deklariert, ob der TI-Flow-Fachdienst den `Flowtype für Apothekenpflichtige Arzneimittel` unterstützt und aktuell aktiv ist.

**Wert `true`**: Der Flowtype ist aktiviert, alle Operationen und Abfragen nach Spezifikation sind erlaubt und dürfen durchgeführt werden.

**Wert `false`**: Die Operation $create gestattet keine Erstellung von Tasks des betreffenden Flowtypes
Alle FHIR-Operationen auf dem RessourceType "Task" des betreffenden Flowtypes werden mit dem entsprechendem Fehler abgebrochen
Alle FHIR-Operationen auf System Ebene, durch eine andere oid als "oid_versicherter", die Informationen zu einem Task des betreffenden Flowtypes herausgeben oder manipulieren werden mit entsprechendem Fehler abgebrochen
Der Aufruf GET /Task auf Tasks des betreffenden Flowtypes durch eine andere oid als "oid_versicherter" wird mit entsprechendem Fehler abgebrochen
"""

// Typ des value-Felds in der feature-Extension — hier boolean
* valueType = #boolean

Logical: TIFlowFeatureWF169
Id: ti-flow-feature-wf169
Parent: TIFeatureDefinition
Title: "Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer"
Description: "Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln mit Steuerung durch den Leistungserbringer"
* insert Meta

* url = "https://gematik.de/fhir/tiflow/FeatureDefinition/WF169"

* status = #active

* description = """
Dieses Feature deklariert, ob der TI-Flow-Fachdienst den `Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer` unterstützt und aktuell aktiv ist.

**Wert `true`**: Der Flowtype ist aktiviert, alle Operationen und Abfragen nach Spezifikation sind erlaubt und dürfen durchgeführt werden.

**Wert `false`**: Die Operation $create gestattet keine Erstellung von Tasks des betreffenden Flowtypes
Alle FHIR-Operationen auf dem RessourceType "Task" des betreffenden Flowtypes werden mit dem entsprechendem Fehler abgebrochen
Alle FHIR-Operationen auf System Ebene, durch eine andere oid als "oid_versicherter", die Informationen zu einem Task des betreffenden Flowtypes herausgeben oder manipulieren werden mit entsprechendem Fehler abgebrochen
Der Aufruf GET /Task auf Tasks des betreffenden Flowtypes durch eine andere oid als "oid_versicherter" wird mit entsprechendem Fehler abgebrochen
"""

// Typ des value-Felds in der feature-Extension — hier boolean
* valueType = #boolean
