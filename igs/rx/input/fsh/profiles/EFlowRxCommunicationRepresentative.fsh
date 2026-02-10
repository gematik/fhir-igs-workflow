Profile: EFlowRxCommunicationRepresentative
Parent: Communication
Id: eflow-rx-communication-representative
Title: "GEM ERP PR Communication Representative"
Description: "Kommunikation zwischen Patient und Vertreter"
* insert Versioning

* recipient 1..1
* recipient.identifier 1..
* recipient.identifier only IdentifierKvid10

* sender.identifier 1..
* sender.identifier only IdentifierKvid10

* payload 1..1
* payload.content[x] only string
