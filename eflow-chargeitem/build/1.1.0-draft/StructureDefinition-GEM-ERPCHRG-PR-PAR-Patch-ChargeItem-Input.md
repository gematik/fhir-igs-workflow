# GEM ERPCHRG PR PAR Patch ChargeItem Input Parameter - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERPCHRG PR PAR Patch ChargeItem Input Parameter**

## Resource Profile: GEM ERPCHRG PR PAR Patch ChargeItem Input Parameter 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input | *Version*:1.1.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input |

 
This profile defines the parameters for changing Information for the ChargeItem. 

**Usages:**

* Examples for this Profile: [Parameters/Example-Parameters-Patch-ChargeItem-1](Parameters-Example-Parameters-Patch-ChargeItem-1.md) and [Parameters/Example-Parameters-Patch-ChargeItem-2](Parameters-Example-Parameters-Patch-ChargeItem-2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-chargeitem|current/StructureDefinition/GEM-ERPCHRG-PR-PAR-Patch-ChargeItem-Input)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPCHRG-PR-PAR-Patch-ChargeItem-Input.csv), [Excel](StructureDefinition-GEM-ERPCHRG-PR-PAR-Patch-ChargeItem-Input.xlsx), [Schematron](StructureDefinition-GEM-ERPCHRG-PR-PAR-Patch-ChargeItem-Input.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPCHRG-PR-PAR-Patch-ChargeItem-Input",
  "url" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input",
  "version" : "1.1.0-draft",
  "name" : "GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input",
  "title" : "GEM ERPCHRG PR PAR Patch ChargeItem Input Parameter",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-04-10",
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
  "description" : "This profile defines the parameters for changing Information for the ChargeItem.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
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
      "id" : "Parameters.meta",
      "path" : "Parameters.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.meta.profile",
      "path" : "Parameters.meta.profile",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "$this"
        }],
        "description" : "Slicing for meta profile",
        "ordered" : false,
        "rules" : "closed"
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.meta.profile:erpchrgProfile",
      "path" : "Parameters.meta.profile",
      "sliceName" : "erpchrgProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input|1.1",
      "mustSupport" : true
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
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:markingFlag",
      "path" : "Parameters.parameter",
      "sliceName" : "markingFlag",
      "min" : 1,
      "max" : "1",
      "constraint" : [{
        "key" : "erpcharge-parameters-patch-chargeitem-part",
        "severity" : "error",
        "human" : "At least one Part must be present.",
        "expression" : "part.exists()",
        "source" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input"
      }]
    },
    {
      "id" : "Parameters.parameter:markingFlag.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "markingFlag",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:markingFlag.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:markingFlag.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:markingFlag.part",
      "path" : "Parameters.parameter.part",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "name"
        }],
        "rules" : "closed"
      },
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:insuranceProvider",
      "path" : "Parameters.parameter.part",
      "sliceName" : "insuranceProvider",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:insuranceProvider.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "insuranceProvider",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:insuranceProvider.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:insuranceProvider.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:insuranceProvider.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:subsidy",
      "path" : "Parameters.parameter.part",
      "sliceName" : "subsidy",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:subsidy.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "subsidy",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:subsidy.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:subsidy.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:subsidy.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:taxOffice",
      "path" : "Parameters.parameter.part",
      "sliceName" : "taxOffice",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:taxOffice.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "taxOffice",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:taxOffice.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:taxOffice.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:markingFlag.part:taxOffice.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    }]
  }
}

```
