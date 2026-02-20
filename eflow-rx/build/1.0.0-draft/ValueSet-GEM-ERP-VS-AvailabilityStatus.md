# ValueSet der Verfügbarkeitsstatus-Codes - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ValueSet der Verfügbarkeitsstatus-Codes**

## ValueSet: ValueSet der Verfügbarkeitsstatus-Codes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/ValueSet/GEM-ERP-VS-AvailabilityStatus | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_VS_AvailabilityStatus |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Art des Verfügbarkeitsstatus für die Verfügbarkeitsanfrage von Medikamenten 

 **References** 

* [GEM ERP EX AvailabilityState](StructureDefinition-GEM-ERP-EX-AvailabilityState.md)

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
  "id" : "GEM-ERP-VS-AvailabilityStatus",
  "url" : "https://gematik.de/fhir/erp/ValueSet/GEM-ERP-VS-AvailabilityStatus",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_VS_AvailabilityStatus",
  "title" : "ValueSet der Verfügbarkeitsstatus-Codes",
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
  "description" : "Art des Verfügbarkeitsstatus für die Verfügbarkeitsanfrage von Medikamenten",
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
      "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM-ERP-CS-AvailabilityStatus"
    }]
  }
}

```
