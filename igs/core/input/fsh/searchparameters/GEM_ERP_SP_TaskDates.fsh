Instance: TaskExpiryDateSP
InstanceOf: SearchParameter
Usage: #definition
* insert Meta-Instance

* id = "task-expiry-date-sp"
* url = "https://gematik.de/fhir/workflow/core/SearchParameter/task-expiry-date-sp"
* name = "TaskExpiryDateSP"
* description = "Das Ablaufdatum eines E-Rezepzes. Nach ablauf dieses Datums darf ein E-Rezept nicht mehr beliefert werden."
* status = #active
* code = #expiry-date
* base[+] = #Task
* type = #date
* expression = "Task.extension('https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate').value.as(date)"
* multipleAnd = true
* multipleOr = false

Instance: TaskAcceptDateSP
InstanceOf: SearchParameter
Usage: #definition
* insert Meta-Instance

* id = "task-accept-date-sp"
* url = "https://gematik.de/fhir/workflow/core/SearchParameter/task-accept-date-sp"
* name = "TaskAcceptDateSP"
* description = "Das Einlösedatum eines E-Rezeptes. Nach Ablaufen dieses Datums darf ein E-Rezept nicht mehr zu Lasten des Kostenträgers abgegeben werden."
* status = #active
* code = #accept-date
* base[+] = #Task
* type = #date
* expression = "Task.extension('https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate').value.as(date)"
* multipleAnd = true
* multipleOr = false
