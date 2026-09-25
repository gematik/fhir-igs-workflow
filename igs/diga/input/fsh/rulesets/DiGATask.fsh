Instance: Example-DiGA-Task-Ready
InstanceOf: TIFlowDiGATask
Usage: #example
Title: "DiGA Task in ready state"
Description: "Beispiel eines DiGA-Task im Status ready, der vom Kostenträger eingelöst werden kann"
* insert DiGA_Task_Ready

RuleSet: DiGA_Task(status)
* status = #{status}
* insert Task162Extension
* extension[flowType].valueCoding.display = "Flowtype für Digitale Gesundheitsanwendungen"
* insert TaskIdentifier(162)
* insert TaskMiscInfo
* performerType = $GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.59 "Kostenträger"
* performerType.text = "Kostenträger"

RuleSet: DiGA_Task_Draft
* insert DiGA_Task(draft)

RuleSet: DiGA_Task_Ready
* insert DiGA_Task(ready)
* insert GKV_Identifier(for.identifier) // Only when not draft
* insert TaskIdentifierAccessCode
* insert TaskInputReceipt(Example-Bundle-DiGA)
// TODO: Bug im E-Rezept-Fachdienst
* input[patientReceipt].type = $GEM_ERP_CS_DocumentType#2
* input[patientReceipt].valueReference.reference = "Bundle/Example-Bundle-DiGA"


