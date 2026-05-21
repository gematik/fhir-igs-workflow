# ERP FDConfiguration ValueSet - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP FDConfiguration ValueSet**

## ValueSet: ERP FDConfiguration ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_FDConfiguration | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_VS_FDConfiguration |

 
Dieses ValueSet bildet den zulässigen Wertebereich für Konfigurationskennzeichen des E-Rezept-Fachdienstes ab und inkludiert alle Codes aus GEM_ERP_CS_FDConfiguration. 

 **References** 

* [GEM ERP EX CapabilityStatement FDConfiguration](StructureDefinition-GEM-ERP-EX-CapabilityStatement-FDConfiguration.md)

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
  "id" : "GEM-ERP-VS-FDConfiguration",
  "url" : "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_FDConfiguration",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_VS_FDConfiguration",
  "title" : "ERP FDConfiguration ValueSet",
  "status" : "draft",
  "date" : "2025-09-25",
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
  "description" : "Dieses ValueSet bildet den zulässigen Wertebereich für Konfigurationskennzeichen des E-Rezept-Fachdienstes ab und inkludiert alle Codes aus GEM_ERP_CS_FDConfiguration.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FDConfiguration"
    }]
  }
}

```
