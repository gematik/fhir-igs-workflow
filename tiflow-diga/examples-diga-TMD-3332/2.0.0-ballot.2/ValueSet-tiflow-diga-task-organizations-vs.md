# Bearbeiter eines E-Rezeptes - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Bearbeiter eines E-Rezeptes**

## ValueSet: Bearbeiter eines E-Rezeptes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/ValueSet/tiflow-diga-task-organizations-vs | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:TIFlowDiGATaskOrganizationsVS |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
ValueSet der Organisationstyp-Codes eines Performers für den DiGA Task 

 **References** 

* [TIFlow - DiGA - Task](StructureDefinition-tiflow-diga-task.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

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
  "id" : "tiflow-diga-task-organizations-vs",
  "url" : "https://gematik.de/fhir/tiflow-diga/ValueSet/tiflow-diga-task-organizations-vs",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowDiGATaskOrganizationsVS",
  "title" : "Bearbeiter eines E-Rezeptes",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-30",
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
  "description" : "ValueSet der Organisationstyp-Codes eines Performers für den DiGA Task",
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
      "system" : "https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID",
      "concept" : [{
        "code" : "1.2.276.0.76.4.59",
        "display" : "Betriebsstätte Kostenträger"
      }]
    }]
  }
}

```
