Extension: EFlowRxAcceptDateExtension
Id: eflow-rx-acceptdate-extension
Title: "GEM ERP EX AcceptDate"
Description: "Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt."
* insert Meta
* . ^short = "Akzeptanzdatum der Verschreibung"
* . ^definition = "Datum, bis zu dem die Krankenkasse die Verschreibung akzeptiert."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only date
