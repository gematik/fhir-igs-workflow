# GEMErpPrMedicationdispenseMap - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEMErpPrMedicationdispenseMap**

## StructureMap: GEMErpPrMedicationdispenseMap 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/structure-comparer/StructureMap/GEMErpPrMedicationdispenseMap | *Version*:1.0.0-draft |
| Active as of 2026-02-02 | *Computable Name*:GEMErpPrMedicationdispenseMap |

 

| | | |
| :--- | :--- | :--- |
| Auto-generated StructureMap for GEM_ERP_PR_MedicationDispense | 1.6.1 -> EPAMedicationDispense | 1.3.0 |

 

**(Keine bedeutsamen Transformationen gefunden - nur direkte Kopien)**



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "GEMErpPrMedicationdispenseMap",
  "url" : "https://gematik.de/fhir/structure-comparer/StructureMap/GEMErpPrMedicationdispenseMap",
  "version" : "1.0.0-draft",
  "name" : "GEMErpPrMedicationdispenseMap",
  "status" : "active",
  "date" : "2026-02-02",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Auto-generated StructureMap for GEM_ERP_PR_MedicationDispense|1.6.1 -> EPAMedicationDispense|1.3.0",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "structure" : [
    {
      "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense",
      "mode" : "source",
      "alias" : "GEMERPPRMedicationDispense"
    },
    {
      "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-dispense",
      "mode" : "target",
      "alias" : "EPAMedicationDispense"
    }
  ],
  "group" : [
    {
      "name" : "GEMErpPrMedicationdispenseMap",
      "typeMode" : "types",
      "documentation" : "Mapping generated for GEM_ERP_PR_MedicationDispense|1.6.1 -> EPAMedicationDispense|1.3.0",
      "input" : [
        {
          "name" : "GEMERPPRMedicationDispense",
          "type" : "GEMERPPRMedicationDispense",
          "mode" : "source"
        },
        {
          "name" : "EPAMedicationDispense",
          "type" : "EPAMedicationDispense",
          "mode" : "target"
        }
      ]
    }
  ]
}

```
