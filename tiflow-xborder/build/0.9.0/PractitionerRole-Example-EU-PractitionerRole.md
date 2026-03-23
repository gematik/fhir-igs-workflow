# Example-EU-PractitionerRole - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example-EU-PractitionerRole**

## Example PractitionerRole: Example-EU-PractitionerRole

Profile: [PractitionerRole Information Received from the EU](StructureDefinition-GEM-ERPEU-PR-PractitionerRole.md)

**practitioner**: [Practitioner Pedro Sanches](Practitioner-Example-EU-Practitioner.md)

**organization**: [Organization Pharmacia de Santa Maria](Organization-Example-EU-Organization.md)



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "Example-EU-PractitionerRole",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PractitionerRole"]
  },
  "practitioner" : {
    "reference" : "Practitioner/Example-EU-Practitioner"
  },
  "organization" : {
    "reference" : "Organization/Example-EU-Organization"
  }
}

```
