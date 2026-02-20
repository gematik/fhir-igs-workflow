# GEM ERP EX AvailabilityState - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX AvailabilityState**

## Extension: GEM ERP EX AvailabilityState 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-AvailabilityState | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_EX_AvailabilityState |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Extension zur Angabe von Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Communication.payload

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Communication Reply](StructureDefinition-GEM-ERP-PR-Communication-Reply.md)
* Examples for this Extension: [Communication/7977a4ab-97a9-4d95-afb3-6c4c1e2ac596](Communication-7977a4ab-97a9-4d95-afb3-6c4c1e2ac596.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/GEM-ERP-EX-AvailabilityState)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-AvailabilityState.csv), [Excel](StructureDefinition-GEM-ERP-EX-AvailabilityState.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-AvailabilityState.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-AvailabilityState",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-AvailabilityState",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_EX_AvailabilityState",
  "title" : "GEM ERP EX AvailabilityState",
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
  "description" : "Extension zur Angabe von Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit.",
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Communication.payload"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-AvailabilityState"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "description" : "Availability of medication",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM-ERP-VS-AvailabilityStatus"
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
    }]
  }
}

```
