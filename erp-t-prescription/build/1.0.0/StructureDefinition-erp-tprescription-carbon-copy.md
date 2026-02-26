# Digitaler Durchschlag T-Rezept - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Digitaler Durchschlag T-Rezept**

## Resource Profile: Digitaler Durchschlag T-Rezept 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-carbon-copy | *Version*:1.0.0 |
| Active as of 2025-12-19 | *Computable Name*:ERP_TPrescription_CarbonCopy |

 
Dieses Profil beschreibt den digitalen Durchschlag T-Rezept der alle Informationen zusammenführt und verlinkt. Alle für den Anwendungsfall relevanten Ressourcen sind hier aufgelistet. 

## Mapping

Folgende Tabelle gibt eine grobe Darstellung des Mappings für dieses Profil:

**Titel:** E-T-Rezept Structure Map for CarbonCopy

**Beschreibung:** Diese Ressource beschreibt das Mapping und führt die Mappings aller Teilressourcen zusammen. Weitere Informationen und Beschreibungen zum Mapping können auf der Seite [Mapping des digitalen Durchschlag E-T-Rezept](./menu-technische-umsetzung-mapping.md#mapping-des-digitalen-durchschlags-e-t-rezept) eingesehen werden.

| | | | |
| :--- | :--- | :--- | :--- |
|   | `erpTCarbonCopy.meta` | Setzt die Metadaten für den digitalen Durchschlag |   |
|   | `CarbonCopy.meta.profile` | Setzt das meta.profile des digitalen Durchschlags T-Rezept→ setzt URL ‘https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-carbon-copy | 1.1’ |
|   | `CarbonCopy.parameter` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen |   |
|   | `part` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen |   |
|   | `part` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen |   |
|   | `part` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen |   |
|   | `parameter.name` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen→ setzt Wert ‘rxPrescription’ |   |
| `bundle.entry` | **(wird bestimmt durch Kontext)** | Verarbeitet alle Einträge des Quell-Bundles für Verschreibungsinformationen |   |
| `bundle.entry.resource` | **(wird bestimmt durch Kontext)** | Extrahiert relevante Ressourcen für die Verschreibung |   |
| `bundle.entry.resource [Typ: Task]` | `parameter.name` | Extrahiert die E-Rezept-ID aus dem Task und erstellt den prescriptionId Parameter→ setzt Wert ‘prescriptionId’ |   |
| `bundle.entry.resource [Typ: Task]` | `value` | Extrahiert die E-Rezept-ID aus dem Task und erstellt den prescriptionId Parameter→ erstellt neues Identifier |   |
| `bundle.entry.resource [Typ: Task]` | **(wird bestimmt durch Kontext)** | Mappt Task-Informationen auf Identifier für die Rezept-IDVerwendet Mapping:[Task](./StructureMap-ERPTPrescriptionStructureMapTask.md) |   |
| `bundle.entry.resource [Typ: MedicationRequest]` | `parameter.name` | Erstellt den medicationRequest Parameter für Verschreibungsdetails→ setzt Wert ‘medicationRequest’ |   |
| `bundle.entry.resource [Typ: MedicationRequest]` | `parameter.resource` | Transformiert KBV-MedicationRequest in BfArM MedicationRequest Format→ erstellt neues MedicationRequest |   |
| `bundle.entry.resource [Typ: MedicationRequest]` | **(wird bestimmt durch Kontext)** | Führt die detaillierte MedicationRequest-Transformation durchVerwendet Mapping:[MedicationRequest](./StructureMap-ERPTPrescriptionStructureMapMedicationRequest.md) |   |
| `bundle.entry.resource [Typ: MedicationRequest]` | `parameter.name` | Erstellt den medication Parameter für das verschriebene Arzneimittel→ setzt Wert ‘medication’ |   |
| `bundle.entry` | **(wird bestimmt durch Kontext)** | Bereitet die Suche nach der referenzierten Medication vor |   |
| `bundle.entry [Typ: Medication]` | `parameter.resource` | Findet die vom MedicationRequest referenzierte Medication und transformiert sie in BfArM Format→ erstellt neues Medication |   |
| `bundle.entry [Typ: Medication].resource` | **(wird bestimmt durch Kontext)** | Führt die detaillierte Medication-Transformation für das verschriebene Arzneimittel durchVerwendet Mapping:[Medication](./StructureMap-ERPTPrescriptionStructureMapMedication.md) |   |
|   | `CarbonCopy.parameter` | Erstellt den rxDispensation Parameter mit allen Abgabeinformationen |   |
|   | `part` | Erstellt den rxDispensation Parameter mit allen Abgabeinformationen |   |
|   | `parameter.name` | Erstellt den rxDispensation Parameter mit allen Abgabeinformationen→ setzt Wert ‘rxDispensation’ |   |
| `bundle.entry` | **(wird bestimmt durch Kontext)** | Verarbeitet alle Einträge des Quell-Bundles für Abgabeinformationen |   |
| `bundle.entry.resource` | **(wird bestimmt durch Kontext)** | Extrahiert relevante Ressourcen für die Abgabe |   |
| `bundle.entry.resource [Typ: Bundle]` | `parameter.name` | Identifiziert VZD SearchSet Bundle für Apothekeninformationen→ setzt Wert ‘dispenseOrganization’ |   |
| `bundle.entry.resource [Typ: Bundle]` | `parameter.resource` | Transformiert VZD SearchSet in BfArM Organization Format für die abgebende Apotheke→ erstellt neues Organization |   |
| `bundle.entry.resource [Typ: Bundle]` | **(wird bestimmt durch Kontext)** | Führt die detaillierte Organization-Transformation durchVerwendet Mapping:[Organization](./StructureMap-ERPTPrescriptionStructureMapOrganization.md) |   |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part` | Erstellt eine dispenseInformation Part pro abgegebener MedicationDispense |   |
| `bundle.entry.resource [Typ: MedicationDispense]` | `parameter.part.name` | Bündelt MedicationDispense und zugehörige Medication unter dispenseInformation→ setzt Wert ‘dispenseInformation’ |   |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.part` | Bündelt MedicationDispense und zugehörige Medication unter dispenseInformation |   |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.part` | Bündelt MedicationDispense und zugehörige Medication unter dispenseInformation |   |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.name.name` | Transformiert gematik MedicationDispense in BfArM MedicationDispense Format→ setzt Wert ‘medicationDispense’ |   |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.name.resource` | Transformiert gematik MedicationDispense in BfArM MedicationDispense Format→ erstellt neues MedicationDispense |   |
| `bundle.entry.resource [Typ: MedicationDispense]` | **(wird bestimmt durch Kontext)** | Führt die detaillierte MedicationDispense-Transformation durchVerwendet Mapping:[MedicationDispense](./StructureMap-ERPTPrescriptionStructureMapMedicationDispense.md) |   |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.name.name` | Findet die vom MedicationDispense referenzierte Medication und transformiert sie in BfArM Format→ setzt Wert ‘medication’ |   |
| `bundle.entry` | **(wird bestimmt durch Kontext)** | Bereitet die Suche nach der referenzierten Medication im Bundle vor |   |
| `bundle.entry [Typ: Medication]` | `parameter.resource` | → erstellt neues Medication |   |
| `bundle.entry [Typ: Medication].resource` | **(wird bestimmt durch Kontext)** | Führt die detaillierte Medication-Transformation für das abgegebene Arzneimittel durchVerwendet Mapping:[Medication](./StructureMap-ERPTPrescriptionStructureMapMedication.md) |   |

**Usages:**

* Examples for this Profile: [Parameters/TRP-Carbon-Copy](Parameters-TRP-Carbon-Copy.md), [Parameters/example-case-01-digitaler-durchschlag](Parameters-example-case-01-digitaler-durchschlag.md), [Parameters/example-case-02-digitaler-durchschlag](Parameters-example-case-02-digitaler-durchschlag.md), [Parameters/example-case-03-digitaler-durchschlag](Parameters-example-case-03-digitaler-durchschlag.md) and [Parameters/example-case-04-digitaler-durchschlag](Parameters-example-case-04-digitaler-durchschlag.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.erp-t-prescription|current/StructureDefinition/erp-tprescription-carbon-copy)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-erp-tprescription-carbon-copy.csv), [Excel](StructureDefinition-erp-tprescription-carbon-copy.xlsx), [Schematron](StructureDefinition-erp-tprescription-carbon-copy.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "erp-tprescription-carbon-copy",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-carbon-copy",
  "version" : "1.0.0",
  "name" : "ERP_TPrescription_CarbonCopy",
  "title" : "Digitaler Durchschlag T-Rezept",
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
  "description" : "Dieses Profil beschreibt den digitalen Durchschlag T-Rezept der alle Informationen zusammenführt und verlinkt. Alle für den Anwendungsfall relevanten Ressourcen sind hier aufgelistet.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Parameters",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Parameters",
      "path" : "Parameters"
    },
    {
      "id" : "Parameters.parameter",
      "path" : "Parameters.parameter",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "name"
        }],
        "rules" : "closed"
      },
      "min" : 2
    },
    {
      "id" : "Parameters.parameter:rxPrescription",
      "path" : "Parameters.parameter",
      "sliceName" : "rxPrescription",
      "short" : "Angaben zur Verordnung",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.name",
      "path" : "Parameters.parameter.name",
      "fixedString" : "rxPrescription",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxPrescription.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part",
      "path" : "Parameters.parameter.part",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "name"
        }],
        "rules" : "open"
      },
      "min" : 4,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionSignatureDate",
      "path" : "Parameters.parameter.part",
      "sliceName" : "prescriptionSignatureDate",
      "short" : "Signaturzeitpunkt der Verordnung",
      "comment" : "Der Zeitpunkt wird aus der QES extrahiert (1.2.840.113549.1.9.5 signingTime) und muss in das FHIR Format für instant transformiert werden. Hierbei ist der höchstmögliche Genauigkeitsgrad anzugeben. Fachlich wird maximal Sekundengenauigkeit gefordert.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionSignatureDate.name",
      "path" : "Parameters.parameter.part.name",
      "fixedString" : "prescriptionSignatureDate",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionSignatureDate.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "instant"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionSignatureDate.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionSignatureDate.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionId",
      "path" : "Parameters.parameter.part",
      "sliceName" : "prescriptionId",
      "short" : "Rezept-ID der Verordnung",
      "comment" : "Das Format der Rezept ID wird in [gemSpec_DM_eRp#E-Rezept-ID](https://gemspec.gematik.de/docs/gemSpec/gemSpec_DM_eRp/latest/#2.2) beschrieben und hat das Format aaa.bbb.bbb.bbb.bbb.cc",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionId.name",
      "path" : "Parameters.parameter.part.name",
      "fixedString" : "prescriptionId",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionId.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/e-prescription-id"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionId.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:prescriptionId.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medicationRequest",
      "path" : "Parameters.parameter.part",
      "sliceName" : "medicationRequest",
      "short" : "Verordnung",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medicationRequest.name",
      "path" : "Parameters.parameter.part.name",
      "fixedString" : "medicationRequest",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medicationRequest.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medicationRequest.resource",
      "path" : "Parameters.parameter.part.resource",
      "min" : 1,
      "type" : [{
        "code" : "MedicationRequest",
        "profile" : ["https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication-request"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medicationRequest.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medication",
      "path" : "Parameters.parameter.part",
      "sliceName" : "medication",
      "short" : "Verordnetes Medikament",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medication.name",
      "path" : "Parameters.parameter.part.name",
      "fixedString" : "medication",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medication.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medication.resource",
      "path" : "Parameters.parameter.part.resource",
      "min" : 1,
      "type" : [{
        "code" : "Medication",
        "profile" : ["https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxPrescription.part:medication.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation",
      "path" : "Parameters.parameter",
      "sliceName" : "rxDispensation",
      "short" : "Angaben zur Dispensierung",
      "min" : 1,
      "max" : "*"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.name",
      "path" : "Parameters.parameter.name",
      "fixedString" : "rxDispensation",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part",
      "path" : "Parameters.parameter.part",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "name"
        }],
        "rules" : "open"
      },
      "min" : 2,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation",
      "path" : "Parameters.parameter.part",
      "sliceName" : "dispenseInformation",
      "short" : "Angaben zu medizinischen Daten der Dispensierung",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.name",
      "path" : "Parameters.parameter.part.name",
      "fixedString" : "dispenseInformation",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part",
      "path" : "Parameters.parameter.part.part",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "name"
        }],
        "rules" : "open"
      },
      "min" : 2,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medicationDispense",
      "path" : "Parameters.parameter.part.part",
      "sliceName" : "medicationDispense",
      "short" : "Dispensierinformationen",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medicationDispense.name",
      "path" : "Parameters.parameter.part.part.name",
      "fixedString" : "medicationDispense",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medicationDispense.value[x]",
      "path" : "Parameters.parameter.part.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medicationDispense.resource",
      "path" : "Parameters.parameter.part.part.resource",
      "min" : 1,
      "type" : [{
        "code" : "MedicationDispense",
        "profile" : ["https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication-dispense"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medicationDispense.part",
      "path" : "Parameters.parameter.part.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medication",
      "path" : "Parameters.parameter.part.part",
      "sliceName" : "medication",
      "short" : "Abgegebenes Medikament",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medication.name",
      "path" : "Parameters.parameter.part.part.name",
      "fixedString" : "medication",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medication.value[x]",
      "path" : "Parameters.parameter.part.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medication.resource",
      "path" : "Parameters.parameter.part.part.resource",
      "min" : 1,
      "type" : [{
        "code" : "Medication",
        "profile" : ["https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseInformation.part:medication.part",
      "path" : "Parameters.parameter.part.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseOrganization",
      "path" : "Parameters.parameter.part",
      "sliceName" : "dispenseOrganization",
      "short" : "Abgebende Apotheke",
      "comment" : "Bei der Dispensierung überträgt die Apotheke an den E-Rezept-Fachdienst nur die Telematik-ID. Angaben zu Name, Adresse und Telefonnummer bezieht der E-Rezept-Fachdienst aus dem FHIR-VZD der TI. Falls aktuelle Daten benötigt werden, können diese am FHIR-VZD unter bezugnahme der Telematik-ID bezogen werden. A_27825 beschreibt textuell den Abruf.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseOrganization.name",
      "path" : "Parameters.parameter.part.name",
      "fixedString" : "dispenseOrganization",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseOrganization.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseOrganization.resource",
      "path" : "Parameters.parameter.part.resource",
      "min" : 1,
      "type" : [{
        "code" : "Organization",
        "profile" : ["https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-organization"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:dispenseOrganization.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    }]
  }
}

```
