# GEM ERP PR Bundle OP Accept - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Bundle OP Accept**

## Resource Profile: GEM ERP PR Bundle OP Accept 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Bundle-OP-Accept | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_PR_Bundle_OP_Accept |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Antwort des E-Rezept-Fachdienst auf die $accept-Operation 

**Usages:**

* Use this Profile: [GEM ERP PR AcceptOperation Output](StructureDefinition-eflow-rx-accept-operation-output-parameters.md)
* Examples for this Profile: [Bundle/Bundle-AcceptOperation](Bundle-Bundle-AcceptOperation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/GEM-ERP-PR-Bundle-OP-Accept)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.csv), [Excel](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Bundle-OP-Accept",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Bundle-OP-Accept",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_Bundle_OP_Accept",
  "title" : "GEM ERP PR Bundle OP Accept",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
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
  "description" : "Antwort des E-Rezept-Fachdienst auf die $accept-Operation",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Bundle",
      "path" : "Bundle"
    },
    {
      "id" : "Bundle.type",
      "path" : "Bundle.type",
      "fixedCode" : "collection"
    },
    {
      "id" : "Bundle.entry",
      "path" : "Bundle.entry",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "resource"
        }],
        "description" : "Die Aufgabe und das QES signierte Bundle.",
        "rules" : "closed"
      },
      "min" : 2,
      "max" : "2"
    },
    {
      "id" : "Bundle.entry:erxTask",
      "path" : "Bundle.entry",
      "sliceName" : "erxTask",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Bundle.entry:erxTask.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "Task",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Task"]
      }]
    },
    {
      "id" : "Bundle.entry:erxBinary",
      "path" : "Bundle.entry",
      "sliceName" : "erxBinary",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Bundle.entry:erxBinary.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "Binary",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Binary"]
      }]
    }]
  }
}

```
