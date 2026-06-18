# TIFHIR Configuration CS - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFHIR Configuration CS**

## CodeSystem: TIFHIR Configuration CS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/CodeSystem/ti-fhir-configuration-cs | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-01 | *Computable Name*:TIFHIRConfigurationCS |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses CodeSystem beschreibt die FHIR-Konfigurationen eines FHIR-Data Service der TI. Die konkrete Konzeptliste wird extern im gematik-Releaseprozess als Release-Artefakt verwaltet und versioniert; dieser IG referenziert diese Konzepte nur über das Canonical. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TIFHIRConfigurationVS](ValueSet-ti-fhir-configuration-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ti-fhir-configuration-cs",
  "url" : "https://gematik.de/fhir/tiflow/CodeSystem/ti-fhir-configuration-cs",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFHIRConfigurationCS",
  "title" : "TIFHIR Configuration CS",
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
  "description" : "Dieses CodeSystem beschreibt die FHIR-Konfigurationen eines FHIR-Data Service der TI. Die konkrete Konzeptliste wird extern im gematik-Releaseprozess als Release-Artefakt verwaltet und versioniert; dieser IG referenziert diese Konzepte nur über das Canonical.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "caseSensitive" : true,
  "content" : "not-present"
}

```
