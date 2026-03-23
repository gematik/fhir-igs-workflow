# Consent for ePrescriptions - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Consent for ePrescriptions**

## Resource Profile: Consent for ePrescriptions 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Consent | *Version*:0.9.0 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_Consent |

 
Records the consent of the patient for an operation in the context of ePrescription. 

**Usages:**

* Examples for this Profile: [Consent/f97a0772-c99f-4159-90c6-2a41c7d96779](Consent-f97a0772-c99f-4159-90c6-2a41c7d96779.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.xborder|current/StructureDefinition/GEM-ERPEU-PR-Consent)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-Consent.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-Consent.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-Consent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-Consent",
  "url" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Consent",
  "version" : "0.9.0",
  "name" : "GEM_ERPEU_PR_Consent",
  "title" : "Consent for ePrescriptions",
  "status" : "active",
  "date" : "2026-01-08",
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
  "description" : "Records the consent of the patient for an operation in the context of ePrescription.",
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
      "id" : "Consent.status",
      "path" : "Consent.status",
      "fixedCode" : "active"
    },
    {
      "id" : "Consent.scope.coding",
      "path" : "Consent.scope.coding",
      "min" : 1,
      "max" : "1"
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
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp-eu/ValueSet/GEM_ERPEU_VS_ConsentType"
      }
    },
    {
      "id" : "Consent.patient",
      "path" : "Consent.patient",
      "min" : 1
    },
    {
      "id" : "Consent.patient.identifier",
      "path" : "Consent.patient.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }]
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
      "mustSupport" : true
    },
    {
      "id" : "Consent.policyRule",
      "path" : "Consent.policyRule",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp-eu/ValueSet/GEM_ERPEU_VS_Consent_PolicyRule"
      }
    }]
  }
}

```
