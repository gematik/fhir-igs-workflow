Instance: VZD-SearchSet-Bundle
InstanceOf: Bundle
Usage: #example
Title: "Beispiel VZD SearchSet Bundle"
Description: "Beispiel für eine Response des FHIR-VZD nach einer Suchanfrage zu Name, Telefonnummer und Adresse einer Apotheke via Telematik-ID"
* meta.lastUpdated = "2025-06-19T08:42:40.732+02:00"
* type = #searchset
* total = 3
* entry[0].fullUrl = "https://fhir-directory-ref.vzd.ti-dienste.de/search/HealthcareService/a4f1b52e-c5de-47eb-874c-990c2b39bb77"
* entry[=].resource = a4f1b52e-c5de-47eb-874c-990c2b39bb77
* entry[=].search.mode = #match
* entry[+].fullUrl = "https://fhir-directory-ref.vzd.ti-dienste.de/search/Organization/4f5a9754-2a9d-486d-9eec-a5c6b5f95016"
* entry[=].resource = 4f5a9754-2a9d-486d-9eec-a5c6b5f95016
* entry[=].search.mode = #include
* entry[+].fullUrl = "https://fhir-directory-ref.vzd.ti-dienste.de/search/Location/9514f96e-897d-492d-950f-aea11d6f2bb4"
* entry[=].resource = 9514f96e-897d-492d-950f-aea11d6f2bb4
* entry[=].search.mode = #include

Instance: a4f1b52e-c5de-47eb-874c-990c2b39bb77
InstanceOf: HealthcareService
Usage: #inline
* meta.versionId = "2"
* meta.lastUpdated = "2024-03-27T17:49:37.898+01:00"
* meta.tag[+]
  * system = "https://gematik.de/fhir/directory/CodeSystem/Origin"
  * code = #owner
* meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/HealthcareService"
* meta.profile[+] = "https://gematik.de/fhir/directory/StructureDefinition/HealthcareServiceDirectory"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1b9b1767-5496-4c20-bfc1-32ad6d96adbc"
* providedBy = Reference(4f5a9754-2a9d-486d-9eec-a5c6b5f95016)
* location = Reference(9514f96e-897d-492d-950f-aea11d6f2bb4)
* endpoint = Reference(Endpoint/11d91987-d31e-468f-962e-845bb0c743c3)
* telecom.system = #phone
* telecom.use = #work
* telecom.value = "1234"

Instance: 4f5a9754-2a9d-486d-9eec-a5c6b5f95016
InstanceOf: Organization
Usage: #inline
* meta.versionId = "1"
* meta.lastUpdated = "2023-03-23T14:14:28.492+01:00"
* meta.tag[+]
  * system = "https://gematik.de/fhir/directory/CodeSystem/Origin"
  * code = #owner
* meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/Organization"
* meta.profile[+] = "https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "44bb2f53-cdd7-4098-9d52-a6c5ac0ddc8d"
* identifier[+].type = $v2-0203#PRN
* identifier[=].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[=].value = "3-Test-APO000053"
* active = true
* type = $OrganizationProfessionOID#1.2.276.0.76.4.54 "Öffentliche Apotheke"
* name = "Organisation 3-Test-APO000053"
* alias = "Organisation 3-Test-APO000053"

Instance: 9514f96e-897d-492d-950f-aea11d6f2bb4
InstanceOf: Location
Usage: #inline
* meta.versionId = "1"
* meta.lastUpdated = "2023-03-23T14:14:28.492+01:00"
* meta.tag[+]
  * system = "https://gematik.de/fhir/directory/CodeSystem/Origin"
  * code = #owner
* meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/Location"
* meta.profile[+] = "https://gematik.de/fhir/directory/StructureDefinition/LocationDirectory"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "995d8a48-f7fc-4ffb-a676-feb18c7c052c"
* name = "Location of Organisation 1-2arvtst-ap000053"
* address.use = #work
* address.type = #postal
* address.text = "Schwarzwaldstr. 18&#13;&#10;63762&#13;&#10;Großostheim&#13;&#10;Bayern&#13;&#10;DE"
* address.line = "Schwarzwaldstr. 18"
* address.city = "Großostheim"
* address.state = "Bayern"
* address.postalCode = "63762"
* address.country = "DE"