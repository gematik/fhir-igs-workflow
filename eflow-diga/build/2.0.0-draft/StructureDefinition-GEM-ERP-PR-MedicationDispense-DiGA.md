# GEM ERP PR MedicationDispense DiGA - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR MedicationDispense DiGA**

## Resource Profile: GEM ERP PR MedicationDispense DiGA 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA | *Version*:2.0.0-draft |
| Draft as of 2026-02-06 | *Computable Name*:GEM_ERP_PR_MedicationDispense_DiGA |

 
Dispensierung einer DiGA-Verordnung 

**Usages:**

* Use this Profile: [GEM ERP PR CloseOperation Input](StructureDefinition-GEM-ERP-PR-PAR-CloseOperation-Input.md)
* Examples for this Profile: [MedicationDispense/Example-MedicationDispense-DiGA-DeepLink](MedicationDispense-Example-MedicationDispense-DiGA-DeepLink.md), [MedicationDispense/Example-MedicationDispense-DiGA-Name-And-PZN](MedicationDispense-Example-MedicationDispense-DiGA-Name-And-PZN.md) and [MedicationDispense/Example-MedicationDispense-DiGA-NoRedeemCode](MedicationDispense-Example-MedicationDispense-DiGA-NoRedeemCode.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-diga|current/StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.csv), [Excel](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-MedicationDispense-DiGA",
  "url" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA",
  "version" : "2.0.0-draft",
  "name" : "GEM_ERP_PR_MedicationDispense_DiGA",
  "title" : "GEM ERP PR MedicationDispense DiGA",
  "status" : "draft",
  "date" : "2026-02-06",
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
  "description" : "Dispensierung einer DiGA-Verordnung",
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
            "key" : "workflow-medicationdispense-redeemcode-1",
            "severity" : "error",
            "human" : "Eine Notiz wurde nicht gefunden, ist jedoch obligatorisch, wenn kein Einloesecode angegeben wird.",
            "expression" : "extension.where(url = 'https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode').empty() implies note.exists()",
            "source" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA"
          },
          {
            "key" : "workflow-medicationdispense-redeemcode-2",
            "severity" : "error",
            "human" : "Der Grund fuer fehlende Daten wurde nicht gefunden, ist jedoch obligatorisch, wenn kein Einloesecode angegeben wird.",
            "expression" : "extension.where(url = 'https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode').empty() implies medication.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()",
            "source" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA"
          },
          {
            "key" : "workflow-medicationdispense-redeemcode-3",
            "severity" : "error",
            "human" : "Name und Kennung der DiGA wurden nicht gefunden, sind jedoch obligatorisch, wenn ein Einloesecode angegeben wird.",
            "expression" : "extension.where(url = 'https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode').exists() implies (medication.display.exists() and medication.identifier.exists())",
            "source" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA"
          }
        ]
      },
      {
        "id" : "MedicationDispense.extension:redeemCode",
        "path" : "MedicationDispense.extension",
        "sliceName" : "redeemCode",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode"
            ]
          }
        ]
      },
      {
        "id" : "MedicationDispense.extension:deepLink",
        "path" : "MedicationDispense.extension",
        "sliceName" : "deepLink",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_DeepLink"
            ]
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
        "definition" : "Informationen ueber das Medikament, das abgegeben wird. Dazu gehoeren der Name und die PZN-Kennzeichnung einer DiGA-Verordnungseinheit."
      },
      {
        "id" : "MedicationDispense.medication[x].extension:data-absent-reason",
        "path" : "MedicationDispense.medication[x].extension",
        "sliceName" : "data-absent-reason",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/data-absent-reason"]
          }
        ]
      },
      {
        "id" : "MedicationDispense.medication[x].extension:data-absent-reason.value[x]",
        "path" : "MedicationDispense.medication[x].extension.value[x]",
        "patternCode" : "asked-declined"
      },
      {
        "id" : "MedicationDispense.medication[x].identifier",
        "path" : "MedicationDispense.medication[x].identifier",
        "short" : "Eindeutige Identifikationsnummer fuer eine Verschreibungseinheit einer DiGA (PZN).",
        "mustSupport" : true
      },
      {
        "id" : "MedicationDispense.medication[x].identifier.system",
        "path" : "MedicationDispense.medication[x].identifier.system",
        "min" : 1,
        "fixedUri" : "http://fhir.de/CodeSystem/ifa/pzn",
        "mustSupport" : true
      },
      {
        "id" : "MedicationDispense.medication[x].identifier.value",
        "path" : "MedicationDispense.medication[x].identifier.value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "MedicationDispense.medication[x].display",
        "path" : "MedicationDispense.medication[x].display",
        "short" : "Name der DiGA-Verschreibungseinheit.",
        "mustSupport" : true
      },
      {
        "id" : "MedicationDispense.performer.actor",
        "path" : "MedicationDispense.performer.actor",
        "mustSupport" : true
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
        "id" : "MedicationDispense.whenHandedOver",
        "path" : "MedicationDispense.whenHandedOver",
        "short" : "Abgabedatum",
        "constraint" : [
          {
            "key" : "workflow-abgabeDatumsFormat",
            "severity" : "error",
            "human" : "Wert muss ein Datum in der Form: YYYY-MM-DD sein.",
            "expression" : "toString().length()=10",
            "source" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-PR-MedicationDispense-DiGA"
          }
        ]
      },
      {
        "id" : "MedicationDispense.substitution",
        "path" : "MedicationDispense.substitution",
        "comment" : "Laut Bundesamt fuer Soziale Sicherung ist der Ersatz fuer DiGAs nicht erlaubt.",
        "max" : "0"
      }
    ]
  }
}

```
