# ERP CapabilityStatement Environment ValueSet - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP CapabilityStatement Environment ValueSet**

## ValueSet: ERP CapabilityStatement Environment ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_CapabilityStatement_Environment | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_VS_CapabilityStatement_Environment |

 
Dieses ValueSet enthält alle zulässigen Umgebungskennzeichen für CapabilityStatements des E-Rezept-Fachdienstes und wird für die verpflichtende Kennzeichnung der Zielumgebung verwendet. 

 **References** 

* [GEM ERP EX CapabilityStatement Environment](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Environment.md)
* [GEM ERP EX CapabilityStatement Environment](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Environment.md)

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
  "id" : "GEM-ERP-VS-CapabilityStatement-Environment",
  "url" : "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_CapabilityStatement_Environment",
  "version" : "0.9.0",
  "name" : "GEM_ERP_VS_CapabilityStatement_Environment",
  "title" : "ERP CapabilityStatement Environment ValueSet",
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
  "description" : "Dieses ValueSet enthält alle zulässigen Umgebungskennzeichen für CapabilityStatements des E-Rezept-Fachdienstes und wird für die verpflichtende Kennzeichnung der Zielumgebung verwendet.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_CapabilityStatement_Environment"
    }]
  }
}

```
