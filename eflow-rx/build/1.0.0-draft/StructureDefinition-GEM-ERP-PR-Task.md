# GEM ERP PR Task - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Task**

## Resource Profile: GEM ERP PR Task 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Task | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_PR_Task |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Task für die Verwaltung des E-Rezept-Workflows 

**Usages:**

* Use this Profile: [GEM ERP PR Bundle OP Accept](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.md), [GEM ERP PR ActivateOperation Output](StructureDefinition-eflow-rx-activate-operation-output-parameters.md) and [GEM ERP PR CreateOperation Output](StructureDefinition-eflow-rx-create-operation-output-parameters.md)
* Refer to this Profile: [GEM ERP PR Communication](StructureDefinition-GEM-ERP-PR-Communication.md)
* Examples for this Profile: [Task/09330307-16ce-4cdc-810a-ca24ef80dde3](Task-09330307-16ce-4cdc-810a-ca24ef80dde3.md), [Task/607255ed-ce41-47fc-aad3-cfce1c39963f](Task-607255ed-ce41-47fc-aad3-cfce1c39963f.md), [Task/9b48f82c-9c11-4a57-aa72-a805f9537a82](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md), [Task/b12eb5f7-91ce-4887-93c7-800454601377](Task-b12eb5f7-91ce-4887-93c7-800454601377.md)... Show 2 more, [Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e](Task-d70932d1-9e1c-483c-b2d4-b7dced09b35e.md) and [Task/f5c21409-b84b-4125-8649-5630a00906b1](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/GEM-ERP-PR-Task)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Task.csv), [Excel](StructureDefinition-GEM-ERP-PR-Task.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Task",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Task",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_Task",
  "title" : "GEM ERP PR Task",
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
  "description" : "Task für die Verwaltung des E-Rezept-Workflows",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Task",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Task.extension",
      "path" : "Task.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "description" : "Erweiterungen für die Aufgabe, die durch url unterschieden werden.",
        "ordered" : false,
        "rules" : "closed"
      },
      "min" : 1
    },
    {
      "id" : "Task.extension:flowType",
      "path" : "Task.extension",
      "sliceName" : "flowType",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-PrescriptionType"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.extension:acceptDate",
      "path" : "Task.extension",
      "sliceName" : "acceptDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-AcceptDate"]
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
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-ExpiryDate"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.extension:lastMedicationDispense",
      "path" : "Task.extension",
      "sliceName" : "lastMedicationDispense",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-LastMedicationDispense"]
      }]
    },
    {
      "id" : "Task.extension:eu-isRedeemableByProperties",
      "path" : "Task.extension",
      "sliceName" : "eu-isRedeemableByProperties",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-eu-is-redeemable-by-properties-extension"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.extension:eu-isRedeemableByPatientAuthorization",
      "path" : "Task.extension",
      "sliceName" : "eu-isRedeemableByPatientAuthorization",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-eu-is-redeemable-by-patient-authorization-extension"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.identifier",
      "path" : "Task.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "description" : "Die Task-Ressource enthält zwei Kennungen. Die erste ist die Kennung für den Task, die ein E-Rezept darstellt. Die andere Kennung repräsentiert den Patienten als Eigentümer des E-Rezepts via Krankenversichertennummer (KVNR)",
        "rules" : "closed"
      },
      "min" : 1
    },
    {
      "id" : "Task.identifier:PrescriptionID",
      "path" : "Task.identifier",
      "sliceName" : "PrescriptionID",
      "short" : "E-Rezept-ID",
      "definition" : "Die E-Rezept-ID ist der Hauptidentifikator für die Task Ressource und den gesamten E-Rezept Workflow. Dieser Identifikator wird vom E-Rezept Fachdienst generiert und darf nicht manuell geändert werden.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/e-prescription-id"]
      }]
    },
    {
      "id" : "Task.identifier:AccessCode",
      "path" : "Task.identifier",
      "sliceName" : "AccessCode",
      "short" : "AccessCode Identifier",
      "definition" : "Generiert vom E-Rezept Fachdienst. Dieser Identifikator muss in jeder Anfrage zur Task Ressource übertragen werden.",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Task.identifier:AccessCode.system",
      "path" : "Task.identifier.system",
      "min" : 1,
      "fixedUri" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
    },
    {
      "id" : "Task.identifier:AccessCode.value",
      "path" : "Task.identifier.value",
      "min" : 1
    },
    {
      "id" : "Task.identifier:Secret",
      "path" : "Task.identifier",
      "sliceName" : "Secret",
      "short" : "Secret",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Secret"]
      }]
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "fixedCode" : "order"
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
      "short" : "Kennung des Patienten (KVID-Identifier)"
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
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM-ERP-VS-OrganizationType"
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
      "definition" : "Referenz auf Eingabe und Ergebnis des E-Rezeptes während des Prozesses",
      "mustSupport" : true
    },
    {
      "id" : "Task.input:ePrescription",
      "path" : "Task.input",
      "sliceName" : "ePrescription",
      "short" : "QES-Binary des E-Rezept",
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
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM-ERP-VS-DocumentType"
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
        "targetProfile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Binary"]
      }]
    },
    {
      "id" : "Task.input:patientReceipt",
      "path" : "Task.input",
      "sliceName" : "patientReceipt",
      "short" : "JSON-Bundle des E-Rezepts, das vom E-Rezept-FdV konsumiert werden soll",
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
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM-ERP-VS-DocumentType"
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
      "comment" : "Dies ist ein Bundle eines Rezepts, z.B. KBV_PR_ERP_Bundle oder KBV_PR_EVDGA_Bundle",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Bundle"]
      }]
    },
    {
      "id" : "Task.output",
      "path" : "Task.output",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type.coding.code"
        }],
        "rules" : "closed"
      },
      "short" : "Output Bundle",
      "definition" : "Referenz auf das Bundle, das die Quittung darstellt.",
      "mustSupport" : true
    },
    {
      "id" : "Task.output:receipt",
      "path" : "Task.output",
      "sliceName" : "receipt",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Task.output:receipt.type.coding",
      "path" : "Task.output.type.coding",
      "min" : 1,
      "max" : "1",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM-ERP-VS-DocumentType"
      }
    },
    {
      "id" : "Task.output:receipt.type.coding.system",
      "path" : "Task.output.type.coding.system",
      "min" : 1
    },
    {
      "id" : "Task.output:receipt.type.coding.code",
      "path" : "Task.output.type.coding.code",
      "min" : 1,
      "fixedCode" : "3"
    },
    {
      "id" : "Task.output:receipt.value[x]",
      "path" : "Task.output.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Bundle"]
      }]
    }]
  }
}

```
