# TIFlow DiGA Dispense Operation Input - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow DiGA Dispense Operation Input**

## Resource Profile: TIFlow DiGA Dispense Operation Input 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-dispense-operation-input | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowDiGADispenseOperationInput |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil definiert die Parameter für die Abgabe einer DiGA Verordnung vom Kostenträger an den TI-Flow-Fachdienst. Dies kann für die $dispense-Operation verwendet werden. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.diga|current/StructureDefinition/StructureDefinition-ti-flow-di-ga-dispense-operation-input.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-flow-di-ga-dispense-operation-input.csv), [Excel](StructureDefinition-ti-flow-di-ga-dispense-operation-input.xlsx), [Schematron](StructureDefinition-ti-flow-di-ga-dispense-operation-input.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-flow-di-ga-dispense-operation-input",
  "url" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-dispense-operation-input",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlowDiGADispenseOperationInput",
  "title" : "TIFlow DiGA Dispense Operation Input",
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
  "description" : "Dieses Profil definiert die Parameter für die Abgabe einer DiGA Verordnung vom Kostenträger an den TI-Flow-Fachdienst. Dies kann für die $dispense-Operation verwendet werden.",
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
      },
      "min" : 1
    },
    {
      "id" : "Parameters.parameter:rxDispensation",
      "path" : "Parameters.parameter",
      "sliceName" : "rxDispensation",
      "min" : 1,
      "max" : "*"
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
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    }]
  }
}

```
