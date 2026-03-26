# Example Medication Dispense - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Medication Dispense**

## Example MedicationDispense: Example Medication Dispense

Profile: [Dispensation of the Prescription from the EU](StructureDefinition-GEM-ERPEU-PR-MedicationDispense.md)

**identifier**: `https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId`/160.000.033.491.280.78

**status**: Completed

**medication**: [Medication 06313728](Medication-SumatripanMedication.md)

**subject**: Identifier: NamingSystemKVID/X123456789

### Performers

| | |
| :--- | :--- |
| - | **Actor** |
| * | [PractitionerRole](PractitionerRole-Example-EU-PractitionerRole.md) |

**quantity**: 2 pkg

**whenHandedOver**: 2026-10-01



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense-EU",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-MedicationDispense"]
  },
  "identifier" : [{
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
    "value" : "160.000.033.491.280.78"
  }],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/SumatripanMedication"
  },
  "subject" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X123456789"
    }
  },
  "performer" : [{
    "actor" : {
      "reference" : "PractitionerRole/Example-EU-PractitionerRole"
    }
  }],
  "quantity" : {
    "value" : 2,
    "unit" : "pkg"
  },
  "whenHandedOver" : "2026-10-01"
}

```
