Profile: TIFlowCapabilityStatement
Parent: TICapabilityStatement
Id: tiflow-capability-statement
Title: "TI Flow Capability Statement"
Description: "Dieses Profil beschreibt die Fähigkeiten des TI-Flow-Fachdienstes und definiert die verwendeten CapabilityStatement-Erweiterungen inklusive benannter Slices für Basis-URL, Header, Response-Informationen sowie ERP-spezifische Feature- und Konfigurationskennzeichen."
* insert Meta

* contact 1..1
* version 1..1
  * ^short = "Die Version des TI-Flow-Fachdienst"

* format
  * ^short = "Die von der API unterstützten Medientypen, z.B. application/json oder application/fhir+json"

* extension contains
  GEM_ERP_EX_CapabilityStatement_Environment named environment 0..1 and
  GEM_ERP_EX_CapabilityStatement_FDConfiguration named fhirConfiguration 0..* and
  GEM_ERP_EX_CapabilityStatement_Feature named capabilityFeature 0..*
