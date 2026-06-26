# GEM ERP PR MedicationDispense - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR MedicationDispense**

## Resource Profile: GEM ERP PR MedicationDispense 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERP_PR_MedicationDispense |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dispensierung eines E-Rezepts 

**Usages:**

* Examples for this Profile: [MedicationDispense/Example-MedicationDispense-2](MedicationDispense-Example-MedicationDispense-2.md), [MedicationDispense/Example-MedicationDispense-Dosage-comb-dayofweek](MedicationDispense-Example-MedicationDispense-Dosage-comb-dayofweek.md), [MedicationDispense/Example-MedicationDispense-Dosage-comb-interval](MedicationDispense-Example-MedicationDispense-Dosage-comb-interval.md), [MedicationDispense/Example-MedicationDispense-Dosage-interval](MedicationDispense-Example-MedicationDispense-Dosage-interval.md)... Show 7 more, [MedicationDispense/Example-MedicationDispense-Dosage-tageszeit](MedicationDispense-Example-MedicationDispense-Dosage-tageszeit.md), [MedicationDispense/Example-MedicationDispense-Dosage-uhrzeit](MedicationDispense-Example-MedicationDispense-Dosage-uhrzeit.md), [MedicationDispense/Example-MedicationDispense-Dosage-weekday](MedicationDispense-Example-MedicationDispense-Dosage-weekday.md), [MedicationDispense/Example-MedicationDispense-Kombipackung](MedicationDispense-Example-MedicationDispense-Kombipackung.md), [MedicationDispense/Example-MedicationDispense-Rezeptur](MedicationDispense-Example-MedicationDispense-Rezeptur.md), [MedicationDispense/Example-MedicationDispense-Without-Medication](MedicationDispense-Example-MedicationDispense-Without-Medication.md) and [MedicationDispense/Example-MedicationDispense](MedicationDispense-Example-MedicationDispense.md)
* CapabilityStatements using this Profile: [TIFlow Fachdienst Server Capabilities](CapabilityStatement-ti-flow-fachdienst-server-rx.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.erezept|current/StructureDefinition/StructureDefinition-GEM-ERP-PR-MedicationDispense.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-MedicationDispense.csv), [Excel](StructureDefinition-GEM-ERP-PR-MedicationDispense.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-MedicationDispense.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-MedicationDispense",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_PR_MedicationDispense",
  "title" : "GEM ERP PR MedicationDispense",
  "status" : "active",
  "experimental" : false,
  "date" : "2028-04-01",
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
  "description" : "Dispensierung eines E-Rezepts",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
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
  "baseDefinition" : "https://gematik.de/fhir/ti/StructureDefinition/ti-medication-dispense-dgmp",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationDispense",
      "path" : "MedicationDispense",
      "constraint" : [{
        "key" : "workflow-dosageExtensionBeiDosierung",
        "severity" : "error",
        "human" : "Wenn eine Dosierung angegeben wurde, muss der generierte Dosierungstext, sowie die Metainformationen zur Generierung angegeben werden.",
        "expression" : "dosageInstruction.exists() implies extension.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction').exists() and extension.where(url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta').exists()",
        "source" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
      }]
    },
    {
      "id" : "MedicationDispense.meta",
      "path" : "MedicationDispense.meta",
      "min" : 1
    },
    {
      "id" : "MedicationDispense.meta.profile",
      "path" : "MedicationDispense.meta.profile",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "$this"
        }],
        "description" : "Slicing für meta profile",
        "ordered" : false,
        "rules" : "closed"
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.meta.profile:workflowProfile",
      "path" : "MedicationDispense.meta.profile",
      "sliceName" : "workflowProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|2.0",
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.identifier",
      "path" : "MedicationDispense.identifier",
      "short" : "E-Rezept-ID",
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
      "id" : "MedicationDispense.partOf",
      "path" : "MedicationDispense.partOf",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.status",
      "path" : "MedicationDispense.status",
      "short" : "completed",
      "fixedCode" : "completed"
    },
    {
      "id" : "MedicationDispense.statusReason[x]",
      "path" : "MedicationDispense.statusReason[x]",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.medication[x]",
      "path" : "MedicationDispense.medication[x]",
      "definition" : "Die MedicationDispense verweist auf ein Medikament, das abgegeben wurde.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"]
      }]
    },
    {
      "id" : "MedicationDispense.context",
      "path" : "MedicationDispense.context",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.supportingInformation",
      "path" : "MedicationDispense.supportingInformation",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.performer.actor.identifier",
      "path" : "MedicationDispense.performer.actor.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id"]
      }]
    },
    {
      "id" : "MedicationDispense.location",
      "path" : "MedicationDispense.location",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.type",
      "path" : "MedicationDispense.type",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.quantity",
      "path" : "MedicationDispense.quantity",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.daysSupply",
      "path" : "MedicationDispense.daysSupply",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.whenPrepared",
      "path" : "MedicationDispense.whenPrepared",
      "constraint" : [{
        "key" : "workflow-abgabeDatumsFormat",
        "severity" : "error",
        "human" : "Wert muss ein Datum in der Form: YYYY-MM-DD sein.",
        "expression" : "toString().length()=10",
        "source" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
      }],
      "mustSupport" : false
    },
    {
      "id" : "MedicationDispense.whenHandedOver",
      "path" : "MedicationDispense.whenHandedOver",
      "constraint" : [{
        "key" : "workflow-abgabeDatumsFormat",
        "severity" : "error",
        "human" : "Wert muss ein Datum in der Form: YYYY-MM-DD sein.",
        "expression" : "toString().length()=10",
        "source" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
      }]
    },
    {
      "id" : "MedicationDispense.destination",
      "path" : "MedicationDispense.destination",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.note",
      "path" : "MedicationDispense.note",
      "short" : "Abgabehinweise"
    },
    {
      "id" : "MedicationDispense.substitution.wasSubstituted",
      "path" : "MedicationDispense.substitution.wasSubstituted",
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.substitution.type",
      "path" : "MedicationDispense.substitution.type",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.substitution.reason",
      "path" : "MedicationDispense.substitution.reason",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.substitution.responsibleParty",
      "path" : "MedicationDispense.substitution.responsibleParty",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.detectedIssue",
      "path" : "MedicationDispense.detectedIssue",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.eventHistory",
      "path" : "MedicationDispense.eventHistory",
      "max" : "0"
    }]
  }
}

```
