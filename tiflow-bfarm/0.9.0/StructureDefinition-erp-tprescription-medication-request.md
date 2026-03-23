# E-T-Rezept Medication Request - TIFlow - Datenaustausch BfArM Webdienst v0.9.0

TIFlow - Datenaustausch BfArM Webdienst

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Medication Request**

## Resource Profile: E-T-Rezept Medication Request 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-medication-request | *Version*:0.9.0 |
| Active as of 2025-12-19 | *Computable Name*:ERP_TPrescription_MedicationRequest |

 
Informationen zu einer Verordnung, die ein Arzt im E-T-Rezept angegeben hat. 

## Mapping

Folgende Tabelle gibt eine grobe Darstellung des Mappings für dieses Profil:

**Titel:** E-T-Rezept Structure Map for MedicationRequest

**Beschreibung:** Mapping-Anweisungen zur Transformation von KBV MedicationRequest zu BfArM T-Prescription MedicationRequest

| | | |
| :--- | :--- | :--- |
| `kbvMedicationRequest.status` | `bfarmMedicationRequest.status` | Setzt den Status auf ‘completed’ für den digitalen Durchschlag (Verschreibung ist bereits abgeschlossen)→ setzt Wert ‘completed’ |
| `kbvMedicationRequest.intent` | `bfarmMedicationRequest.intent` | Setzt den Intent auf ‘order’ entsprechend der BfArM-Spezifikation für T-Prescription→ setzt Wert ‘order’ |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic]` | `bfarmMedicationRequest.extension` | Mappt T-Rezept spezifische Extensions vom KBV- zum BfArM-Format |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic]` | `bfarmMedicationRequest.extension.url` | Kopiert teratogene Extensions für T-Rezept Kennzeichnung→ setzt URL ‘https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension’ |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [Off-Label]` | `bfarmMedicationRequest.extension.extension` | Mappt Off-Label Extension→ erstellt neues Extension |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [Off-Label]` | `bfarmMedicationRequest.extension.url` | Mappt Off-Label Extension→ setzt Wert ‘off-label’ |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [Off-Label].value` | `bfarmMedicationRequest.extension.extension.value` | Übernimmt den Off-Label Booleschen Wert→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [GebaerfaehigeFrau]` | `bfarmMedicationRequest.extension.extension` | Mappt GebaerfaehigeFrau Extension zu childbearing-potential→ erstellt neues Extension |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [GebaerfaehigeFrau]` | `bfarmMedicationRequest.extension.url` | Mappt GebaerfaehigeFrau Extension zu childbearing-potential→ setzt Wert ‘childbearing-potential’ |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [GebaerfaehigeFrau].value` | `bfarmMedicationRequest.extension.extension.value` | Übernimmt den Booleschen Wert für childbearing-potential→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [EinhaltungSicherheitsmassnahmen]` | `bfarmMedicationRequest.extension.extension` | Mappt EinhaltungSicherheitsmassnahmen Extension zu security-compliance→ erstellt neues Extension |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [EinhaltungSicherheitsmassnahmen]` | `bfarmMedicationRequest.extension.url` | Mappt EinhaltungSicherheitsmassnahmen Extension zu security-compliance→ setzt Wert ‘security-compliance’ |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [EinhaltungSicherheitsmassnahmen].value` | `bfarmMedicationRequest.extension.extension.value` | Übernimmt den Booleschen Wert für security-compliance→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [AushaendigungInformationsmaterialien]` | `bfarmMedicationRequest.extension.extension` | Mappt AushaendigungInformationsmaterialien Extension zu hand-out-information-material→ erstellt neues Extension |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [AushaendigungInformationsmaterialien]` | `bfarmMedicationRequest.extension.url` | Mappt AushaendigungInformationsmaterialien Extension zu hand-out-information-material→ setzt Wert ‘hand-out-information-material’ |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [AushaendigungInformationsmaterialien].value` | `bfarmMedicationRequest.extension.extension.value` | Übernimmt den Booleschen Wert für hand-out-information-material→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [ErklaerungSachkenntnis]` | `bfarmMedicationRequest.extension.extension` | Mappt ErklaerungSachkenntnis Extension zu declaration-of-expertise→ erstellt neues Extension |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [ErklaerungSachkenntnis]` | `bfarmMedicationRequest.extension.url` | Mappt ErklaerungSachkenntnis Extension zu declaration-of-expertise→ setzt Wert ‘declaration-of-expertise’ |
| `kbvMedicationRequest.extension [KBV_EX_ERP_Teratogenic].extension [ErklaerungSachkenntnis].value` | `bfarmMedicationRequest.extension.extension.value` | Übernimmt den Booleschen Wert für declaration-of-expertise→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.extension [GeneratedDosageInstructionsMeta]` | `bfarmMedicationRequest.extension` | Kopiert Dosage Metadata Extension→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.extension [extension-MedicationRequest.renderedDosageInstruction]` | `bfarmMedicationRequest.extension` | Kopiert RenderedDosageText→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject` | Entfernt Patientenbezug durch data-absent-reason Extension für Datenschutz im digitalen Durchschlag |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject.identifier.system` | Erstellt data-absent-reason Extension für Subject Identifier |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject.identifier.value` | Erstellt data-absent-reason Extension für Subject Identifier |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject.identifier.system.extension` | Erstellt data-absent-reason Extension für Subject Identifier |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject.identifier.system.extension` | Erstellt data-absent-reason Extension für Subject Identifier |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject.identifier.system.extension.url` | Setzt data-absent-reason auf ‘not-permitted’ um Patientendaten zu anonymisieren→ setzt URL ‘http://hl7.org/fhir/StructureDefinition/data-absent-reason’ |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject.identifier.system.extension.value` | Setzt data-absent-reason auf ‘not-permitted’ um Patientendaten zu anonymisieren |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject.identifier.system.extension.url` | Setzt data-absent-reason auf ‘not-permitted’ um Patientendaten zu anonymisieren→ setzt URL ‘http://hl7.org/fhir/StructureDefinition/data-absent-reason’ |
| `kbvMedicationRequest.subject` | `bfarmMedicationRequest.subject.identifier.system.extension.value` | Setzt data-absent-reason auf ‘not-permitted’ um Patientendaten zu anonymisieren |
| `kbvMedicationRequest.authoredOn` | `bfarmMedicationRequest.authoredOn` | Übernimmt das Verschreibungsdatum unverändert vom KBV MedicationRequest→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.dosageInstruction` | `bfarmMedicationRequest.dosageInstruction` | Kopiert die Dosierungsanweisungen vollständig für den digitalen Durchschlag→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.dispenseRequest` | `bfarmMedicationRequest.dispenseRequest` | Übernimmt Abgabeanweisungen (Menge, Wiederholungen) aus der ursprünglichen Verschreibung→ übernimmt Wert aus Quellvariable |
| `kbvMedicationRequest.medicationReference` | `bfarmMedicationRequest.medication` | → erstellt neues Reference |

**Usages:**

* Use this Profile: [Digitaler Durchschlag T-Rezept](StructureDefinition-erp-tprescription-carbon-copy.md)
* Examples for this Profile: [MedicationRequest/ExampleMedicationRequest-T](MedicationRequest-ExampleMedicationRequest-T.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.bfarm|current/StructureDefinition/erp-tprescription-medication-request)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-erp-tprescription-medication-request.csv), [Excel](StructureDefinition-erp-tprescription-medication-request.xlsx), [Schematron](StructureDefinition-erp-tprescription-medication-request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "erp-tprescription-medication-request",
  "url" : "https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-medication-request",
  "version" : "0.9.0",
  "name" : "ERP_TPrescription_MedicationRequest",
  "title" : "E-T-Rezept Medication Request",
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
  "description" : "Informationen zu einer Verordnung, die ein Arzt im E-T-Rezept angegeben hat.",
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
  "type" : "MedicationRequest",
  "baseDefinition" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationRequest.extension",
      "path" : "MedicationRequest.extension",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.identifier",
      "path" : "MedicationRequest.identifier",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.identifier:RxPrescriptionProcessIdentifier",
      "path" : "MedicationRequest.identifier",
      "sliceName" : "RxPrescriptionProcessIdentifier",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.identifier:RxOriginatorProcessIdentifier",
      "path" : "MedicationRequest.identifier",
      "sliceName" : "RxOriginatorProcessIdentifier",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.status",
      "path" : "MedicationRequest.status",
      "fixedCode" : "completed"
    },
    {
      "id" : "MedicationRequest.statusReason",
      "path" : "MedicationRequest.statusReason",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.intent",
      "path" : "MedicationRequest.intent",
      "fixedCode" : "order"
    },
    {
      "id" : "MedicationRequest.category",
      "path" : "MedicationRequest.category",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.priority",
      "path" : "MedicationRequest.priority",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.doNotPerform",
      "path" : "MedicationRequest.doNotPerform",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.reported[x]",
      "path" : "MedicationRequest.reported[x]",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.subject.reference",
      "path" : "MedicationRequest.subject.reference",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.subject.type",
      "path" : "MedicationRequest.subject.type",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.subject.display",
      "path" : "MedicationRequest.subject.display",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.encounter",
      "path" : "MedicationRequest.encounter",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.supportingInformation",
      "path" : "MedicationRequest.supportingInformation",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.requester",
      "path" : "MedicationRequest.requester",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.performer",
      "path" : "MedicationRequest.performer",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.performerType",
      "path" : "MedicationRequest.performerType",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.recorder",
      "path" : "MedicationRequest.recorder",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.reasonCode",
      "path" : "MedicationRequest.reasonCode",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.reasonReference",
      "path" : "MedicationRequest.reasonReference",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.instantiatesCanonical",
      "path" : "MedicationRequest.instantiatesCanonical",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.instantiatesUri",
      "path" : "MedicationRequest.instantiatesUri",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.basedOn",
      "path" : "MedicationRequest.basedOn",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.groupIdentifier",
      "path" : "MedicationRequest.groupIdentifier",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.courseOfTherapyType",
      "path" : "MedicationRequest.courseOfTherapyType",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.insurance",
      "path" : "MedicationRequest.insurance",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.note",
      "path" : "MedicationRequest.note",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.dispenseRequest.initialFill",
      "path" : "MedicationRequest.dispenseRequest.initialFill",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.dispenseRequest.dispenseInterval",
      "path" : "MedicationRequest.dispenseRequest.dispenseInterval",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.dispenseRequest.validityPeriod",
      "path" : "MedicationRequest.dispenseRequest.validityPeriod",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.dispenseRequest.numberOfRepeatsAllowed",
      "path" : "MedicationRequest.dispenseRequest.numberOfRepeatsAllowed",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.dispenseRequest.performer",
      "path" : "MedicationRequest.dispenseRequest.performer",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.substitution",
      "path" : "MedicationRequest.substitution",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.priorPrescription",
      "path" : "MedicationRequest.priorPrescription",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.detectedIssue",
      "path" : "MedicationRequest.detectedIssue",
      "max" : "0"
    },
    {
      "id" : "MedicationRequest.eventHistory",
      "path" : "MedicationRequest.eventHistory",
      "max" : "0"
    }]
  }
}

```
