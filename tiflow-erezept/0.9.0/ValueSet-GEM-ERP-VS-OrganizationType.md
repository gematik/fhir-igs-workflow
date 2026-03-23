# ValueSet der Organisationstyp-Codes - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ValueSet der Organisationstyp-Codes**

## ValueSet: ValueSet der Organisationstyp-Codes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/erezept/ValueSet/GEM-ERP-VS-OrganizationType | *Version*:0.9.0 |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_VS_OrganizationType |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Art der Organisation 

 **References** 

* [GEM ERP PR Task](StructureDefinition-GEM-ERP-PR-Task.md)
* [GEM ERP PR Task](StructureDefinition-GEM-ERP-PR-Task.md)

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
  "id" : "GEM-ERP-VS-OrganizationType",
  "url" : "https://gematik.de/fhir/tiflow/erezept/ValueSet/GEM-ERP-VS-OrganizationType",
  "version" : "0.9.0",
  "name" : "GEM_ERP_VS_OrganizationType",
  "title" : "ValueSet der Organisationstyp-Codes",
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
  "description" : "Art der Organisation",
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
      "system" : "https://gematik.de/fhir/tiflow/erezept/CodeSystem/GEM-ERP-CS-OrganizationType"
    }]
  }
}

```
