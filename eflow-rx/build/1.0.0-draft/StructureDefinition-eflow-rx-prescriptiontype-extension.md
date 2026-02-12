# GEM ERP EX PrescriptionType - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX PrescriptionType**

## Extension: GEM ERP EX PrescriptionType 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-prescriptiontype-extension | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxPrescriptionTypeExtension |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Definiert den Typ eines Rezepts.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Task
* Element ID Communication.payload
* Element ID Communication

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Communication DispReq](StructureDefinition-eflow-rx-communication-dispreq.md) and [GEM ERP PR Task](StructureDefinition-eflow-rx-task.md)
* Examples for this Extension: [Bundle/Bundle-AcceptOperation](Bundle-Bundle-AcceptOperation.md), [Communication/a218a36e-f2fd-4603-ba67-c827acfef01b](Communication-a218a36e-f2fd-4603-ba67-c827acfef01b.md), [Task/09330307-16ce-4cdc-810a-ca24ef80dde3](Task-09330307-16ce-4cdc-810a-ca24ef80dde3.md), [Task/607255ed-ce41-47fc-aad3-cfce1c39963f](Task-607255ed-ce41-47fc-aad3-cfce1c39963f.md)... Show 4 more, [Task/9b48f82c-9c11-4a57-aa72-a805f9537a82](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md), [Task/b12eb5f7-91ce-4887-93c7-800454601377](Task-b12eb5f7-91ce-4887-93c7-800454601377.md), [Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e](Task-d70932d1-9e1c-483c-b2d4-b7dced09b35e.md) and [Task/f5c21409-b84b-4125-8649-5630a00906b1](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-prescriptiontype-extension)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-prescriptiontype-extension.csv), [Excel](StructureDefinition-eflow-rx-prescriptiontype-extension.xlsx), [Schematron](StructureDefinition-eflow-rx-prescriptiontype-extension.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-prescriptiontype-extension",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-prescriptiontype-extension",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxPrescriptionTypeExtension",
  "title" : "GEM ERP EX PrescriptionType",
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
  "description" : "Definiert den Typ eines Rezepts.",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Task"
    },
    {
      "type" : "element",
      "expression" : "Communication.payload"
    },
    {
      "type" : "element",
      "expression" : "Communication"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Art der Verschreibung",
        "definition" : "Definiert den Typ des Rezepts. Das Codesystem enthält alle unterstützten Formulare."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-prescriptiontype-extension"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/erp/ValueSet/eflow-rx-flowtype"
        }
      },
      {
        "id" : "Extension.value[x].system",
        "path" : "Extension.value[x].system",
        "min" : 1
      },
      {
        "id" : "Extension.value[x].code",
        "path" : "Extension.value[x].code",
        "min" : 1
      }
    ]
  }
}

```
