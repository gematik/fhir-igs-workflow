Instance: Communication_Reply_DiGA
InstanceOf: GEM_ERP_PR_Communication_DiGA
Title: "DiGA-Nachricht eines Kostentraegers an den Patienten"
Description: "Beispiel fuer eine DiGA-bezogene Nachricht, die vom Kostentraeger an den Patienten gesendet wird"
Usage: #example
* id = "140f716f-f649-44fe-9a4e-157eb3c8adf3"
* basedOn.reference = "Task/162.000.000.000.000.01"
* status = #unknown
* sender.identifier.system = $identifier-telematik-id
* sender.identifier.value = "8-SMC-B-Testkarte-783498105628375"
* recipient.identifier.system = $identifier-kvid-10
* recipient.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
* payload.contentString = "Nachrichteninhalt fuer den Versicherten"
