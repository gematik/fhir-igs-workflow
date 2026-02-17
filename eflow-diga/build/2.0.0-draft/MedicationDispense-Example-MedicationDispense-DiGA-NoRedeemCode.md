# Medication Dispense DiGA without a redeem code - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Medication Dispense DiGA without a redeem code**

## Example MedicationDispense: Medication Dispense DiGA without a redeem code

Profile: [GEM ERP PR MedicationDispense DiGAversion: null2.0.0-draft)](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md)

**identifier**: `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId`/162.000.033.491.280.78

**status**: Completed

**medication**: ?rref?

**subject**: Identifier: NamingSystemKVID/X123456789

### Performers

| | |
| :--- | :--- |
| - | **Actor** |
| * | Identifier:`https://gematik.de/fhir/sid/telematik-id`/8-SMC-B-Testkarte-883110000095957 |

**whenHandedOver**: 2026-02-06

**note**: 

> 

Freischaltcode fuer DiGA konnte nicht erstellt werden




## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense-DiGA-NoRedeemCode",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA|2.0"
    ]
  },
  "identifier" : [
    {
      "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
      "value" : "162.000.033.491.280.78"
    }
  ],
  "status" : "completed",
  "medicationReference" : {
    "extension" : [
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
        "valueCode" : "asked-declined"
      }
    ]
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
  "whenHandedOver" : "2026-02-06",
  "note" : [
    {
      "text" : "Freischaltcode fuer DiGA konnte nicht erstellt werden"
    }
  ]
}

```
