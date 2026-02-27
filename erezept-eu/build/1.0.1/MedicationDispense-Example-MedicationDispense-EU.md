# Resource Example-MedicationDispense-EU (MedicationDispense)



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense-EU",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-MedicationDispense"]
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
