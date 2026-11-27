Extension: GEM_ERP_EX_AcceptDate
Id: GEM-ERP-EX-AcceptDate
Title: "TI Flow AcceptDate"
Description: "Frist bis zu welcher ein Rezept zu Lasten der gesetzlichen Krankenkasse eingelöst werden kann."
Context: Task

* insert Meta
* insert LegacyERPUrl(StructureDefinition, GEM_ERP_EX_AcceptDate)

* . ^short = "Belieferungsfrist der Verordnung"
* . ^definition = "Frist bis zu welcher ein Rezept zu Lasten der gesetzlichen Krankenkasse eingelöst werden kann (Frist endet zu Task.extension:acceptDate, bei Kassenrezepten 28 Tage nach Ausstellung). Danach kann die Apotheke entscheiden das Rezept als Privatrezept zu beliefern (§11, Abs 4 AM-RL)."

* value[x] only date
