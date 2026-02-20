# GEM ERP PR Binary - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Binary**

## Resource Profile: GEM ERP PR Binary 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Binary | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_PR_Binary |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
PKCS7 signiertes Bundle im enveloping style 

**Usages:**

* Use this Profile: [GEM ERP PR Bundle OP Accept](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.md)
* Refer to this Profile: [GEM ERP PR Task](StructureDefinition-GEM-ERP-PR-Task.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/GEM-ERP-PR-Binary)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Binary.csv), [Excel](StructureDefinition-GEM-ERP-PR-Binary.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Binary.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Binary",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Binary",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_Binary",
  "title" : "GEM ERP PR Binary",
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
  "description" : "PKCS7 signiertes Bundle im enveloping style",
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Binary",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Binary",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Binary",
      "path" : "Binary"
    },
    {
      "id" : "Binary.contentType",
      "path" : "Binary.contentType",
      "fixedCode" : "application/pkcs7-mime"
    },
    {
      "id" : "Binary.data",
      "path" : "Binary.data",
      "min" : 1
    }]
  }
}

```
