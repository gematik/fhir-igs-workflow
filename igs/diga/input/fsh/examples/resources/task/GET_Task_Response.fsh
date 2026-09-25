Instance: Example-GET-Task-Response-Searchset
InstanceOf: Bundle
Usage: #example
Title: "Task searchset response for DiGA"
Description: "Example response for GET /Task in DiGA workflow"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task?status=ready&_count=1"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-Ready"
* entry[=].resource = Example-DiGA-Task-Ready
* entry[=].search.mode = #match
* entry[+].fullUrl = "https://erp-ref.example.org/Bundle/Example-Bundle-DiGA"
* entry[=].resource = Example-Bundle-DiGA


Instance: Example-GET-Task-Response
InstanceOf: TIFlowDiGATask
Title: "Success 200 - Example Actiåvate operation success response"
Description: "Beispiel einer erfolgreichen Antwort der $activate-Operation"
Usage: #example
* insert DiGA_Task_Ready