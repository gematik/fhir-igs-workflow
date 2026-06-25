Profile: TIFlowAuditEventRest
Parent: AuditEvent
Id: tiflow-audit-event-rest
Title: "TI-Flow Audit Event"
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
  human 0..1 and
  server 0..1
* agent[human].type.coding.code = #humanuser
* agent[human].type.coding.system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
* agent[human].who.identifier 1..1 MS
* agent[human].who.identifier.value 1..1 MS
* agent[human].who.identifier only IdentifierTelematikId or IdentifierKvid10
* agent[server].type.coding.code = #dataprocessor
* agent[server].type.coding.system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
* agent[server].who.identifier 1..1 MS
* agent[server].who.identifier.value 1..1 MS
* agent[server].who.identifier.value = "server" (exactly)
* agent[server].name 1..1 MS 
  * ^short = "Name des FHIR Data Service" 

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
