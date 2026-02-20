# GEM ERP EX AcceptDate - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX AcceptDate**

## Extension: GEM ERP EX AcceptDate 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-AcceptDate | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_EX_AcceptDate |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Task

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Task](StructureDefinition-GEM-ERP-PR-Task.md)
* Examples for this Extension: [Bundle/Bundle-AcceptOperation](Bundle-Bundle-AcceptOperation.md), [Task/09330307-16ce-4cdc-810a-ca24ef80dde3](Task-09330307-16ce-4cdc-810a-ca24ef80dde3.md), [Task/607255ed-ce41-47fc-aad3-cfce1c39963f](Task-607255ed-ce41-47fc-aad3-cfce1c39963f.md), [Task/9b48f82c-9c11-4a57-aa72-a805f9537a82](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md)... Show 3 more, [Task/b12eb5f7-91ce-4887-93c7-800454601377](Task-b12eb5f7-91ce-4887-93c7-800454601377.md), [Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e](Task-d70932d1-9e1c-483c-b2d4-b7dced09b35e.md) and [Task/f5c21409-b84b-4125-8649-5630a00906b1](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/GEM-ERP-EX-AcceptDate)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-AcceptDate.csv), [Excel](StructureDefinition-GEM-ERP-EX-AcceptDate.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-AcceptDate.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-AcceptDate",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-AcceptDate",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_EX_AcceptDate",
  "title" : "GEM ERP EX AcceptDate",
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
  "description" : "Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt.",
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
    "expression" : "Task"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Akzeptanzdatum der Verschreibung",
      "definition" : "Datum, bis zu dem die Krankenkasse die Verschreibung akzeptiert."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-AcceptDate"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "date"
      }]
    }]
  }
}

```
