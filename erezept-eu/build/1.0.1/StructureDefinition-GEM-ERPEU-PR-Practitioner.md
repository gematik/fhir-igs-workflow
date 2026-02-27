# Practitioner Information Received from the EU - EU Zugriff E-Rezept v1.0.1

EU Zugriff E-Rezept

Version 1.0.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Practitioner Information Received from the EU**

## Resource Profile: Practitioner Information Received from the EU 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Practitioner | *Version*:1.0.1 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_Practitioner |

 
This Practitioner Profile is sent by the NCPeH when redeeming a Prescription in the EU 

**Usages:**

* Use this Profile: [GEM ERP PR EU CloseOperation Input](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.md)
* Refer to this Profile: [PractitionerRole Information Received from the EU](StructureDefinition-GEM-ERPEU-PR-PractitionerRole.md)
* Examples for this Profile: [Practitioner/Example-EU-Practitioner](Practitioner-Example-EU-Practitioner.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.erezept.eu|current/StructureDefinition/GEM-ERPEU-PR-Practitioner)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-Practitioner.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-Practitioner.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-Practitioner.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-Practitioner",
  "url" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Practitioner",
  "version" : "1.0.1",
  "name" : "GEM_ERPEU_PR_Practitioner",
  "title" : "Practitioner Information Received from the EU",
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
  "description" : "This Practitioner Profile is sent by the NCPeH when redeeming a Prescription in the EU",
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
  "type" : "Practitioner",
  "baseDefinition" : "https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Practitioner.identifier",
      "path" : "Practitioner.identifier",
      "comment" : "There are not yet specific identifier systems defined. Therefore the field system is optional, but has to be used if there is a known identifier system.",
      "min" : 1
    },
    {
      "id" : "Practitioner.identifier.system",
      "path" : "Practitioner.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Practitioner.identifier.value",
      "path" : "Practitioner.identifier.value",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
