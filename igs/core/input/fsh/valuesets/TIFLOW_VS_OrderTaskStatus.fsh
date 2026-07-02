ValueSet: TIFlowOrderTaskStatusVS
Id: tiflow-order-task-status-vs
Title: "TIFlow Order Task ValueSet"
Description: "TIFlow Order Task ValueSet"
* insert Meta-VS
* ^status = #draft

* $hl7-task-status-cs|4.0.1#draft
* $hl7-task-status-cs|4.0.1#ready
* $hl7-task-status-cs|4.0.1#on-hold
* $hl7-task-status-cs|4.0.1#in-progress
* $hl7-task-status-cs|4.0.1#completed
* $hl7-task-status-cs|4.0.1#cancelled
