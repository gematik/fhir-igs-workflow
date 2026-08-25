# output-example-1 - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **output-example-1**

## Parameters: output-example-1



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "output-example-1",
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
        "id" : "5ff1bd22-ce14-484e-be56-d2ba4adeac31",
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
            "system" : "http://fhir.de/CodeSystem/ifa/pzn",
            "code" : "07765007"
          }],
          "text" : "NEUPRO 8MG/24H PFT 7 ST"
        },
        "form" : {
          "coding" : [{
            "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM",
            "code" : "PFT"
          }]
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
          "reference" : "Medication/5ff1bd22-ce14-484e-be56-d2ba4adeac31"
        },
        "subject" : {
          "identifier" : {
            "system" : "http://fhir.de/sid/gkv/kvid-10",
            "value" : "X110411319"
          }
        },
        "authoredOn" : "2024-05-20",
        "requester" : {
          "reference" : "Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c"
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
          "system" : "https://gematik.de/fhir/sid/telematik-id",
          "value" : "2-2.58.00000040"
        },
        {
          "type" : {
            "coding" : [{
              "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
              "code" : "BSNR"
            }]
          },
          "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR",
          "value" : "724444400"
        }],
        "name" : "Hausarztpraxis",
        "telecom" : [{
          "system" : "phone",
          "value" : "030321654987"
        },
        {
          "system" : "email",
          "value" : "hausarztpraxis@e-mail.de"
        }],
        "address" : [{
          "type" : "both",
          "line" : ["Herbert-Lewin-Platz 2", "Erdgeschoss"],
          "_line" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
              "valueString" : "2"
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
              "valueString" : "Herbert-Lewin-Platz"
            }]
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator",
              "valueString" : "Erdgeschoss"
            }]
          }],
          "city" : "Berlin",
          "postalCode" : "10623",
          "country" : "D"
        },
        {
          "type" : "both",
          "line" : ["Herbert-Lewin-Platz 2", "Erdgeschoss"],
          "_line" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
              "valueString" : "2"
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
              "valueString" : "Herbert-Lewin-Platz"
            }]
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator",
              "valueString" : "Erdgeschoss"
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
        "id" : "d6f3b55d-3095-4655-96dc-da3bec21271c",
        "meta" : {
          "profile" : ["https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory"],
          "tag" : [{
            "system" : "https://gematik.de/fhir/directory/CodeSystem/Origin",
            "code" : "ldap"
          }]
        },
        "name" : [{
          "use" : "official",
          "text" : "Ben Schulz",
          "family" : "Schulz",
          "_family" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
              "valueString" : "Schulz"
            }]
          },
          "given" : ["Ben"]
        }]
      }
    },
    {
      "name" : "prescriptionId",
      "valueString" : "160.100.000.000.037.28"
    }]
  }]
}

```
