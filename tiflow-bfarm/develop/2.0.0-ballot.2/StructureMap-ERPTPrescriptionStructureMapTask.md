# E-T-Rezept Structure Map for Task - TIFlow - Datenaustausch BfArM Webdienst v2.0.0-ballot.2

TIFlow - Datenaustausch BfArM Webdienst

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for Task**

## StructureMap: E-T-Rezept Structure Map for Task 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-bfarm/StructureMap/ERPTPrescriptionStructureMapTask | *Version*:2.0.0-ballot.2 |
| Draft as of 2026-05-26 | *Computable Name*:ERPTPrescriptionStructureMapTask |

 
Mappt die E-Rezept ID aus dem Task in ein Identifier Objekt 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapTask",
  "url" : "https://gematik.de/fhir/tiflow-bfarm/StructureMap/ERPTPrescriptionStructureMapTask",
  "version" : "2.0.0-ballot.2",
  "name" : "ERPTPrescriptionStructureMapTask",
  "title" : "E-T-Rezept Structure Map for Task",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-05-26",
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
  "description" : "Mappt die E-Rezept ID aus dem Task in ein Identifier Objekt",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Task",
    "mode" : "source",
    "alias" : "task"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Identifier",
    "mode" : "target",
    "alias" : "tgtIdentifier"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapTask",
    "typeMode" : "none",
    "documentation" : "Mapping Anweisungen für GEM_Task",
    "input" : [{
      "name" : "task",
      "type" : "task",
      "mode" : "source"
    },
    {
      "name" : "tgtIdentifier",
      "type" : "tgtIdentifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "prescriptionId",
      "source" : [{
        "context" : "task",
        "element" : "identifier",
        "variable" : "srcTaskIdentifier",
        "condition" : "$this.system='https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId'"
      }],
      "rule" : [{
        "name" : "prescriptionIdValue",
        "source" : [{
          "context" : "srcTaskIdentifier",
          "element" : "value",
          "variable" : "srcTaskIdentifierValue",
          "logMessage" : "tgtIdentifier"
        }],
        "target" : [{
          "context" : "tgtIdentifier",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
          }]
        },
        {
          "context" : "tgtIdentifier",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcTaskIdentifierValue"
          }]
        }],
        "documentation" : "Mappt die E-Rezept-ID aus dem Task in den Identifier"
      }]
    }]
  }]
}

```
