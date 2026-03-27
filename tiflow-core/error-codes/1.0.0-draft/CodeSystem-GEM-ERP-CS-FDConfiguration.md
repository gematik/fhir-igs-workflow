# ERP FDConfiguration CodeSystem - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP FDConfiguration CodeSystem**

## CodeSystem: ERP FDConfiguration CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FDConfiguration | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_CS_FDConfiguration |
| **Copyright/Legal**: gematik GmbH | |

 
Dieses CodeSystem beschreibt Konfigurationskennzeichen des E-Rezept-Fachdienstes, deren Konzepte nicht in diesem IG-Paket gepflegt werden. Die konkrete Konzeptliste wird extern im gematik-Releaseprozess als Release-Artefakt verwaltet und versioniert; dieses IG referenziert diese Konzepte nur über das Canonical. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_FDConfiguration](ValueSet-GEM-ERP-VS-FDConfiguration.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-FDConfiguration",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FDConfiguration",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_CS_FDConfiguration",
  "title" : "ERP FDConfiguration CodeSystem",
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
  "description" : "Dieses CodeSystem beschreibt Konfigurationskennzeichen des E-Rezept-Fachdienstes, deren Konzepte nicht in diesem IG-Paket gepflegt werden. Die konkrete Konzeptliste wird extern im gematik-Releaseprozess als Release-Artefakt verwaltet und versioniert; dieses IG referenziert diese Konzepte nur über das Canonical.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH",
  "caseSensitive" : true,
  "content" : "not-present"
}

```
