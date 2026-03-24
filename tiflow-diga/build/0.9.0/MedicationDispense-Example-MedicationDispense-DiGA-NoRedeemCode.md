# Medication Dispense DiGA without a redeem code - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Medication Dispense DiGA without a redeem code**

## Example MedicationDispense: Medication Dispense DiGA without a redeem code

Profile: [GEM ERP PR MedicationDispense DiGA](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md)

**identifier**: `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId`/162.000.033.491.280.78

**status**: Completed

**medication**: ?rref?

**subject**: Identifier: NamingSystemKVID/X123456789

### Performers

| | |
| :--- | :--- |
| - | **Actor** |
| * | Identifier:`https://gematik.de/fhir/sid/telematik-id`/8-SMC-B-Testkarte-883110000095957 |

**whenHandedOver**: 2026-07-01

**note**: 

> 

Freischaltcode für DiGA konnte nicht erstellt werden




## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense-DiGA-NoRedeemCode",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/diga/StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA"]
  },
  "identifier" : [{
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
    "value" : "162.000.033.491.280.78"
  }],
  "status" : "completed",
  "medicationReference" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
      "valueCode" : "asked-declined"
    }]
  },
  "subject" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X123456789"
    }
  },
  "performer" : [{
    "actor" : {
      "identifier" : {
        "system" : "https://gematik.de/fhir/sid/telematik-id",
        "value" : "8-SMC-B-Testkarte-883110000095957"
      }
    }
  }],
  "whenHandedOver" : "2026-07-01",
  "note" : [{
    "text" : "Freischaltcode für DiGA konnte nicht erstellt werden"
  }]
}

```
