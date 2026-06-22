# TI Environments ValueSet - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Environments ValueSet**

## ValueSet: TI Environments ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/ValueSet/ti-environment-vs | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-01 | *Computable Name*:TIEnvironmentsVS |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses ValueSet enthält alle zulässigen Umgebungskennzeichen für CapabilityStatements des TI-Flow-Fachdienstes und wird für die verpflichtende Kennzeichnung der Zielumgebung verwendet. 

 **References** 

* [TI Environment](StructureDefinition-ti-environment.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ti-environment-vs",
  "url" : "https://gematik.de/fhir/tiflow/ValueSet/ti-environment-vs",
  "version" : "2.0.0-ballot.2",
  "name" : "TIEnvironmentsVS",
  "title" : "TI Environments ValueSet",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-01",
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
  "description" : "Dieses ValueSet enthält alle zulässigen Umgebungskennzeichen für CapabilityStatements des TI-Flow-Fachdienstes und wird für die verpflichtende Kennzeichnung der Zielumgebung verwendet.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "immutable" : false,
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/tiflow/CodeSystem/ti-environment-codes"
    }]
  }
}

```
