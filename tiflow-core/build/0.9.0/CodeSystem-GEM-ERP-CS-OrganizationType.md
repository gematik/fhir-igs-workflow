# CodeSystem der Organisationstyp-Codes - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem der Organisationstyp-Codes**

## CodeSystem: CodeSystem der Organisationstyp-Codes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_CS_OrganizationType |
| **Copyright/Legal**: gematik GmbH | |

 
Typ der Organisation, bei der E-Rezepte eingelöst werden können. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_OrganizationType](ValueSet-GEM-ERP-VS-OrganizationType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-OrganizationType",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType",
  "version" : "0.9.0",
  "name" : "GEM_ERP_CS_OrganizationType",
  "title" : "CodeSystem der Organisationstyp-Codes",
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
  "description" : "Typ der Organisation, bei der E-Rezepte eingelöst werden können.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "urn:oid:1.2.276.0.76.4.54",
    "display" : "Öffentliche Apotheke"
  },
  {
    "code" : "urn:oid:1.2.276.0.76.4.59",
    "display" : "Kostenträger"
  }]
}

```
