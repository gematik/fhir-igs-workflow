# CodeSystem der Organisationstyp-Codes - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem der Organisationstyp-Codes**

## CodeSystem: CodeSystem der Organisationstyp-Codes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/eflow-rx-organizationtype | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxOrganizationTypeCS |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Typ der Organisation, bei der E-Rezepte eingelöst werden können. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [EFlowRxOrganizationTypeVS](ValueSet-eflow-rx-organizationtype.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "eflow-rx-organizationtype",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/eflow-rx-organizationtype",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxOrganizationTypeCS",
  "title" : "CodeSystem der Organisationstyp-Codes",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Typ der Organisation, bei der E-Rezepte eingelöst werden können.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "urn:oid:1.2.276.0.76.4.54",
      "display" : "Öffentliche Apotheke"
    },
    {
      "code" : "urn:oid:1.2.276.0.76.4.59",
      "display" : "Kostenträger"
    }
  ]
}

```
