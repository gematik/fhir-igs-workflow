Instance: Example-DiGA-Task-Ready
InstanceOf: TIFlowDiGATask
Usage: #example
Title: "DiGA Task in ready state"
Description: "Beispiel eines DiGA-Task im Status ready, der vom Kostenträger eingelöst werden kann"
* insert DiGA_Task_Ready

RuleSet: DiGA_Task_Draft
* insert DiGA_Task(draft)

RuleSet: DiGA_Task_Ready
* insert DiGA_Task(ready)
* insert GKV_Identifier(for.identifier) // Only when not draft
* insert TaskIdentifierAccessCode
* insert TaskInputReceipt(Example-Bundle-DiGA)

RuleSet: DiGA_Task(status)
* status = #{status}
* insert TaskIdentifier(162)
* insert Task162Extension
* insert TaskPerformerInsurance
* insert TaskDates

RuleSet: Task162Extension
* extension[flowType].valueCoding = $cs-flowtype#162 "Muster 16 (Digitale Gesundheitsanwendungen)"
* extension[flowType].valueCoding.display = "Flowtype für Digitale Gesundheitsanwendungen"
* insert DiGAExpiryDate(extension[acceptDate].valueDate) // Expiry, weil so festgelegt beide Daten 3 Monate
* insert DiGAExpiryDate(extension[expiryDate].valueDate)
