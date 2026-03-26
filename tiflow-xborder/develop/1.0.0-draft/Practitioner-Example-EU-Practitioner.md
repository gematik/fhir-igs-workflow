# Example-EU-Practitioner - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example-EU-Practitioner**

## Example Practitioner: Example-EU-Practitioner

Profile: [Practitioner Information Received from the EU](StructureDefinition-GEM-ERPEU-PR-Practitioner.md)

**identifier**: EU-1234567890

**name**: Pedro Sanches



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "Example-EU-Practitioner",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Practitioner"]
  },
  "identifier" : [{
    "value" : "EU-1234567890"
  }],
  "name" : [{
    "text" : "Pedro Sanches",
    "family" : "Sanches",
    "given" : ["Pedro"]
  }]
}

```
