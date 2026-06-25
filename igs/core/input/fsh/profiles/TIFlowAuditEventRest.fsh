Profile: TIFlowAuditEventRest
Parent: AuditEvent
Id: audit-event-rest
Title: "TI Audit Event Rest"
Description: "Das AuditEvent-Profil für die Protokollierung des Zugriffs auf einen FHIR Data Service der Telematikinfrastruktur (TI)"
* insert Meta
// preserve the version of this resource
* ^version = "1.0.0"
* ^date = "2026-06-01"
* ^status = #active

* type MS
* type = AuditEventID#rest (exactly)
  * system 1..1
  * code 1..1

* subtype MS
* action MS
* outcome MS

* agent MS
* agent.type 1..1 MS
* agent.type.coding.code 1..1 MS
* agent.type.coding.system 1..1 MS
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.ordered = false
* agent contains
  user 0..1 and
  client 0..1 and
  internal 0..1
* agent[user].type.coding.code = #humanuser
* agent[user].type.coding.system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
* agent[user].who.identifier 1..1 MS
* agent[user].who.identifier.value 1..1 MS
* agent[user].who.identifier only IdentifierTelematikId or IdentifierKvid10
* agent[client].type from TIFLOWAuditEventAgentTypeVS (required)
* agent[client].type.coding.code = #110150 // Application
* agent[client].type.coding.system = $dcm
* agent[client].who.identifier 1..1 MS
* agent[client].who.identifier.value 1..1 MS
* agent[client].who.identifier only IdentifierTelematikId
* agent[internal].type.coding.code = #dataprocessor
* agent[internal].type.coding.system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
* agent[internal].name 1..1 MS 
  * ^short = "Name des FHIR Data Service" 
* agent[internal].name = "TI-Flow-Fachdienst"

* source MS
  * site 1..1 MS
  * observer only Reference(Device)
  * observer.reference 1..1

* entity 1..* MS
* entity.type 1..1 MS
* entity.type.code 1..1 MS
* entity.type.system 1..1 MS
* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity ^slicing.ordered = false
* entity contains 
  patient 1..1 and
  task 0..1 and
  service 0..1
* entity[patient].type.code = #Patient
* entity[patient].type.system = "http://terminology.hl7.org/CodeSystem/audit-entity-type"
* entity[patient].what.identifier 1..1 MS
* entity[patient].what.identifier only IdentifierKvid10
* entity[task].type.code = #Task
* entity[task].type.system = "http://terminology.hl7.org/CodeSystem/audit-entity-type"
* entity[task].what.identifier 1..1 MS
* entity[task].what.identifier only EPrescriptionId
* entity[service].type.code = #4 //Other
* entity[service].type.system = "http://terminology.hl7.org/CodeSystem/audit-entity-type"
* entity[service].name 1..1 MS
  * ^short = "Name des FHIR Data Service"
  * ^definition = "Der Name des FHIR Data Service, auf den zugegriffen wurde."  
