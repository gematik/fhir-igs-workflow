# Dispensation of the Prescription from the EU - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Dispensation of the Prescription from the EU**

## Resource Profile: Dispensation of the Prescription from the EU 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-MedicationDispense | *Version*:1.0.0-draft |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_MedicationDispense |

 
Handles information about the redeem of the prescription and the submited medication from the EU. 

**Usages:**

* Use this Profile: [GEM ERP PR EU CloseOperation Input](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.md)
* Examples for this Profile: [MedicationDispense/Example-MedicationDispense-EU](MedicationDispense-Example-MedicationDispense-EU.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.xborder|current/StructureDefinition/GEM-ERPEU-PR-MedicationDispense)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-MedicationDispense.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-MedicationDispense.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-MedicationDispense.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-MedicationDispense",
  "url" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-MedicationDispense",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERPEU_PR_MedicationDispense",
  "title" : "Dispensation of the Prescription from the EU",
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
  "description" : "Handles information about the redeem of the prescription and the submited medication from the EU.",
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
    "identity" : "rx-dispense-rmim",
    "uri" : "http://www.hl7.org/v3/PORX_RM020070UV",
    "name" : "V3 Pharmacy Dispense RMIM"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationDispense",
  "baseDefinition" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-dispense",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationDispense",
      "path" : "MedicationDispense"
    },
    {
      "id" : "MedicationDispense.identifier",
      "path" : "MedicationDispense.identifier",
      "short" : "ePrescription identifier",
      "min" : 1
    },
    {
      "id" : "MedicationDispense.identifier:prescriptionID",
      "path" : "MedicationDispense.identifier",
      "sliceName" : "prescriptionID",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/e-prescription-id"]
      }],
      "patternIdentifier" : {
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      }
    },
    {
      "id" : "MedicationDispense.status",
      "path" : "MedicationDispense.status",
      "short" : "completed",
      "fixedCode" : "completed"
    },
    {
      "id" : "MedicationDispense.medication[x]",
      "path" : "MedicationDispense.medication[x]",
      "definition" : "The MedicationDispense references a medication which was dispensed",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Medication"]
      }]
    },
    {
      "id" : "MedicationDispense.performer",
      "path" : "MedicationDispense.performer",
      "definition" : "References a pracitioner role in order to state practitioner and organization information"
    },
    {
      "id" : "MedicationDispense.performer.actor",
      "path" : "MedicationDispense.performer.actor",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PractitionerRole"]
      }]
    },
    {
      "id" : "MedicationDispense.quantity",
      "path" : "MedicationDispense.quantity",
      "short" : "Number of dispensed packages/ units",
      "constraint" : [{
        "key" : "erp-eu-positiveAnzahlPackungen",
        "severity" : "error",
        "human" : "Der Wert der Packungen muss positiv sein (größer gleich 0).",
        "expression" : "value>=0",
        "source" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-MedicationDispense"
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.quantity.value",
      "path" : "MedicationDispense.quantity.value",
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.quantity.unit",
      "path" : "MedicationDispense.quantity.unit",
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.whenPrepared",
      "path" : "MedicationDispense.whenPrepared",
      "constraint" : [{
        "key" : "erp-eu-abgabeDatumsFormat",
        "severity" : "error",
        "human" : "Wert muss ein Datum in der Form: YYYY-MM-DD sein.",
        "expression" : "toString().length()=10",
        "source" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-MedicationDispense"
      }]
    },
    {
      "id" : "MedicationDispense.whenHandedOver",
      "path" : "MedicationDispense.whenHandedOver",
      "constraint" : [{
        "key" : "erp-eu-abgabeDatumsFormat",
        "severity" : "error",
        "human" : "Wert muss ein Datum in der Form: YYYY-MM-DD sein.",
        "expression" : "toString().length()=10",
        "source" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-MedicationDispense"
      }]
    },
    {
      "id" : "MedicationDispense.substitution.wasSubstituted",
      "path" : "MedicationDispense.substitution.wasSubstituted",
      "short" : "Indicates whether a substitution was made on the dispensed medication",
      "mustSupport" : true
    }]
  }
}

```
