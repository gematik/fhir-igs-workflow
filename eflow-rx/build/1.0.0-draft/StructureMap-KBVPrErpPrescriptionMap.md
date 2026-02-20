# KBVPrErpPrescriptionMap - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **KBVPrErpPrescriptionMap**

## StructureMap: KBVPrErpPrescriptionMap 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpPrescriptionMap | *Version*:1.0.0-draft |
| Active as of 2026-02-02 | *Computable Name*:KBVPrErpPrescriptionMap |

 

| | | |
| :--- | :--- | :--- |
| Auto-generated StructureMap for KBV_PR_ERP_Prescription | 1.4.0 -> EPAMedicationRequest | 1.3.0 |

 

### Feld-Mappings

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.insurance` | `EPAMedicationRequest.insurance` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: MedicationRequest.insurance |
| `KBVPRERPPrescription` | `EPAMedicationRequest.insurance.display` | Nicht Übertragen | Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.display |
| `KBVPRERPPrescription.insurance.id` | `EPAMedicationRequest.insurance.id` | Nicht Übertragen | Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.id |
| `KBVPRERPPrescription` | `EPAMedicationRequest.insurance.identifier` | Nicht Übertragen | Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.identifier |
| `KBVPRERPPrescription.insurance.reference` | `EPAMedicationRequest.insurance.reference` | Nicht Übertragen | Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.reference |
| `KBVPRERPPrescription` | `EPAMedicationRequest.insurance.type` | Nicht Übertragen | Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.type |
| `KBVPRERPPrescription.meta` | `EPAMedicationRequest.meta.profile` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request` |
| `KBVPRERPPrescription.subject` | `EPAMedicationRequest.subject` | Manuell | Transformationsregel F_007: Wird aus KBV_PR_FOR_Patient.identifier:versichertenId übernommen. | Quelle: MedicationRequest.subject |
| `KBVPRERPPrescription` | `EPAMedicationRequest.subject.identifier` | Manuell | Befüllen von .subject nach Transformationsregel F_010 | Quelle: MedicationRequest.subject.identifier |

### Extensions

#### Extension: KBV_EX_ERP_DosageFlag

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag']` | `EPAMedicationRequest.extension` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: MedicationRequest.extension:Dosierungskennzeichen |

#### Extension: KBV_EX_ERP_EmergencyServicesFee

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee']` | `EPAMedicationRequest.extension` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: MedicationRequest.extension:Notdienstgebuehr |

#### Extension: KBV_EX_FOR_Accident

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Accident`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Accident']` | `EPAMedicationRequest.extension` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: MedicationRequest.extension:Unfallinformationen |

#### Extension: KBV_EX_FOR_StatusCoPayment

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment']` | `EPAMedicationRequest.extension` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: MedicationRequest.extension:Zuzahlungsstatus |

#### Extension: KBV_EX_FOR_SER

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/indicator-ser-extension` |

#### Extension: KBV_EX_ERP_Multiple_Prescription

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/multiple-prescription-extension` |

#### Extension: Nummerierung

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'Nummerierung']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`counter` |

#### Extension: ID

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'ID']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`id` |

#### Extension: Kennzeichen

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'Kennzeichen']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`indicator` |

#### Extension: Zeitraum

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'Zeitraum']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`period` |

#### Extension: KBV_EX_ERP_Narcotic

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/narcotics-extension` |

#### Extension: ErgaenzendeAngabenSubstitutionsmittel

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'ErgaenzendeAngabenSubstitutionsmittel']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`additional-information-substitutes` |

#### Extension: BtM-Sonderkennzeichen

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'BtM-Sonderkennzeichen']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`narcotics-markings` |

#### Extension: KBV_EX_ERP_Patient_ID

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/patient-id-extension` |

#### Extension: KBV_EX_ERP_Prescriber_ID

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/prescriber-id-extension` |

#### Extension: extension-MedicationRequest.renderedDosageInstruction

Bedingung: url = `http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert:`http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction` |

#### Extension: KBV_EX_ERP_Teratogenic

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension` |

#### Extension: GebaerfaehigeFrau

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'GebaerfaehigeFrau']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`childbearing-potential` |

#### Extension: ErklaerungSachkenntnis

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'ErklaerungSachkenntnis']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`declaration-of-expertise` |

#### Extension: AushaendigungInformationsmaterialien

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'AushaendigungInformationsmaterialien']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`hand-out-information-material` |

#### Extension: Off-Label

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'Off-Label']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`off-label` |

#### Extension: EinhaltungSicherheitsmassnahmen

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.extension.extension``[Bedingung: url = 'EinhaltungSicherheitsmassnahmen']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert:`security-compliance` |

#### Extension: (ohne Bedingung)

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPPrescription.insurance.extension` | `EPAMedicationRequest.insurance.extension` | Nicht Übertragen | Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.extension |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "KBVPrErpPrescriptionMap",
  "url" : "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpPrescriptionMap",
  "version" : "1.0.0-draft",
  "name" : "KBVPrErpPrescriptionMap",
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
  "description" : "Auto-generated StructureMap for KBV_PR_ERP_Prescription|1.4.0 -> EPAMedicationRequest|1.3.0",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription",
    "mode" : "source",
    "alias" : "KBVPRERPPrescription"
  },
  {
    "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request",
    "mode" : "target",
    "alias" : "EPAMedicationRequest"
  }],
  "group" : [{
    "name" : "KBVPrErpPrescriptionMap",
    "typeMode" : "types",
    "documentation" : "Mapping generated for KBV_PR_ERP_Prescription|1.4.0 -> EPAMedicationRequest|1.3.0",
    "input" : [{
      "name" : "KBVPRERPPrescription",
      "type" : "KBVPRERPPrescription",
      "mode" : "source"
    },
    {
      "name" : "EPAMedicationRequest",
      "type" : "EPAMedicationRequest",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MedicationRequestAuthoredoncccaaca3",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "authoredOn",
        "variable" : "srcKBVPRERPPrescriptionAuthoredon3962f227"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "authoredOn",
        "variable" : "tgtEPAMedicationRequestAuthoredonbb8b1afd",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionAuthoredon3962f227"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationRequestBasedonc8b5003b",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "basedOn",
        "variable" : "srcKBVPRERPPrescriptionBasedon44096147"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "basedOn",
        "variable" : "tgtEPAMedicationRequestBasedon1481cab7",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionBasedon44096147"
        }]
      }],
      "documentation" : "Copied to 'MedicationRequest.basedOn'"
    },
    {
      "name" : "MedicationRequestDispenserequestabc39b18",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "dispenseRequest",
        "variable" : "srcKBVPRERPPrescriptionDispenserequest1783274a"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "dispenseRequest",
        "variable" : "tgtEPAMedicationRequestDispenserequest519b8c09",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionDispenserequest1783274a"
        }]
      }],
      "documentation" : "Copied to 'MedicationRequest.dispenseRequest'"
    },
    {
      "name" : "MedicationRequestDosageinstruction0c18f214",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "dosageInstruction",
        "variable" : "srcKBVPRERPPrescriptionDosageinstructionc10ce439"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "dosageInstruction",
        "variable" : "tgtEPAMedicationRequestDosageinstructionc76ffbd5",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionDosageinstructionc10ce439"
        }]
      }],
      "documentation" : "Copied to 'MedicationRequest.dosageInstruction'"
    },
    {
      "name" : "MedicationRequestExtension9fb7a1e1",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensione3b6d5d3",
        "condition" : "url != 'renderedDosageInstruction' and url != 'prescriberID' and url != 'id' and url != 'ID' and url != 'narcotics' and url != 'Betaeubungsmittel' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID' and url != 'indicator' and url != 'Off-Label' and url != 'declaration-of-expertise' and url != 'teratogenic' and url != 'narcotics-markings' and url != 'Mehrfachverordnung' and url != 'Unfallkennzeichen' and url != 'additional-information-substitutes' and url != 'Zeitraum' and url != 'valueString' and url != 'multiplePrescription' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee' and url != 'VerschreiberID' and url != 'isBvg' and url != 'period' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/multiple-prescription-extension' and url != 'ErklaerungSachkenntnis' and url != 'valuePeriod' and url != 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction' and url != 'Unfalltag' and url != 'valueDate' and url != 'security-compliance' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension' and url != 'hand-out-information-material' and url != 'valueBoolean' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/patient-id-extension' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/prescriber-id-extension' and url != 'valueCoding' and url != 'BtM-Sonderkennzeichen' and url != 'EinhaltungSicherheitsmassnahmen' and url != 'PatientenID' and url != 'Notdienstgebuehr' and url != 'Nummerierung' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic' and url != 'ErgaenzendeAngabenSubstitutionsmittel' and url != 'GebaerfaehigeFrau' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER' and url != 'Kennzeichen' and url != 'patientID' and url != 'valueRatio' and url != 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta' and url != 'childbearing-potential' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag' and url != 'isSer' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription' and url != 'counter' and url != 'valueIdentifier' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/indicator-ser-extension' and url != 'Dosierungskennzeichen' and url != 'AushaendigungInformationsmaterialien' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/narcotics-extension' and url != 'Unfallinformationen' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Accident' and url != 'Zuzahlungsstatus' and url != 'T-Rezept' and url != 'SER' and url != 'Unfallbetrieb' and url != 'generatedDosageInstructionsMeta' and url != 'off-label' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtension84dbff80",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionExtensione3b6d5d3"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationRequestExtensionDosierungskennzeichen196725c7",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionDosierungskennzeichen5b39c4cb",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionDosierungskennzeichena14ed8c8"
      }],
      "documentation" : "Feld wird nicht gemappt | Quelle: MedicationRequest.extension:Dosierungskennzeichen"
    },
    {
      "name" : "MedicationRequestExtensionNotdienstgebuehr2bd5d6b0",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionNotdienstgebuehr287a16c1",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionNotdienstgebuehr0893fb25"
      }],
      "documentation" : "Feld wird nicht gemappt | Quelle: MedicationRequest.extension:Notdienstgebuehr"
    },
    {
      "name" : "MedicationRequestExtensionUnfallinformationen3a7c229e",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionUnfallinformationen1a3106a2",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Accident'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionUnfallinformationen0101ae43"
      }],
      "documentation" : "Feld wird nicht gemappt | Quelle: MedicationRequest.extension:Unfallinformationen"
    },
    {
      "name" : "MedicationRequestExtensionZuzahlungsstatus32a86828",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionZuzahlungsstatus36507086",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionZuzahlungsstatus8c9c30c1"
      }],
      "documentation" : "Feld wird nicht gemappt | Quelle: MedicationRequest.extension:Zuzahlungsstatus"
    },
    {
      "name" : "MedicationRequestExtensionGenerateddosageinstructionsmetdb6c77e4",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionGenerateddosageinstructionsa922a",
        "condition" : "url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta' and url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionGenerateddosageinstructionsf5747",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionExtensionGenerateddosageinstructionsa922a"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationRequestExtensionIsser59899e4f",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionSere0662047",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionIsser3ffad0d8",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationRequestExtensionIsser3ffad0d8",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/indicator-ser-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationRequestExtensionIsserValueXc593588c",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionSere0662047",
          "element" : "value",
          "variable" : "srcMedicationRequestExtensionIsserValueXc593588c"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionIsser3ffad0d8",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationRequestExtensionIsserValueXc593588c",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationRequestExtensionIsserValueXc593588c"
          }]
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:SER.value[x]'"
      }],
      "documentation" : "Copied from 'MedicationRequest.extension:SER'"
    },
    {
      "name" : "MedicationRequestExtensionMultipleprescriptionbdc5607f",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionMehrfachverordnungc7120a1c",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription' and url != 'period' and url != 'indicator' and url != 'id' and url != 'counter' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionMultipleprescriptionb8edbb86",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationRequestExtensionMultipleprescriptionb8edbb86",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/multiple-prescription-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationRequestExtensionMultipleprescriptionExtensionfb1469fa",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionMehrfachverordnungc7120a1c",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionMultipleprescriptionExtensionfb1469",
          "condition" : "url != 'period' and url != 'indicator' and url != 'id' and url != 'counter' and url != 'indicator' and url != 'counter' and url != 'period' and url != 'id' and url != 'indicator' and url != 'counter' and url != 'period' and url != 'id' and url != 'Kennzeichen' and url != 'Nummerierung' and url != 'Zeitraum' and url != 'ID' and url != 'valueBoolean' and url != 'valueRatio' and url != 'valuePeriod' and url != 'valueIdentifier'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionMultipleprescriptionb8edbb86",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionfb1469",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationRequestExtensionMultipleprescriptionExtensionfb1469"
          }]
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung.extension'"
      },
      {
        "name" : "MedicationRequestExtensionMultipleprescriptionExtensionCfaa566e2",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionMehrfachverordnungc7120a1c",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionMultipleprescriptionExtensionCfaa56",
          "condition" : "url = 'Nummerierung'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionMultipleprescriptionb8edbb86",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionCfaa56",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionCfaa56",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "counter"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionMultipleprescriptionExtensionC871d22e9",
          "source" : [{
            "context" : "srcMedicationRequestExtensionMultipleprescriptionExtensionCfaa56",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionMultipleprescriptionExtensionC871d2"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionCfaa56",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionC871d2",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Ratio"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung'"
      },
      {
        "name" : "MedicationRequestExtensionMultipleprescriptionExtensionI16b5928d",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionMehrfachverordnungc7120a1c",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionMultipleprescriptionExtensionI16b59",
          "condition" : "url = 'ID'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionMultipleprescriptionb8edbb86",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionI16b59",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionI16b59",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "id"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionMultipleprescriptionExtensionIe062e3e2",
          "source" : [{
            "context" : "srcMedicationRequestExtensionMultipleprescriptionExtensionI16b59",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionMultipleprescriptionExtensionIe062e"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionI16b59",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionIe062e",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Identifier"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung.extension:ID'"
      },
      {
        "name" : "MedicationRequestExtensionMultipleprescriptionExtensionI4e3b384b",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionMehrfachverordnungc7120a1c",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionMultipleprescriptionExtensionI4e3b3",
          "condition" : "url = 'Kennzeichen'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionMultipleprescriptionb8edbb86",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionI4e3b3",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionI4e3b3",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "indicator"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionMultipleprescriptionExtensionI405debc2",
          "source" : [{
            "context" : "srcMedicationRequestExtensionMultipleprescriptionExtensionI4e3b3",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionMultipleprescriptionExtensionI405de"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionI4e3b3",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionI405de",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionMultipleprescriptionExtensionI405de"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen'"
      },
      {
        "name" : "MedicationRequestExtensionMultipleprescriptionExtensionP141be3dc",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionMehrfachverordnungc7120a1c",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionMultipleprescriptionExtensionP141be",
          "condition" : "url = 'Zeitraum'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionMultipleprescriptionb8edbb86",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionP141be",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionMultipleprescriptionExtensionP141be",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "period"
          }]
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum'"
      }],
      "documentation" : "Copied from 'MedicationRequest.extension:Mehrfachverordnung'"
    },
    {
      "name" : "MedicationRequestExtensionNarcotics79f21928",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionBetaeubungsmitteld93a4b99",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic' and url != 'narcotics-markings' and url != 'additional-information-substitutes' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionNarcotics6cf17625",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationRequestExtensionNarcotics6cf17625",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/narcotics-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationRequestExtensionNarcoticsExtension5781be10",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionBetaeubungsmitteld93a4b99",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionNarcoticsExtension5781be10",
          "condition" : "url != 'narcotics-markings' and url != 'additional-information-substitutes' and url != 'narcotics-markings' and url != 'additional-information-substitutes' and url != 'narcotics-markings' and url != 'additional-information-substitutes' and url != 'valueCoding' and url != 'valueString' and url != 'BtM-Sonderkennzeichen' and url != 'ErgaenzendeAngabenSubstitutionsmittel' and url != 'valueCoding' and url != 'valueString'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionNarcotics6cf17625",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionNarcoticsExtension5781be10",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationRequestExtensionNarcoticsExtension5781be10"
          }]
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:Betaeubungsmittel.extension'"
      },
      {
        "name" : "MedicationRequestExtensionNarcoticsExtensionAdditionalInceae9d9c",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionBetaeubungsmitteld93a4b99",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionNarcoticsExtensionAdditionalInceae9",
          "condition" : "url = 'ErgaenzendeAngabenSubstitutionsmittel'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionNarcotics6cf17625",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionNarcoticsExtensionAdditionalInceae9",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionNarcoticsExtensionAdditionalInceae9",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "additional-information-substitutes"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionNarcoticsExtensionAdditionalIn7d0f9455",
          "source" : [{
            "context" : "srcMedicationRequestExtensionNarcoticsExtensionAdditionalInceae9",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionNarcoticsExtensionAdditionalIn7d0f9"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionNarcoticsExtensionAdditionalInceae9",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionNarcoticsExtensionAdditionalIn7d0f9",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionNarcoticsExtensionAdditionalIn7d0f9"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:Betaeubungsmittel.extension:ErgaenzendeAngabenSubstitutionsmittel.value[x]'"
        },
        {
          "name" : "MedicationRequestExtensionNarcoticsExtensionAdditionalIn5c447f30",
          "source" : [{
            "context" : "srcMedicationRequestExtensionNarcoticsExtensionAdditionalInceae9",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionNarcoticsExtensionAdditionalIn5c447"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionNarcoticsExtensionAdditionalInceae9",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionNarcoticsExtensionAdditionalIn5c447",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionNarcoticsExtensionAdditionalIn5c447"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:Betaeubungsmittel.extension:ErgaenzendeAngabenSubstitutionsmittel.value[x]:valueString'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:Betaeubungsmittel.extension:ErgaenzendeAngabenSubstitutionsmittel'"
      },
      {
        "name" : "MedicationRequestExtensionNarcoticsExtensionNarcoticsMar7ca5c532",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionBetaeubungsmitteld93a4b99",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionNarcoticsExtensionNarcoticsMar7ca5c",
          "condition" : "url = 'BtM-Sonderkennzeichen'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionNarcotics6cf17625",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionNarcoticsExtensionNarcoticsMar7ca5c",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionNarcoticsExtensionNarcoticsMar7ca5c",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "narcotics-markings"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionNarcoticsExtensionNarcoticsMar57aa6081",
          "source" : [{
            "context" : "srcMedicationRequestExtensionNarcoticsExtensionNarcoticsMar7ca5c",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionNarcoticsExtensionNarcoticsMar57aa6"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionNarcoticsExtensionNarcoticsMar7ca5c",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionNarcoticsExtensionNarcoticsMar57aa6",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionNarcoticsExtensionNarcoticsMar57aa6"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:Betaeubungsmittel.extension:BtM-Sonderkennzeichen.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:Betaeubungsmittel.extension:BtM-Sonderkennzeichen'"
      }],
      "documentation" : "Copied from 'MedicationRequest.extension:Betaeubungsmittel'"
    },
    {
      "name" : "MedicationRequestExtensionPatientid212ef156",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionPatientenidb1aba372",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionPatientid606310bd",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationRequestExtensionPatientid606310bd",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/patient-id-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationRequestExtensionPatientidValueX6b0e4b53",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionPatientenidb1aba372",
          "element" : "value",
          "variable" : "srcMedicationRequestExtensionPatientidValueX6b0e4b53"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionPatientid606310bd",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationRequestExtensionPatientidValueX6b0e4b53",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Identifier"
          }]
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:PatientenID.value[x]'"
      }],
      "documentation" : "Copied from 'MedicationRequest.extension:PatientenID'"
    },
    {
      "name" : "MedicationRequestExtensionPrescriberid3f6e2305",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionVerschreiberid969b0514",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionPrescriberid10873256",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationRequestExtensionPrescriberid10873256",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/prescriber-id-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationRequestExtensionPrescriberidValueXaaa15668",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionVerschreiberid969b0514",
          "element" : "value",
          "variable" : "srcMedicationRequestExtensionPrescriberidValueXaaa15668"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionPrescriberid10873256",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationRequestExtensionPrescriberidValueXaaa15668",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Identifier"
          }]
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:VerschreiberID.value[x]'"
      }],
      "documentation" : "Copied from 'MedicationRequest.extension:VerschreiberID'"
    },
    {
      "name" : "MedicationRequestExtensionRendereddosageinstruction77697624",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionRendereddosageinstruction1f1ed86",
        "condition" : "url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction' and url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionRendereddosageinstruction1278f9e",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationRequestExtensionRendereddosageinstruction1278f9e",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction"
        }]
      }],
      "rule" : [{
        "name" : "MedicationRequestExtensionRendereddosageinstructionExten28c174a3",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionRendereddosageinstruction1f1ed86",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionRendereddosageinstructionExten28c17"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionRendereddosageinstruction1278f9e",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionRendereddosageinstructionExten28c17",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationRequestExtensionRendereddosageinstructionExten28c17"
          }]
        }],
        "documentation" : "Copied to 'MedicationRequest.extension:renderedDosageInstruction.extension'"
      },
      {
        "name" : "MedicationRequestExtensionRendereddosageinstructionId1f949ff1",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionRendereddosageinstruction1f1ed86",
          "element" : "id",
          "variable" : "srcMedicationRequestExtensionRendereddosageinstructionId1f949ff1"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionRendereddosageinstruction1278f9e",
          "contextType" : "variable",
          "element" : "id",
          "variable" : "tgtMedicationRequestExtensionRendereddosageinstructionId1f949ff1",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationRequestExtensionRendereddosageinstructionId1f949ff1"
          }]
        }],
        "documentation" : "Copied to 'MedicationRequest.extension:renderedDosageInstruction.id'"
      },
      {
        "name" : "MedicationRequestExtensionRendereddosageinstructionValue43194174",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionRendereddosageinstruction1f1ed86",
          "element" : "value",
          "variable" : "srcMedicationRequestExtensionRendereddosageinstructionValue43194"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionRendereddosageinstruction1278f9e",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationRequestExtensionRendereddosageinstructionValue43194",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationRequestExtensionRendereddosageinstructionValue43194"
          }]
        }],
        "documentation" : "Copied to 'MedicationRequest.extension:renderedDosageInstruction.value[x]'"
      }],
      "documentation" : "Copied to 'MedicationRequest.extension:renderedDosageInstruction'"
    },
    {
      "name" : "MedicationRequestExtensionTeratogenic8a23741f",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "extension",
        "variable" : "srcKBVPRERPPrescriptionExtensionTRezept7033d9f5",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic' and url != 'security-compliance' and url != 'declaration-of-expertise' and url != 'hand-out-information-material' and url != 'off-label' and url != 'childbearing-potential' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic'"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationRequestExtensionTeratogenic4ac07394",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationRequestExtensionTeratogenic4ac07394",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationRequestExtensionTeratogenicExtension7f45302b",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionTRezept7033d9f5",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionTeratogenicExtension7f45302b",
          "condition" : "url != 'security-compliance' and url != 'declaration-of-expertise' and url != 'hand-out-information-material' and url != 'off-label' and url != 'childbearing-potential' and url != 'off-label' and url != 'childbearing-potential' and url != 'security-compliance' and url != 'hand-out-information-material' and url != 'declaration-of-expertise' and url != 'off-label' and url != 'childbearing-potential' and url != 'security-compliance' and url != 'hand-out-information-material' and url != 'declaration-of-expertise' and url != 'Off-Label' and url != 'GebaerfaehigeFrau' and url != 'EinhaltungSicherheitsmassnahmen' and url != 'AushaendigungInformationsmaterialien' and url != 'ErklaerungSachkenntnis' and url != 'valueBoolean' and url != 'valueBoolean' and url != 'valueBoolean' and url != 'valueBoolean' and url != 'valueBoolean'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionTeratogenic4ac07394",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionTeratogenicExtension7f45302b",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationRequestExtensionTeratogenicExtension7f45302b"
          }]
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension'"
      },
      {
        "name" : "MedicationRequestExtensionTeratogenicExtensionChildbearid7eea4d5",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionTRezept7033d9f5",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionTeratogenicExtensionChildbearid7eea",
          "condition" : "url = 'GebaerfaehigeFrau'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionTeratogenic4ac07394",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionChildbearid7eea",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionTeratogenicExtensionChildbearid7eea",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "childbearing-potential"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionTeratogenicExtensionChildbeari0d33c9ce",
          "source" : [{
            "context" : "srcMedicationRequestExtensionTeratogenicExtensionChildbearid7eea",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionTeratogenicExtensionChildbeari0d33c"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionTeratogenicExtensionChildbearid7eea",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionChildbeari0d33c",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionTeratogenicExtensionChildbeari0d33c"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:GebaerfaehigeFrau.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:GebaerfaehigeFrau'"
      },
      {
        "name" : "MedicationRequestExtensionTeratogenicExtensionDeclaratio505fc233",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionTRezept7033d9f5",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionTeratogenicExtensionDeclaratio505fc",
          "condition" : "url = 'ErklaerungSachkenntnis'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionTeratogenic4ac07394",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionDeclaratio505fc",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionTeratogenicExtensionDeclaratio505fc",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "declaration-of-expertise"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionTeratogenicExtensionDeclaratio21424ea3",
          "source" : [{
            "context" : "srcMedicationRequestExtensionTeratogenicExtensionDeclaratio505fc",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionTeratogenicExtensionDeclaratio21424"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionTeratogenicExtensionDeclaratio505fc",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionDeclaratio21424",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionTeratogenicExtensionDeclaratio21424"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:ErklaerungSachkenntnis.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:ErklaerungSachkenntnis'"
      },
      {
        "name" : "MedicationRequestExtensionTeratogenicExtensionHandOutInfb6c2b48d",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionTRezept7033d9f5",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionTeratogenicExtensionHandOutInfb6c2b",
          "condition" : "url = 'AushaendigungInformationsmaterialien'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionTeratogenic4ac07394",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionHandOutInfb6c2b",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionTeratogenicExtensionHandOutInfb6c2b",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "hand-out-information-material"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionTeratogenicExtensionHandOutInf0b865a8b",
          "source" : [{
            "context" : "srcMedicationRequestExtensionTeratogenicExtensionHandOutInfb6c2b",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionTeratogenicExtensionHandOutInf0b865"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionTeratogenicExtensionHandOutInfb6c2b",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionHandOutInf0b865",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionTeratogenicExtensionHandOutInf0b865"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:AushaendigungInformationsmaterialien.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:AushaendigungInformationsmaterialien'"
      },
      {
        "name" : "MedicationRequestExtensionTeratogenicExtensionOffLabel59ec860e",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionTRezept7033d9f5",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionTeratogenicExtensionOffLabel59ec860",
          "condition" : "url = 'Off-Label'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionTeratogenic4ac07394",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionOffLabel59ec860",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionTeratogenicExtensionOffLabel59ec860",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "off-label"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionTeratogenicExtensionOffLabelVa7de9945c",
          "source" : [{
            "context" : "srcMedicationRequestExtensionTeratogenicExtensionOffLabel59ec860",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionTeratogenicExtensionOffLabelVa7de99"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionTeratogenicExtensionOffLabel59ec860",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionOffLabelVa7de99",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionTeratogenicExtensionOffLabelVa7de99"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:Off-Label.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:Off-Label'"
      },
      {
        "name" : "MedicationRequestExtensionTeratogenicExtensionSecurityCoac4e9d6c",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionExtensionTRezept7033d9f5",
          "element" : "extension",
          "variable" : "srcMedicationRequestExtensionTeratogenicExtensionSecurityCoac4e9",
          "condition" : "url = 'EinhaltungSicherheitsmassnahmen'"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestExtensionTeratogenic4ac07394",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionSecurityCoac4e9",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtMedicationRequestExtensionTeratogenicExtensionSecurityCoac4e9",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "security-compliance"
          }]
        }],
        "rule" : [{
          "name" : "MedicationRequestExtensionTeratogenicExtensionSecurityCo39f181ed",
          "source" : [{
            "context" : "srcMedicationRequestExtensionTeratogenicExtensionSecurityCoac4e9",
            "element" : "value",
            "variable" : "srcMedicationRequestExtensionTeratogenicExtensionSecurityCo39f18"
          }],
          "target" : [{
            "context" : "tgtMedicationRequestExtensionTeratogenicExtensionSecurityCoac4e9",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtMedicationRequestExtensionTeratogenicExtensionSecurityCo39f18",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationRequestExtensionTeratogenicExtensionSecurityCo39f18"
            }]
          }],
          "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:EinhaltungSicherheitsmassnahmen.value[x]'"
        }],
        "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept.extension:EinhaltungSicherheitsmassnahmen'"
      }],
      "documentation" : "Copied from 'MedicationRequest.extension:T-Rezept'"
    },
    {
      "name" : "MedicationRequestInsurance8b499ebd",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "insurance",
        "variable" : "srcKBVPRERPPrescriptionInsurance97877d04"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "insurance",
        "variable" : "tgtEPAMedicationRequestInsurance9fe43701"
      }],
      "documentation" : "Feld wird nicht gemappt | Quelle: MedicationRequest.insurance"
    },
    {
      "name" : "MedicationRequestInsuranceDisplayc37e796c",
      "source" : [{
        "context" : "KBVPRERPPrescription"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "insurance",
        "variable" : "tgtEPAMedicationRequestInsurance9fe43701"
      }],
      "rule" : [{
        "name" : "MedicationRequestInsuranceDisplayc37e796c",
        "source" : [{
          "context" : "KBVPRERPPrescription",
          "variable" : "manualsrcMedicationRequestInsuranceDisplayc37e796c"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestInsurance9fe43701",
          "contextType" : "variable",
          "element" : "display",
          "variable" : "tgtEPAMedicationRequestInsuranceDisplay17d9b64c"
        }],
        "documentation" : "Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.display"
      }]
    },
    {
      "name" : "MedicationRequestInsuranceExtension863b718a",
      "source" : [{
        "context" : "KBVPRERPPrescription"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "insurance",
        "variable" : "tgtEPAMedicationRequestInsurance9fe43701"
      }],
      "rule" : [{
        "name" : "MedicationRequestInsuranceExtension863b718a",
        "source" : [{
          "context" : "KBVPRERPPrescription",
          "element" : "insurance",
          "variable" : "srcKBVPRERPPrescriptionInsurance97877d04"
        }],
        "rule" : [{
          "name" : "MedicationRequestInsuranceExtension863b718a",
          "source" : [{
            "context" : "srcKBVPRERPPrescriptionInsurance97877d04",
            "element" : "extension",
            "variable" : "srcKBVPRERPPrescriptionInsuranceExtension39c92d6e"
          }],
          "target" : [{
            "context" : "tgtEPAMedicationRequestInsurance9fe43701",
            "contextType" : "variable",
            "element" : "extension",
            "variable" : "tgtEPAMedicationRequestInsuranceExtensionda61a5ce"
          }],
          "documentation" : "Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.extension"
        }]
      }]
    },
    {
      "name" : "MedicationRequestInsuranceIdd780df33",
      "source" : [{
        "context" : "KBVPRERPPrescription"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "insurance",
        "variable" : "tgtEPAMedicationRequestInsurance9fe43701"
      }],
      "rule" : [{
        "name" : "MedicationRequestInsuranceIdd780df33",
        "source" : [{
          "context" : "KBVPRERPPrescription",
          "element" : "insurance",
          "variable" : "srcKBVPRERPPrescriptionInsurance97877d04"
        }],
        "rule" : [{
          "name" : "MedicationRequestInsuranceIdd780df33",
          "source" : [{
            "context" : "srcKBVPRERPPrescriptionInsurance97877d04",
            "element" : "id",
            "variable" : "srcKBVPRERPPrescriptionInsuranceId2629837d"
          }],
          "target" : [{
            "context" : "tgtEPAMedicationRequestInsurance9fe43701",
            "contextType" : "variable",
            "element" : "id",
            "variable" : "tgtEPAMedicationRequestInsuranceId17eecc89"
          }],
          "documentation" : "Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.id"
        }]
      }]
    },
    {
      "name" : "MedicationRequestInsuranceIdentifier795c84b1",
      "source" : [{
        "context" : "KBVPRERPPrescription"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "insurance",
        "variable" : "tgtEPAMedicationRequestInsurance9fe43701"
      }],
      "rule" : [{
        "name" : "MedicationRequestInsuranceIdentifier795c84b1",
        "source" : [{
          "context" : "KBVPRERPPrescription",
          "variable" : "manualsrcMedicationRequestInsuranceIdentifier795c84b1"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestInsurance9fe43701",
          "contextType" : "variable",
          "element" : "identifier",
          "variable" : "tgtEPAMedicationRequestInsuranceIdentifierd814480c"
        }],
        "documentation" : "Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.identifier"
      }]
    },
    {
      "name" : "MedicationRequestInsuranceReferenced20f7e2a",
      "source" : [{
        "context" : "KBVPRERPPrescription"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "insurance",
        "variable" : "tgtEPAMedicationRequestInsurance9fe43701"
      }],
      "rule" : [{
        "name" : "MedicationRequestInsuranceReferenced20f7e2a",
        "source" : [{
          "context" : "KBVPRERPPrescription",
          "element" : "insurance",
          "variable" : "srcKBVPRERPPrescriptionInsurance97877d04"
        }],
        "rule" : [{
          "name" : "MedicationRequestInsuranceReferenced20f7e2a",
          "source" : [{
            "context" : "srcKBVPRERPPrescriptionInsurance97877d04",
            "element" : "reference",
            "variable" : "srcKBVPRERPPrescriptionInsuranceReference7b9ed018"
          }],
          "target" : [{
            "context" : "tgtEPAMedicationRequestInsurance9fe43701",
            "contextType" : "variable",
            "element" : "reference",
            "variable" : "tgtEPAMedicationRequestInsuranceReference7a397c28"
          }],
          "documentation" : "Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.reference"
        }]
      }]
    },
    {
      "name" : "MedicationRequestInsuranceTypec5db1613",
      "source" : [{
        "context" : "KBVPRERPPrescription"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "insurance",
        "variable" : "tgtEPAMedicationRequestInsurance9fe43701"
      }],
      "rule" : [{
        "name" : "MedicationRequestInsuranceTypec5db1613",
        "source" : [{
          "context" : "KBVPRERPPrescription",
          "variable" : "manualsrcMedicationRequestInsuranceTypec5db1613"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestInsurance9fe43701",
          "contextType" : "variable",
          "element" : "type",
          "variable" : "tgtEPAMedicationRequestInsuranceType76384abe"
        }],
        "documentation" : "Feld wird nicht gemappt | Inherited from MedicationRequest.insurance | Quelle: MedicationRequest.insurance.type"
      }]
    },
    {
      "name" : "MedicationRequestIntentd6f3b441",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "intent",
        "variable" : "srcKBVPRERPPrescriptionIntentd287d5c0"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "intent",
        "variable" : "tgtEPAMedicationRequestIntentc2c09deb",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionIntentd287d5c0"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationRequestMedicationXMedicationreferencecdf4aaa2",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "medication",
        "variable" : "srcKBVPRERPPrescriptionMedicationXMedicationreferencee836d317"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "medication",
        "variable" : "tgtEPAMedicationRequestMedicationXb2342a1d",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionMedicationXMedicationreferencee836d317"
        }]
      }],
      "documentation" : "Copied to 'MedicationRequest.medication[x]'"
    },
    {
      "name" : "MedicationRequestMeta9962a339",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "meta",
        "variable" : "srcKBVPRERPPrescriptionMetaebbb9882"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "tgtEPAMedicationRequestMeta55fad1b0",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Meta"
        }]
      }],
      "rule" : [{
        "name" : "MedicationRequestMetaProfile56c958a8",
        "source" : [{
          "context" : "srcKBVPRERPPrescriptionMetaebbb9882",
          "variable" : "srcMedicationRequestMetaProfile56c958a8"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestMeta55fad1b0",
          "contextType" : "variable",
          "element" : "profile",
          "variable" : "tgtMedicationRequestMetaProfile56c958a8",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request"
          }]
        }],
        "documentation" : "Fixed value 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request'"
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationRequestNote3f48e22b",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "note",
        "variable" : "srcKBVPRERPPrescriptionNote271cad5f"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "note",
        "variable" : "tgtEPAMedicationRequestNote7f5e9d21",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionNote271cad5f"
        }]
      }],
      "documentation" : "Copied to 'MedicationRequest.note'"
    },
    {
      "name" : "MedicationRequestRequester3e498d80",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "requester",
        "variable" : "srcKBVPRERPPrescriptionRequester66a1f0a5"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "requester",
        "variable" : "tgtEPAMedicationRequestRequester76629bb4",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionRequester66a1f0a5"
        }]
      }],
      "documentation" : "Copied to 'MedicationRequest.requester'"
    },
    {
      "name" : "MedicationRequestStatus67a37e7d",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "status",
        "variable" : "srcKBVPRERPPrescriptionStatusdacc71a5"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "status",
        "variable" : "tgtEPAMedicationRequestStatuse5522c01",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionStatusdacc71a5"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationRequestSubjectfe47ad58",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "subject",
        "variable" : "srcKBVPRERPPrescriptionSubjectb79dbef0"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "tgtEPAMedicationRequestSubject8a8bf8a9"
      }],
      "documentation" : "Manual action required | Transformationsregel F_007: Wird aus KBV_PR_FOR_Patient.identifier:versichertenId übernommen. | Quelle: MedicationRequest.subject"
    },
    {
      "name" : "MedicationRequestSubjectIdentifier9f3d69ea",
      "source" : [{
        "context" : "KBVPRERPPrescription"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "tgtEPAMedicationRequestSubject8a8bf8a9"
      }],
      "rule" : [{
        "name" : "MedicationRequestSubjectIdentifier9f3d69ea",
        "source" : [{
          "context" : "KBVPRERPPrescription",
          "variable" : "manualsrcMedicationRequestSubjectIdentifier9f3d69ea"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationRequestSubject8a8bf8a9",
          "contextType" : "variable",
          "element" : "identifier",
          "variable" : "tgtEPAMedicationRequestSubjectIdentifier1e1464d1"
        }],
        "documentation" : "Manual action required | Befüllen von .subject nach Transformationsregel F_010 | Quelle: MedicationRequest.subject.identifier"
      }]
    },
    {
      "name" : "MedicationRequestSubstitution5015c761",
      "source" : [{
        "context" : "KBVPRERPPrescription",
        "element" : "substitution",
        "variable" : "srcKBVPRERPPrescriptionSubstitution3af41d78"
      }],
      "target" : [{
        "context" : "EPAMedicationRequest",
        "contextType" : "variable",
        "element" : "substitution",
        "variable" : "tgtEPAMedicationRequestSubstitution4b4fd116",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPPrescriptionSubstitution3af41d78"
        }]
      }],
      "documentation" : "Copied to 'MedicationRequest.substitution'"
    }]
  }]
}

```
