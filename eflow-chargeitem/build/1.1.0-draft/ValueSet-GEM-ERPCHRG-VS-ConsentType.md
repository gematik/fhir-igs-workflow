# ValueSet of Consent Codes - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ValueSet of Consent Codes**

## ValueSet: ValueSet of Consent Codes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/ValueSet/GEM_ERPCHRG_VS_ConsentType | *Version*:1.1.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:GEM_ERPCHRG_VS_ConsentType |

 
Type of Consents for the ePrescription. 

 **References** 

* [GEM_ERPCHRG_PR_Consent](StructureDefinition-GEM-ERPCHRG-PR-Consent.md)

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
  "id" : "GEM-ERPCHRG-VS-ConsentType",
  "url" : "https://gematik.de/fhir/erpchrg/ValueSet/GEM_ERPCHRG_VS_ConsentType",
  "version" : "1.1.0-draft",
  "name" : "GEM_ERPCHRG_VS_ConsentType",
  "title" : "ValueSet of Consent Codes",
  "status" : "draft",
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
  "description" : "Type of Consents for the ePrescription.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType"
    }]
  }
}

```
