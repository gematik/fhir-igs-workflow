# E-T-Rezept Medication Dispense - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Medication Dispense**

## Resource Profile: E-T-Rezept Medication Dispense 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-medication-dispense | *Version*:1.0.0-draft |
| Active as of 2025-12-19 | *Computable Name*:ERP_TPrescription_MedicationDispense |

 
Abgabeinformationen einer Apotheke, die es im Rahmen der Belieferung eines T-Rezeptes an den E-Rezept-Fachdienst übermittelt hat. 

## Mapping

Folgende Tabelle gibt eine grobe Darstellung des Mappings für dieses Profil:

**Titel:** E-T-Rezept Structure Map for MedicationDispense

**Beschreibung:** Mapping-Anweisungen zur Transformation von gematik ERP MedicationDispense zu BfArM T-Prescription MedicationDispense

| | | |
| :--- | :--- | :--- |
| `gematikMedicationDispense.extension [GeneratedDosageInstructionsMeta]` | `bfarmMedicationDispense.extension` | Kopiert Dosage Metadata Extension→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.extension [extension-MedicationDispense.renderedDosageInstruction]` | `bfarmMedicationDispense.extension` | Kopiert RenderedDosageText→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.dosageInstruction` | `bfarmMedicationDispense.dosageInstruction` | Übernimmt die Dosierungsanweisungen aus der ursprünglichen Abgabe für den digitalen Durchschlag→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.whenHandedOver` | `bfarmMedicationDispense.whenHandedOver` | Kopiert das Abgabedatum zur Dokumentation des Zeitpunkts der Medikamentenausgabe→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.medication` | `bfarmMedicationDispense.medication` | Kopiert die Medikamentenreferenz - das referenzierte Medication wird separat gemappt→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.status` | `bfarmMedicationDispense.status` | Setzt den Status auf ‘completed’ da die Abgabe bereits erfolgt ist (digitaler Durchschlag)→ setzt Wert ‘completed’ |
| `gematikMedicationDispense.quantity` | `bfarmMedicationDispense.quantity` | Übernimmt die abgegebene Menge zur Dokumentation der tatsächlich ausgehändigten Medikamentenmenge→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.performer` | `bfarmMedicationDispense.performer` | Transformiert Apotheken-Identifier zu Organization-Referenz für eindeutige Zuordnung der abgebenden Apotheke |
| `gematikMedicationDispense.performer.actor` | `bfarmMedicationDispense.performer.actor` | Verarbeitet den Actor (abgebende Apotheke) des Performers |
| `gematikMedicationDispense.performer.actor.identifier` | **(wird bestimmt durch Kontext)** | Extrahiert den Identifier der abgebenden Apotheke |
| `gematikMedicationDispense.performer.actor.identifier.value` | `reference` | Wandelt Apotheken-Identifier in Organization-Referenz um (Organization/) |

**Usages:**

* Use this Profile: [Digitaler Durchschlag T-Rezept](StructureDefinition-erp-tprescription-carbon-copy.md)
* Examples for this Profile: [MedicationDispense/ExampleMedicationDispense-T](MedicationDispense-ExampleMedicationDispense-T.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.bfarm|current/StructureDefinition/erp-tprescription-medication-dispense)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-erp-tprescription-medication-dispense.csv), [Excel](StructureDefinition-erp-tprescription-medication-dispense.xlsx), [Schematron](StructureDefinition-erp-tprescription-medication-dispense.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "erp-tprescription-medication-dispense",
  "url" : "https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-medication-dispense",
  "version" : "1.0.0-draft",
  "name" : "ERP_TPrescription_MedicationDispense",
  "title" : "E-T-Rezept Medication Dispense",
  "status" : "active",
  "date" : "2025-12-19",
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
  "description" : "Abgabeinformationen einer Apotheke, die es im Rahmen der Belieferung eines T-Rezeptes an den E-Rezept-Fachdienst übermittelt hat.",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationDispense",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationDispense.identifier",
      "path" : "MedicationDispense.identifier",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.partOf",
      "path" : "MedicationDispense.partOf",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.status",
      "path" : "MedicationDispense.status",
      "fixedCode" : "completed"
    },
    {
      "id" : "MedicationDispense.statusReason[x]",
      "path" : "MedicationDispense.statusReason[x]",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.category",
      "path" : "MedicationDispense.category",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.medication[x]",
      "path" : "MedicationDispense.medication[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Medication"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.subject",
      "path" : "MedicationDispense.subject",
      "max" : "0"
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
      "id" : "MedicationDispense.performer",
      "path" : "MedicationDispense.performer",
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.location",
      "path" : "MedicationDispense.location",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.authorizingPrescription",
      "path" : "MedicationDispense.authorizingPrescription",
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
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.daysSupply",
      "path" : "MedicationDispense.daysSupply",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.whenPrepared",
      "path" : "MedicationDispense.whenPrepared",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.whenHandedOver",
      "path" : "MedicationDispense.whenHandedOver",
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.destination",
      "path" : "MedicationDispense.destination",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.receiver",
      "path" : "MedicationDispense.receiver",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.note",
      "path" : "MedicationDispense.note",
      "max" : "0"
    },
    {
      "id" : "MedicationDispense.dosageInstruction",
      "path" : "MedicationDispense.dosageInstruction",
      "mustSupport" : true
    },
    {
      "id" : "MedicationDispense.substitution",
      "path" : "MedicationDispense.substitution",
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
