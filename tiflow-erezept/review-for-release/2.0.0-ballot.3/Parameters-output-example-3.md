# output-example-3 - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **output-example-3**

## Parameters: output-example-3



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "output-example-3",
  "parameter" : [{
    "name" : "rxPrescription",
    "part" : [{
      "name" : "authoredOn",
      "valueDateTime" : "2024-05-20"
    },
    {
      "name" : "medication",
      "resource" : {
        "resourceType" : "Medication",
        "id" : "0d93504e-c6a7-47c1-8ad5-b0c5cf1b8920",
        "meta" : {
          "profile" : ["https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication"]
        },
        "extension" : [{
          "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension",
          "valueCoding" : {
            "system" : "https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs",
            "code" : "00"
          }
        },
        {
          "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension",
          "valueBoolean" : false
        }],
        "code" : {
          "coding" : [{
            "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type",
            "code" : "freitext"
          }],
          "text" : "Metformin 850mg Tabletten N3"
        }
      }
    },
    {
      "name" : "medicationRequest",
      "resource" : {
        "resourceType" : "MedicationRequest",
        "meta" : {
          "profile" : ["https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request"]
        },
        "extension" : [{
          "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/indicator-ser-extension",
          "valueBoolean" : false
        },
        {
          "extension" : [{
            "url" : "indicator",
            "valueBoolean" : false
          }],
          "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/multiple-prescription-extension"
        }],
        "status" : "active",
        "intent" : "order",
        "medicationReference" : {
          "reference" : "Medication/0d93504e-c6a7-47c1-8ad5-b0c5cf1b8920"
        },
        "subject" : {
          "identifier" : {
            "system" : "http://fhir.de/sid/gkv/kvid-10",
            "value" : "X110411319"
          }
        },
        "authoredOn" : "2024-05-20",
        "requester" : {
          "reference" : "Practitioner/667ffd79-42a3-4002-b7ca-6b9098f20ccb"
        },
        "dispenseRequest" : {
          "quantity" : {
            "value" : 1,
            "unit" : "Packung"
          }
        },
        "substitution" : {
          "allowedBoolean" : true
        }
      }
    },
    {
      "name" : "organization",
      "resource" : {
        "resourceType" : "Organization",
        "meta" : {
          "profile" : ["https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory"],
          "tag" : [{
            "system" : "https://gematik.de/fhir/directory/CodeSystem/Origin",
            "code" : "ldap"
          }]
        },
        "identifier" : [{
          "type" : {
            "coding" : [{
              "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
              "code" : "BSNR"
            }]
          },
          "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR",
          "value" : "724444400"
        },
        {
          "system" : "https://gematik.de/fhir/sid/telematik-id",
          "value" : "2-2.58.00000040"
        }],
        "name" : "Hausarztpraxis",
        "telecom" : [{
          "system" : "phone",
          "value" : "0301234567"
        },
        {
          "system" : "fax",
          "value" : "030123456789"
        },
        {
          "system" : "email",
          "value" : "mvz@e-mail.de"
        }],
        "address" : [{
          "type" : "both",
          "line" : ["Herbert-Lewin-Platz 2"],
          "_line" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
              "valueString" : "2"
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
              "valueString" : "Herbert-Lewin-Platz"
            }]
          }],
          "city" : "Berlin",
          "postalCode" : "10623",
          "country" : "D"
        },
        {
          "type" : "both",
          "line" : ["Herbert-Lewin-Platz 2"],
          "_line" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
              "valueString" : "2"
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
              "valueString" : "Herbert-Lewin-Platz"
            }]
          }],
          "city" : "Berlin",
          "postalCode" : "10623",
          "country" : "D"
        }]
      }
    },
    {
      "name" : "practitioner",
      "resource" : {
        "resourceType" : "Practitioner",
        "id" : "667ffd79-42a3-4002-b7ca-6b9098f20ccb",
        "meta" : {
          "profile" : ["https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory"],
          "tag" : [{
            "system" : "https://gematik.de/fhir/directory/CodeSystem/Origin",
            "code" : "ldap"
          }]
        },
        "name" : [{
          "use" : "official",
          "text" : "Dr. med. Emma Schneider",
          "family" : "Schneider",
          "_family" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
              "valueString" : "Schneider"
            }]
          },
          "given" : ["Emma"],
          "prefix" : ["Dr. med."],
          "_prefix" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier",
              "valueCode" : "AC"
            }]
          }]
        }]
      }
    },
    {
      "name" : "prescriptionId",
      "valueString" : "160.100.000.000.023.70"
    }]
  }]
}

```
