# GEMErpPrMedicationMap - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEMErpPrMedicationMap**

## StructureMap: GEMErpPrMedicationMap 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/structure-comparer/StructureMap/GEMErpPrMedicationMap | *Version*:0.9.0 |
| Active as of 2026-02-02 | *Computable Name*:GEMErpPrMedicationMap |

 

| | | |
| :--- | :--- | :--- |
| Auto-generated StructureMap for GEM_ERP_PR_Medication | 1.6.1 -> EPAMedication | 1.3.0 |

 

**(Keine bedeutsamen Transformationen gefunden - nur direkte Kopien)**



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "GEMErpPrMedicationMap",
  "url" : "https://gematik.de/fhir/structure-comparer/StructureMap/GEMErpPrMedicationMap",
  "version" : "0.9.0",
  "name" : "GEMErpPrMedicationMap",
  "status" : "active",
  "date" : "2026-02-02",
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
  "description" : "Auto-generated StructureMap for GEM_ERP_PR_Medication|1.6.1 -> EPAMedication|1.3.0",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication",
    "mode" : "source",
    "alias" : "GEMERPPRMedication"
  },
  {
    "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication",
    "mode" : "target",
    "alias" : "EPAMedication"
  }],
  "group" : [{
    "name" : "GEMErpPrMedicationMap",
    "typeMode" : "types",
    "documentation" : "Mapping generated for GEM_ERP_PR_Medication|1.6.1 -> EPAMedication|1.3.0",
    "input" : [{
      "name" : "GEMERPPRMedication",
      "type" : "GEMERPPRMedication",
      "mode" : "source"
    },
    {
      "name" : "EPAMedication",
      "type" : "EPAMedication",
      "mode" : "target"
    }]
  }]
}

```
