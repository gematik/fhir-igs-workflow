# GEM_ERPCHRG_PR_Consent - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM_ERPCHRG_PR_Consent**

## Resource Profile: GEM_ERPCHRG_PR_Consent 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent | *Version*:1.1.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:GEM_ERPCHRG_PR_Consent |

**Usages:**

* Examples for this Profile: [Consent/0dcc5d4c-bf24-4c06-b02e-be5bc24587e2](Consent-0dcc5d4c-bf24-4c06-b02e-be5bc24587e2.md) and [Consent/ChargeItemConsent-Request](Consent-ChargeItemConsent-Request.md)
* CapabilityStatements using this Profile: [ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst](CapabilityStatement-erp-fachdienst-server-erpchrg.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-chargeitem|current/StructureDefinition/GEM-ERPCHRG-PR-Consent)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPCHRG-PR-Consent.csv), [Excel](StructureDefinition-GEM-ERPCHRG-PR-Consent.xlsx), [Schematron](StructureDefinition-GEM-ERPCHRG-PR-Consent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPCHRG-PR-Consent",
  "url" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent",
  "version" : "1.1.0-draft",
  "name" : "GEM_ERPCHRG_PR_Consent",
  "status" : "draft",
  "experimental" : false,
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
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Consent",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Consent",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Consent",
      "path" : "Consent"
    },
    {
      "id" : "Consent.meta",
      "path" : "Consent.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Consent.meta.profile",
      "path" : "Consent.meta.profile",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "$this"
        }],
        "description" : "Slicing for meta profile",
        "ordered" : false,
        "rules" : "closed"
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Consent.meta.profile:erpchrgProfile",
      "path" : "Consent.meta.profile",
      "sliceName" : "erpchrgProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent|1.1",
      "mustSupport" : true
    },
    {
      "id" : "Consent.status",
      "path" : "Consent.status",
      "fixedCode" : "active"
    },
    {
      "id" : "Consent.scope.coding",
      "path" : "Consent.scope.coding",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Consent.scope.coding.system",
      "path" : "Consent.scope.coding.system",
      "fixedUri" : "http://terminology.hl7.org/CodeSystem/consentscope"
    },
    {
      "id" : "Consent.scope.coding.code",
      "path" : "Consent.scope.coding.code",
      "fixedCode" : "patient-privacy"
    },
    {
      "id" : "Consent.scope.coding.display",
      "path" : "Consent.scope.coding.display",
      "fixedString" : "Privacy Consent"
    },
    {
      "id" : "Consent.category",
      "path" : "Consent.category",
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erpchrg/ValueSet/GEM_ERPCHRG_VS_ConsentType"
      }
    },
    {
      "id" : "Consent.patient",
      "path" : "Consent.patient",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Consent.patient.identifier",
      "path" : "Consent.patient.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Consent.patient.identifier.assigner",
      "path" : "Consent.patient.identifier.assigner",
      "mustSupport" : true
    },
    {
      "id" : "Consent.patient.identifier.assigner.identifier",
      "path" : "Consent.patient.identifier.assigner.identifier",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-iknr"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Consent.dateTime",
      "path" : "Consent.dateTime",
      "comment" : "dateTime wird vom E-Rezept-Fachdienst zu dem Zeitpunkt gesetzt, an dem die Consent Ressource hochgeladen wird.",
      "mustSupport" : true
    },
    {
      "id" : "Consent.policyRule",
      "path" : "Consent.policyRule",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://terminology.hl7.org/ValueSet/v3-ActCode"
      }
    }]
  }
}

```
