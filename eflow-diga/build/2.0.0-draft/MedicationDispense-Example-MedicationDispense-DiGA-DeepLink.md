# Medication Dispense DiGA with a deep link. - Verordnungen fuer Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen fuer Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Medication Dispense DiGA with a deep link.**

## Example MedicationDispense: Medication Dispense DiGA with a deep link.

Profile: [GEM ERP PR MedicationDispense DiGAversion: null2.0.0-draft)](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md)

**GEM ERP EX RedeemCode**: DE12345678901234

**GEM ERP EX DeepLink**: [https://gematico.de?redeemCode=DE12345678901234](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=https://gematico.de?redeemCode=DE12345678901234)

**identifier**: `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId`/162.000.033.491.280.78

**status**: Completed

**medication**: Gematico Diabetestherapie (Identifier: `http://fhir.de/CodeSystem/ifa/pzn`/12345678)

**subject**: Identifier: NamingSystemKVID/X123456789

### Performers

| | |
| :--- | :--- |
| - | **Actor** |
| * | Identifier:`https://gematik.de/fhir/sid/telematik-id`/8-SMC-B-Testkarte-883110000095957 |

**whenHandedOver**: 2026-02-06



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense-DiGA-DeepLink",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA|2.0"
    ]
  },
  "extension" : [
    {
      "url" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode",
      "valueString" : "DE12345678901234"
    },
    {
      "url" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_DeepLink",
      "valueUrl" : "https://gematico.de?redeemCode=DE12345678901234"
    }
  ],
  "identifier" : [
    {
      "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
      "value" : "162.000.033.491.280.78"
    }
  ],
  "status" : "completed",
  "medicationReference" : {
    "identifier" : {
      "system" : "http://fhir.de/CodeSystem/ifa/pzn",
      "value" : "12345678"
    },
    "display" : "Gematico Diabetestherapie"
  },
  "subject" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X123456789"
    }
  },
  "performer" : [
    {
      "actor" : {
        "identifier" : {
          "system" : "https://gematik.de/fhir/sid/telematik-id",
          "value" : "8-SMC-B-Testkarte-883110000095957"
        }
      }
    }
  ],
  "whenHandedOver" : "2026-02-06"
}

```
