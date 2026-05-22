# Example-EU-Organization - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example-EU-Organization**

## Example Organization: Example-EU-Organization

Profile: [Organization Information Received from the EU](StructureDefinition-GEM-ERPEU-PR-Organization.md)

**identifier**: 1234567890, EU-136ad69f

**type**: Öffentliche Apotheke

**name**: Pharmacia de Santa Maria

**address**: Rua da Alegria, 123 Lisbon Estremadura 1234-567 Portugal 



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Example-EU-Organization",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Organization"]
  },
  "identifier" : [{
    "value" : "1234567890"
  },
  {
    "value" : "EU-136ad69f"
  }],
  "type" : [{
    "coding" : [{
      "system" : "https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID",
      "code" : "1.2.276.0.76.4.54",
      "display" : "Öffentliche Apotheke"
    }]
  }],
  "name" : "Pharmacia de Santa Maria",
  "address" : [{
    "line" : ["Rua da Alegria, 123"],
    "city" : "Lisbon",
    "state" : "Estremadura",
    "postalCode" : "1234-567",
    "country" : "Portugal"
  }]
}

```
