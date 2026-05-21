# GEM ERP PR Binary - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Binary**

## Resource Profile: GEM ERP PR Binary 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Binary | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERP_PR_Binary |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
PKCS7 signiertes Bundle im enveloping style 

**Usages:**

* Use this Profile: [Bundle der $accept Operation](StructureDefinition-tiflow-op-accept-bundle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow|current/StructureDefinition/GEM-ERP-PR-Binary)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Binary.csv), [Excel](StructureDefinition-GEM-ERP-PR-Binary.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Binary.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Binary",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Binary",
  "version" : "2.0.0-ballot.1",
  "name" : "GEM_ERP_PR_Binary",
  "title" : "GEM ERP PR Binary",
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
