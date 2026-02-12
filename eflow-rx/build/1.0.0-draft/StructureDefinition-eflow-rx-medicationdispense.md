# GEM ERP PR MedicationDispense - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR MedicationDispense**

## Resource Profile: GEM ERP PR MedicationDispense 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medicationdispense | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxMedicationDispense |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dispensierung eines E-Rezepts 

**Usages:**

* Use this Profile: [GEM ERP PR CloseOperation Input](StructureDefinition-eflow-rx-close-operation-input-parameters.md) and [GEM ERP PR DispenseOperation Input](StructureDefinition-eflow-rx-dispense-operation-input-parameters.md)
* Examples for this Profile: [MedicationDispense/Example-MedicationDispense-2](MedicationDispense-Example-MedicationDispense-2.md), [MedicationDispense/Example-MedicationDispense-Dosage-comb-dayofweek](MedicationDispense-Example-MedicationDispense-Dosage-comb-dayofweek.md), [MedicationDispense/Example-MedicationDispense-Dosage-comb-interval](MedicationDispense-Example-MedicationDispense-Dosage-comb-interval.md), [MedicationDispense/Example-MedicationDispense-Dosage-interval](MedicationDispense-Example-MedicationDispense-Dosage-interval.md)... Show 7 more, [MedicationDispense/Example-MedicationDispense-Dosage-tageszeit](MedicationDispense-Example-MedicationDispense-Dosage-tageszeit.md), [MedicationDispense/Example-MedicationDispense-Dosage-uhrzeit](MedicationDispense-Example-MedicationDispense-Dosage-uhrzeit.md), [MedicationDispense/Example-MedicationDispense-Dosage-weekday](MedicationDispense-Example-MedicationDispense-Dosage-weekday.md), [MedicationDispense/Example-MedicationDispense-Kombipackung](MedicationDispense-Example-MedicationDispense-Kombipackung.md), [MedicationDispense/Example-MedicationDispense-Rezeptur](MedicationDispense-Example-MedicationDispense-Rezeptur.md), [MedicationDispense/Example-MedicationDispense-Without-Medication](MedicationDispense-Example-MedicationDispense-Without-Medication.md) and [MedicationDispense/Example-MedicationDispense](MedicationDispense-Example-MedicationDispense.md)
* CapabilityStatements using this Profile: [ERP Capability Statement für Clients des E-Rezept-Fachdienst](CapabilityStatement-erp-fachdienst-client.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-medicationdispense)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-medicationdispense.csv), [Excel](StructureDefinition-eflow-rx-medicationdispense.xlsx), [Schematron](StructureDefinition-eflow-rx-medicationdispense.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-medicationdispense",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medicationdispense",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxMedicationDispense",
  "title" : "GEM ERP PR MedicationDispense",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
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
  "description" : "Dispensierung eines E-Rezepts",
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
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationDispense",
  "baseDefinition" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-dispense",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "MedicationDispense",
        "path" : "MedicationDispense",
        "constraint" : [
          {
            "key" : "workflow-dosageExtensionBeiDosierung",
            "severity" : "error",
            "human" : "Wenn eine Dosierung angegeben wurde, muss der generierte Dosierungstext, sowie die Metainformationen zur Generierung angegeben werden.",
            "expression" : "dosageInstruction.exists() implies extension.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction').exists() and extension.where(url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta').exists()",
            "source" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medicationdispense"
          }
        ]
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
        "type" : [
          {
            "code" : "Identifier",
            "profile" : [
              "https://gematik.de/fhir/ti/StructureDefinition/e-prescription-id"
            ]
          }
        ],
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
        "definition" : "Die MedicationDispense verweist auf ein Medikament, das abgegeben wurde.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medication"
            ]
          }
        ]
      },
      {
        "id" : "MedicationDispense.performer.actor.identifier",
        "path" : "MedicationDispense.performer.actor.identifier",
        "min" : 1,
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id"]
          }
        ]
      },
      {
        "id" : "MedicationDispense.whenPrepared",
        "path" : "MedicationDispense.whenPrepared",
        "constraint" : [
          {
            "key" : "workflow-abgabeDatumsFormat",
            "severity" : "error",
            "human" : "Wert muss ein Datum in der Form: YYYY-MM-DD sein.",
            "expression" : "toString().length()=10",
            "source" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medicationdispense"
          }
        ],
        "mustSupport" : false
      },
      {
        "id" : "MedicationDispense.whenHandedOver",
        "path" : "MedicationDispense.whenHandedOver",
        "constraint" : [
          {
            "key" : "workflow-abgabeDatumsFormat",
            "severity" : "error",
            "human" : "Wert muss ein Datum in der Form: YYYY-MM-DD sein.",
            "expression" : "toString().length()=10",
            "source" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medicationdispense"
          }
        ]
      }
    ]
  }
}

```
