Profile: TIFlowCapabilityStatement
Parent: TICapabilityStatement
Id: ti-flow-capability-statement
Title: "Capability Statement Profil für den TI-Flow-Fachdienst"
Description: "Dieses Profil beschreibt die Fähigkeiten des TI-Flow-Fachdienst."
* insert Meta

// preserve the version of this resource
* ^version = "2.0.0"
* ^date = "2028-04-01"
* ^status = #active

* extension contains 
  TIEnvironment named environment 0..1 and
  TIFHIRConfiguration named fhirConfiguration 0..1 and
  TIFeature named feature 0..*
