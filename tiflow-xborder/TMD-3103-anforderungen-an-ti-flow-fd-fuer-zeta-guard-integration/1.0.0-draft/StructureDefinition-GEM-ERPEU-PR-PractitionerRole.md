# PractitionerRole Information Received from the EU - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **PractitionerRole Information Received from the EU**

## Resource Profile: PractitionerRole Information Received from the EU 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PractitionerRole | *Version*:1.0.0-draft |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_PractitionerRole |

 
This PractitionerRole Profile is sent by the NCPeH when redeeming a Prescription in the EU 

**Usages:**

* Use this Profile: [GEM ERP PR EU CloseOperation Input](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.md)
* Refer to this Profile: [Dispensation of the Prescription from the EU](StructureDefinition-GEM-ERPEU-PR-MedicationDispense.md)
* Examples for this Profile: [PractitionerRole/Example-EU-PractitionerRole](PractitionerRole-Example-EU-PractitionerRole.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.xborder|current/StructureDefinition/GEM-ERPEU-PR-PractitionerRole)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-PractitionerRole.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-PractitionerRole.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-PractitionerRole.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-PractitionerRole",
  "url" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PractitionerRole",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERPEU_PR_PractitionerRole",
  "title" : "PractitionerRole Information Received from the EU",
  "status" : "active",
  "date" : "2026-01-08",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    },
    {
      "system" : "email",
      "value" : "erp-umsetzung@gematik.de"
    }]
  }],
  "description" : "This PractitionerRole Profile is sent by the NCPeH when redeeming a Prescription in the EU",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "PractitionerRole",
  "baseDefinition" : "https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner-role",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "PractitionerRole.practitioner",
      "path" : "PractitionerRole.practitioner",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Practitioner"]
      }]
    },
    {
      "id" : "PractitionerRole.organization",
      "path" : "PractitionerRole.organization",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Organization"]
      }]
    }]
  }
}

```
