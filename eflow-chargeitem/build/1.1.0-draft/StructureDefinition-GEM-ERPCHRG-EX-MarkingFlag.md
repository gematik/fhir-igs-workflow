# GEM_ERPCHRG_EX_MarkingFlag - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM_ERPCHRG_EX_MarkingFlag**

## Extension: GEM_ERPCHRG_EX_MarkingFlag 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_EX_MarkingFlag | *Version*:1.1.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:GEM_ERPCHRG_EX_MarkingFlag |

**Context of Use**

This extension may be used on the following element(s):

* Element ID ChargeItem

**Usage info**

**Usages:**

* Use this Extension: [GEM_ERPCHRG_PR_ChargeItem](StructureDefinition-GEM-ERPCHRG-PR-ChargeItem.md)
* Examples for this Extension: [ChargeItem/ChargeItem-GET-Completed](ChargeItem-ChargeItem-GET-Completed.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-chargeitem|current/StructureDefinition/GEM-ERPCHRG-EX-MarkingFlag)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPCHRG-EX-MarkingFlag.csv), [Excel](StructureDefinition-GEM-ERPCHRG-EX-MarkingFlag.xlsx), [Schematron](StructureDefinition-GEM-ERPCHRG-EX-MarkingFlag.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPCHRG-EX-MarkingFlag",
  "url" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_EX_MarkingFlag",
  "version" : "1.1.0-draft",
  "name" : "GEM_ERPCHRG_EX_MarkingFlag",
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
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "ChargeItem"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Options for submitted ChargeItem",
      "definition" : "Optional Extension for ChargeItem-Ressources in eRx workflow"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "description" : "Extensions are always sliced by (at least) url",
        "rules" : "closed"
      },
      "min" : 3
    },
    {
      "id" : "Extension.extension:insuranceProvider",
      "path" : "Extension.extension",
      "sliceName" : "insuranceProvider",
      "short" : "submitted to health insurance provider",
      "definition" : "Patient submitted their ChargeItem to his health insurance provider.",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:insuranceProvider.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:insuranceProvider.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "insuranceProvider"
    },
    {
      "id" : "Extension.extension:insuranceProvider.value[x]",
      "path" : "Extension.extension.value[x]",
      "short" : "true = submitted to insurance provider",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Extension.extension:subsidy",
      "path" : "Extension.extension",
      "sliceName" : "subsidy",
      "short" : "submitted to aid organization ('Beihilfe')",
      "definition" : "Patient submitted their ChargeItem to the aid organization ('Beihilfe').",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:subsidy.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:subsidy.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "subsidy"
    },
    {
      "id" : "Extension.extension:subsidy.value[x]",
      "path" : "Extension.extension.value[x]",
      "short" : "true = submitted to aid organization",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Extension.extension:taxOffice",
      "path" : "Extension.extension",
      "sliceName" : "taxOffice",
      "short" : "submitted to tax office",
      "definition" : "Patient submitted their ChargeItem to the tax office.",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:taxOffice.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:taxOffice.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "taxOffice"
    },
    {
      "id" : "Extension.extension:taxOffice.value[x]",
      "path" : "Extension.extension.value[x]",
      "short" : "true = submitted to tax office",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_EX_MarkingFlag"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
