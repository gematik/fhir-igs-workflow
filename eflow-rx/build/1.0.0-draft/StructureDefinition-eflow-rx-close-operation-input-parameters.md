# GEM ERP PR CloseOperation Input - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR CloseOperation Input**

## Resource Profile: GEM ERP PR CloseOperation Input 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-input-parameters | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxCloseOperationInputParameters |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil definiert die Parameter für das Schließen eines Workflows für ein Rezept vom AVS zum E-Rezept-Fachdienst. Dies kann für die Operationen $close und $dispense verwendet werden. 

**Usages:**

* Examples for this Profile: [Parameters/ExampleCloseInputParameters](Parameters-ExampleCloseInputParameters.md), [Parameters/ExampleCloseInputParametersKombipackung](Parameters-ExampleCloseInputParametersKombipackung.md), [Parameters/ExampleCloseInputParametersMultipleMedicationDispenses](Parameters-ExampleCloseInputParametersMultipleMedicationDispenses.md) and [Parameters/ExampleCloseInputParametersRezeptur](Parameters-ExampleCloseInputParametersRezeptur.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-close-operation-input-parameters)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-close-operation-input-parameters.csv), [Excel](StructureDefinition-eflow-rx-close-operation-input-parameters.xlsx), [Schematron](StructureDefinition-eflow-rx-close-operation-input-parameters.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-close-operation-input-parameters",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-input-parameters",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxCloseOperationInputParameters",
  "title" : "GEM ERP PR CloseOperation Input",
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
  "description" : "Dieses Profil definiert die Parameter für das Schließen eines Workflows für ein Rezept vom AVS zum E-Rezept-Fachdienst. Dies kann für die Operationen $close und $dispense verwendet werden.",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Parameters",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Parameters",
      "path" : "Parameters"
    },
    {
      "id" : "Parameters.parameter",
      "path" : "Parameters.parameter",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "name"
        }],
        "rules" : "closed"
      }
    },
    {
      "id" : "Parameters.parameter:rxDispensation",
      "path" : "Parameters.parameter",
      "sliceName" : "rxDispensation",
      "min" : 0,
      "max" : "*",
      "constraint" : [{
        "key" : "workflow-parameters-close-medication-exists",
        "severity" : "error",
        "human" : "If a reference from a MedicationDispense to a Medication exists, a Medication resource must exist.",
        "expression" : "part.where(name = 'medicationDispense').resource.medication.ofType(Reference).reference.exists() implies part.where(name = 'medication').exists()",
        "source" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-input-parameters"
      },
      {
        "key" : "workflow-parameters-close-dispense-medication-references",
        "severity" : "error",
        "human" : "If a reference from a MedicationDispense to a Medication exists, the reference must resolve to the Medication.",
        "expression" : "part.where(name = 'medicationDispense').resource.medication.ofType(Reference).reference.exists() implies ((part.where(name = 'medicationDispense').resource.medication.reference.split('/').last().split(':').last()) = (part.where(name = 'medication').resource.id))",
        "source" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-input-parameters"
      }]
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
        "discriminator" : [{
          "type" : "pattern",
          "path" : "name"
        }],
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
      "type" : [{
        "code" : "BackboneElement"
      }]
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
      "type" : [{
        "code" : "MedicationDispense",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-MedicationDispense"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication",
      "path" : "Parameters.parameter.part",
      "sliceName" : "medication",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "medication",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication.resource",
      "path" : "Parameters.parameter.part.resource",
      "min" : 1,
      "type" : [{
        "code" : "Medication",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Medication"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    }]
  }
}

```
