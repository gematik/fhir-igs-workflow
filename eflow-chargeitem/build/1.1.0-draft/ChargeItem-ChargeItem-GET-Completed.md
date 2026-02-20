# ChargeItem with Bundles completed by Fachdienst - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ChargeItem with Bundles completed by Fachdienst**

## Example ChargeItem: ChargeItem with Bundles completed by Fachdienst

Profile: [GEM_ERPCHRG_PR_ChargeItemversion: null1.1.0-draft)](StructureDefinition-GEM-ERPCHRG-PR-ChargeItem.md)

> **GEM_ERPCHRG_EX_MarkingFlag**
* insuranceProvider: false
* subsidy: false
* taxOffice: false

**identifier**: `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId`/200.000.000.000.000.01, `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode`/777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea

**status**: Billable

**code**: Not Applicable

**subject**: Identifier: NamingSystemKVID/P987654321

**enterer**: Identifier: `https://gematik.de/fhir/sid/telematik-id`/3-2-APO-XanthippeVeilchenblau01

**enteredDate**: 2025-10-01 15:29:00+0000

**supportingInformation**: 

* [http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.2&canonical=http://fhir.org/packages/de.basisprofil.r4/Bundle/72bd741c-7ad8-41d8-97c3-9aabbdd0f5b4)
* [https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.2&canonical=http://fhir.org/packages/de.basisprofil.r4/Bundle/200.000.000.000.000.01)
* [https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.2&canonical=http://fhir.org/packages/de.basisprofil.r4/Bundle/0428d416-149e-48a4-977c-394887b3d85c)



## Resource Content

```json
{
  "resourceType" : "ChargeItem",
  "id" : "ChargeItem-GET-Completed",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem|1.1"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "insuranceProvider",
      "valueBoolean" : false
    },
    {
      "url" : "subsidy",
      "valueBoolean" : false
    },
    {
      "url" : "taxOffice",
      "valueBoolean" : false
    }],
    "url" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_EX_MarkingFlag"
  }],
  "identifier" : [{
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
    "value" : "200.000.000.000.000.01"
  },
  {
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode",
    "value" : "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
  }],
  "status" : "billable",
  "code" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/data-absent-reason",
      "code" : "not-applicable"
    }]
  },
  "subject" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "P987654321"
    }
  },
  "enterer" : {
    "identifier" : {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "3-2-APO-XanthippeVeilchenblau01"
    }
  },
  "enteredDate" : "2025-10-01T15:29:00.434+00:00",
  "supportingInformation" : [{
    "reference" : "Bundle/72bd741c-7ad8-41d8-97c3-9aabbdd0f5b4",
    "display" : "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle"
  },
  {
    "reference" : "Bundle/200.000.000.000.000.01",
    "display" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle"
  },
  {
    "reference" : "Bundle/0428d416-149e-48a4-977c-394887b3d85c",
    "display" : "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
  }]
}

```
