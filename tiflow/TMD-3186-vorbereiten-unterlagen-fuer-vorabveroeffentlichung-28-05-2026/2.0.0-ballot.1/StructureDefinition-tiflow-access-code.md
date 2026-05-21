# TI Flow AccessCode - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Flow AccessCode**

## Data Type Profile: TI Flow AccessCode 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowAccessCode |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Der AccessCode ist ein generiertes Geheimnis, das Zugriff auf eine Ressource gewährt, z. B. Task. 

**Usages:**

* Use this DataType Profile: [Task für TIFlow Anwendungen](StructureDefinition-ti-task.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow|current/StructureDefinition/tiflow-access-code)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-tiflow-access-code.csv), [Excel](StructureDefinition-tiflow-access-code.xlsx), [Schematron](StructureDefinition-tiflow-access-code.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tiflow-access-code",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlowAccessCode",
  "title" : "TI Flow AccessCode",
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
  "description" : "Der AccessCode ist ein generiertes Geheimnis, das Zugriff auf eine Ressource gewährt, z. B. Task.",
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
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Identifier",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Identifier",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Identifier.use",
      "path" : "Identifier.use",
      "fixedCode" : "official"
    },
    {
      "id" : "Identifier.system",
      "path" : "Identifier.system",
      "min" : 1,
      "fixedUri" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode",
      "mustSupport" : true
    },
    {
      "id" : "Identifier.value",
      "path" : "Identifier.value",
      "comment" : "Das Datenmodell ist in der Spezifikation für den TI-Flow-Fachdienst zu finden.",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
