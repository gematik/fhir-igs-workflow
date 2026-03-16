Profile: GEM_ERP_PR_CapabilityStatement
Parent: TICapabilityStatement
Id: GEM-ERP-PR-CapabilityStatement
Title: "GEM ERP PR CapabilityStatement"
Description: "Dieses Profil beschreibt die Fähigkeiten des E-Rezept-Fachdienstes und definiert die verwendeten CapabilityStatement-Erweiterungen inklusive benannter Slices für Basis-URL, Header, Response-Informationen sowie ERP-spezifische Feature- und Konfigurationskennzeichen."
* insert Profile(GEM_ERP_PR_CapabilityStatement)
* insert Meta

// preserve the version of this resource
* ^version = "1.1.1"
* ^date = "2026-03-16"
* ^status = #active

* contact 1..1
* version 1..1
  * ^short = "Die Version der API"

* format
  * ^short = "Die von der API unterstützten Medientypen, z.B. application/json oder application/fhir+json"

* extension contains
  BaseUrl named baseUrl 0..1 and
  HTTPHeader named header 0..* and
  HttpResponseInfo named responseInfo 0..* and
  GEM_ERP_EX_CapabilityStatement_Environment named environment 0..1 and
  GEM_ERP_EX_CapabilityStatement_FDConfiguration named fhirConfiguration 0..* and
  GEM_ERP_EX_CapabilityStatement_Feature named capabilityFeature 0..*

* rest.resource.interaction.extension contains
  HTTPHeader named header 0..* and
  HttpResponseInfo named responseInfo 0..*

* rest.resource.operation.extension contains
  HTTPHeader named header 0..* and
  HttpResponseInfo named responseInfo 0..* and
  HttpMethod named method 0..2

* rest.operation.extension contains
  HTTPHeader named header 0..* and
  HttpResponseInfo named responseInfo 0..* and
  HttpMethod named method 0..2
