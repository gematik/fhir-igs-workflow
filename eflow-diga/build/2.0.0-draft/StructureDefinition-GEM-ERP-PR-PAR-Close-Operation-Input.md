# GEM ERP PR CloseOperation Input - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR CloseOperation Input**

## Resource Profile: GEM ERP PR CloseOperation Input 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input | *Version*:2.0.0-draft |
| Draft as of 2026-02-06 | *Computable Name*:GEM_ERP_PR_PAR_CloseOperation_Input |

 
Dieses Profil definiert die Parameter fuer das Schliessen eines Workflows fuer ein Rezept vom AVS zum E-Rezept-Fachdienst. Dies kann fuer die Operationen $close und $dispense verwendet werden. 

**Usages:**

* Examples for this Profile: [Parameters/ExampleCloseInputParametersDiGA](Parameters-ExampleCloseInputParametersDiGA.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-diga|current/StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Input)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Input.csv), [Excel](StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Input.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Input.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-PAR-Close-Operation-Input",
  "url" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input",
  "version" : "2.0.0-draft",
  "name" : "GEM_ERP_PR_PAR_CloseOperation_Input",
  "title" : "GEM ERP PR CloseOperation Input",
  "status" : "draft",
  "date" : "2026-02-06",
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
  "description" : "Dieses Profil definiert die Parameter fuer das Schliessen eines Workflows fuer ein Rezept vom AVS zum E-Rezept-Fachdienst. Dies kann fuer die Operationen $close und $dispense verwendet werden.",
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Parameters",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Parameters",
        "path" : "Parameters"
      },
      {
        "id" : "Parameters.meta",
        "path" : "Parameters.meta",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Parameters.meta.profile",
        "path" : "Parameters.meta.profile",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "$this"
            }
          ],
          "description" : "Slicing fuer meta profile",
          "ordered" : false,
          "rules" : "closed"
        },
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.meta.profile:workflowProfile",
        "path" : "Parameters.meta.profile",
        "sliceName" : "workflowProfile",
        "min" : 1,
        "max" : "1",
        "fixedCanonical" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input|2.0",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter",
        "path" : "Parameters.parameter",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "name"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Parameters.parameter:rxDispensation",
        "path" : "Parameters.parameter",
        "sliceName" : "rxDispensation",
        "min" : 0,
        "max" : "*",
        "constraint" : [
          {
            "key" : "workflow-parameters-close-medication-exists",
            "severity" : "error",
            "human" : "If a reference from a MedicationDispense to a Medication exists, a Medication resource must exist.",
            "expression" : "part.where(name = 'medicationDispense').resource.medication.ofType(Reference).reference.exists() implies part.where(name = 'medication').exists()",
            "source" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input"
          },
          {
            "key" : "workflow-parameters-close-dispense-medication-references",
            "severity" : "error",
            "human" : "If a reference from a MedicationDispense to a Medication exists, the reference must resolve to the Medication.",
            "expression" : "part.where(name = 'medicationDispense').resource.medication.ofType(Reference).reference.exists() implies ((part.where(name = 'medicationDispense').resource.medication.reference.split('/').last().split(':').last()) = (part.where(name = 'medication').resource.id))",
            "source" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_PR_PAR_CloseOperation_Input"
          }
        ]
      },
      {
        "id" : "Parameters.parameter:rxDispensation.name",
        "path" : "Parameters.parameter.name",
        "patternString" : "rxDispensation",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:rxDispensation.value[x]",
        "path" : "Parameters.parameter.value[x]",
        "max" : "0"
      },
      {
        "id" : "Parameters.parameter:rxDispensation.resource",
        "path" : "Parameters.parameter.resource",
        "max" : "0"
      },
      {
        "id" : "Parameters.parameter:rxDispensation.part",
        "path" : "Parameters.parameter.part",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "name"
            }
          ],
          "rules" : "closed"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:rxDispensation.part:medicationDispense",
        "path" : "Parameters.parameter.part",
        "sliceName" : "medicationDispense",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.name",
        "path" : "Parameters.parameter.part.name",
        "patternString" : "medicationDispense",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.value[x]",
        "path" : "Parameters.parameter.part.value[x]",
        "max" : "0"
      },
      {
        "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.resource",
        "path" : "Parameters.parameter.part.resource",
        "min" : 1,
        "type" : [
          {
            "code" : "MedicationDispense",
            "profile" : [
              "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA"
            ]
          }
        ]
      },
      {
        "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.part",
        "path" : "Parameters.parameter.part.part",
        "max" : "0"
      }
    ]
  }
}

```
