# DiGA QuittungsComposition - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DiGA QuittungsComposition**

## Resource Profile: DiGA QuittungsComposition 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/StructureDefinition/tiflow-diga-receipt-composition | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowDiGAReceiptComposition |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Composition für Quittung für Verordnungen von digitale Gesundheitsanwendungen 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.diga|current/StructureDefinition/StructureDefinition-tiflow-diga-receipt-composition.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-tiflow-diga-receipt-composition.csv), [Excel](StructureDefinition-tiflow-diga-receipt-composition.xlsx), [Schematron](StructureDefinition-tiflow-diga-receipt-composition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tiflow-diga-receipt-composition",
  "url" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/tiflow-diga-receipt-composition",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlowDiGAReceiptComposition",
  "title" : "DiGA QuittungsComposition",
  "status" : "active",
  "experimental" : false,
  "date" : "2028-04-01",
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
  "description" : "Composition für Quittung für Verordnungen von digitale Gesundheitsanwendungen",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
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
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Bundle",
      "path" : "Bundle"
    }]
  }
}

```
