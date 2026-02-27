# EU-Medication - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **EU-Medication**

## Resource Profile: EU-Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Medication | *Version*:1.0.1 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_Medication |

 
Medication of a Prescription or Dispensation from the EU 

**Usages:**

* Use this Profile: [GEM ERP PR EU CloseOperation Input](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.md)
* Refer to this Profile: [Dispensation of the Prescription from the EU](StructureDefinition-GEM-ERPEU-PR-MedicationDispense.md)
* Examples for this Profile: [Medication/Medication-Without-Strength-Code](Medication-Medication-Without-Strength-Code.md), [Medication/Medication-Without-Strength-Numerator](Medication-Medication-Without-Strength-Numerator.md), [Medication/SimpleMedication](Medication-SimpleMedication.md) and [Medication/SumatripanMedication](Medication-SumatripanMedication.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.erezept.eu|current/StructureDefinition/GEM-ERPEU-PR-Medication)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-Medication.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-Medication.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-Medication.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-Medication",
  "url" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Medication",
  "version" : "1.0.1",
  "name" : "GEM_ERPEU_PR_Medication",
  "title" : "EU-Medication",
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
  "description" : "Medication of a Prescription or Dispensation from the EU",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "script10.6",
    "uri" : "http://ncpdp.org/SCRIPT10_6",
    "name" : "Mapping to NCPDP SCRIPT 10.6"
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
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Medication",
  "baseDefinition" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Medication",
      "path" : "Medication"
    },
    {
      "id" : "Medication.extension:packageIdentifier",
      "path" : "Medication.extension",
      "sliceName" : "packageIdentifier",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-EX-MedicinalPackageIdentifier"]
      }]
    },
    {
      "id" : "Medication.extension:packageDescription",
      "path" : "Medication.extension",
      "sliceName" : "packageDescription",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-EX-MedicinalPackageDescription"]
      }]
    }]
  }
}

```
