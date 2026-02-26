# E-T-Rezept Structure Map for Task - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for Task**

## StructureMap: E-T-Rezept Structure Map for Task 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapTask | *Version*:1.0.0 |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapTask |

 
Mappt die E-Rezept ID aus dem Task in ein Identifier Objekt 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapTask",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapTask",
  "version" : "1.0.0",
  "name" : "ERPTPrescriptionStructureMapTask",
  "title" : "E-T-Rezept Structure Map for Task",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-19",
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
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task",
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
