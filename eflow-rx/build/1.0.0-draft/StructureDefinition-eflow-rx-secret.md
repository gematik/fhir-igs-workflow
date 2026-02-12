# GEM ERP PR Secret - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Secret**

## Data Type Profile: GEM ERP PR Secret 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-secret | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxSecret |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Das Secret ist ein generiertes Geheimnis, das Zugriff auf eine E-Rezept-Ressource gewährt, z. B. Task. 

**Usages:**

* Use this DataType Profile: [GEM ERP PR Task](StructureDefinition-eflow-rx-task.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-secret)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-secret.csv), [Excel](StructureDefinition-eflow-rx-secret.xlsx), [Schematron](StructureDefinition-eflow-rx-secret.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-secret",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-secret",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxSecret",
  "title" : "GEM ERP PR Secret",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Das Secret ist ein generiertes Geheimnis, das Zugriff auf eine E-Rezept-Ressource gewährt, z. B. Task.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Identifier",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Identifier",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Identifier.use",
        "path" : "Identifier.use",
        "fixedCode" : "official"
      },
      {
        "id" : "Identifier.system",
        "path" : "Identifier.system",
        "min" : 1,
        "fixedUri" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret",
        "mustSupport" : true
      },
      {
        "id" : "Identifier.value",
        "path" : "Identifier.value",
        "short" : "Secret für die abgebende Apotheke.",
        "definition" : "Das Secret, das die Apotheke erhält, wenn das E-Rezept vom E-Rezept-Server angenommen wird.",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
