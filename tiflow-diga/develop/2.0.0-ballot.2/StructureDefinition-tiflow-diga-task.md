# TIFlow - DiGA - Task - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow - DiGA - Task**

## Resource Profile: TIFlow - DiGA - Task 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/StructureDefinition/tiflow-diga-task | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowDiGATask |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Task für die Verwaltung des E-Rezept-Workflows für digitale Gesundheitsanwendungen 

**Usages:**

* Use this Profile: [TIFlow DiGA Activate Operation Output](StructureDefinition-ti-flow-di-ga-activate-operation-output.md) and [TIFlow DiGA Create Operation Output](StructureDefinition-ti-flow-di-ga-create-operation-output.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.diga|current/StructureDefinition/StructureDefinition-tiflow-diga-task.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-tiflow-diga-task.csv), [Excel](StructureDefinition-tiflow-diga-task.xlsx), [Schematron](StructureDefinition-tiflow-diga-task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tiflow-diga-task",
  "url" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/tiflow-diga-task",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowDiGATask",
  "title" : "TIFlow - DiGA - Task",
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
  "description" : "Task für die Verwaltung des E-Rezept-Workflows für digitale Gesundheitsanwendungen",
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
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Task",
  "baseDefinition" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-task",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Task.extension:acceptDate",
      "path" : "Task.extension",
      "sliceName" : "acceptDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.extension:expiryDate",
      "path" : "Task.extension",
      "sliceName" : "expiryDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.for.identifier",
      "path" : "Task.for.identifier",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }]
    },
    {
      "id" : "Task.performerType.coding",
      "path" : "Task.performerType.coding",
      "min" : 1,
      "max" : "1",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/tiflow-diga/ValueSet/tiflow-diga-task-organizations-vs"
      }
    },
    {
      "id" : "Task.input",
      "path" : "Task.input",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type.coding.code"
        }],
        "rules" : "closed"
      },
      "short" : "Input Bundle",
      "definition" : "Referenz auf Eingabe und Ergebnis der DiGA Verordnung während des Prozesses",
      "mustSupport" : true
    },
    {
      "id" : "Task.input:ePrescription",
      "path" : "Task.input",
      "sliceName" : "ePrescription",
      "short" : "QES-Binary der DiGA Verordnung",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Task.input:ePrescription.type.coding",
      "path" : "Task.input.type.coding",
      "min" : 1,
      "max" : "1",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_VS_DocumentType"
      }
    },
    {
      "id" : "Task.input:ePrescription.type.coding.system",
      "path" : "Task.input.type.coding.system",
      "min" : 1
    },
    {
      "id" : "Task.input:ePrescription.type.coding.code",
      "path" : "Task.input.type.coding.code",
      "min" : 1,
      "fixedCode" : "1"
    },
    {
      "id" : "Task.input:ePrescription.value[x]",
      "path" : "Task.input.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://gematik.de/fhir/tiflow-diga/StructureDefinition/tiflow-diga-binary"]
      }]
    },
    {
      "id" : "Task.input:patientReceipt",
      "path" : "Task.input",
      "sliceName" : "patientReceipt",
      "short" : "JSON-Bundle der Verordnung, das von einem FdV konsumiert werden soll",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Task.input:patientReceipt.type.coding",
      "path" : "Task.input.type.coding",
      "min" : 1,
      "max" : "1",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_VS_DocumentType"
      }
    },
    {
      "id" : "Task.input:patientReceipt.type.coding.system",
      "path" : "Task.input.type.coding.system",
      "min" : 1
    },
    {
      "id" : "Task.input:patientReceipt.type.coding.code",
      "path" : "Task.input.type.coding.code",
      "min" : 1,
      "fixedCode" : "2"
    },
    {
      "id" : "Task.input:patientReceipt.value[x]",
      "path" : "Task.input.value[x]",
      "comment" : "Dies ist ein Bundle eines Rezepts vom Profil [KBV_PR_EVDGA_Bundle](https://simplifier.net/evdga/kbv_pr_evdga_bundle).",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Bundle"]
      }]
    }]
  }
}

```
