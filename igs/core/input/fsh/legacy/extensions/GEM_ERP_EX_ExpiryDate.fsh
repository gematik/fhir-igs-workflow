Extension: GEM_ERP_EX_ExpiryDate
Id: GEM-ERP-EX-ExpiryDate
Title: "TI Flow ExpiryDate"
Description: "Frist bis zu welcher die Verordnung beliefert werden darf." 
Context: Task

* insert Meta
* insert LegacyERPUrl(StructureDefinition, GEM_ERP_EX_ExpiryDate)
* . ^short = "Einlösefrist der Verordnung"
* . ^definition = "Frist bis zu welcher ein Rezept beliefert werden darf (Frist endet zu Task.extension:expiryDate, bei Kassenrezepten 3 Monate nach Ausstellung). Danach darf ein Rezept nicht mehr von der Apotheke beliefert werden (§2, Abs. 5 AMVV)."
* value[x] only date
