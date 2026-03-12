Instance: TaskExpiryDateSP
InstanceOf: SearchParameter
Usage: #definition
* insert Meta-Instance

* id = "task-expiry-date-sp"
* url = "https://gematik.de/fhir/workflow/core/SearchParameter/task-expiry-date-sp"
* name = "TaskExpiryDateSP"
* description = "Search by Task extension expiryDate"
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
* description = "Search by Task extension acceptDate"
* status = #active
* code = #accept-date
* base[+] = #Task
* type = #date
* expression = "Task.extension('https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate').value.as(date)"
* multipleAnd = true
* multipleOr = false
