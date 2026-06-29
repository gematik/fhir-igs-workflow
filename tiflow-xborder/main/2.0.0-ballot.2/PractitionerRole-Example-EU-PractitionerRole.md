# Example-EU-PractitionerRole - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

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
    "profile" : ["https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PractitionerRole"]
  },
  "practitioner" : {
    "reference" : "Practitioner/Example-EU-Practitioner"
  },
  "organization" : {
    "reference" : "Organization/Example-EU-Organization"
  }
}

```
