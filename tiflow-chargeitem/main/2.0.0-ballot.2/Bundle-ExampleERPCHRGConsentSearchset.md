# Consent searchset response for ERP-CHRG - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.2

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Consent searchset response for ERP-CHRG**

## Example Bundle: Consent searchset response for ERP-CHRG



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleERPCHRGConsentSearchset",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.example.org/Consent?category=CHARGCONS"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.example.org/Consent/0dcc5d4c-bf24-4c06-b02e-be5bc24587e2",
    "resource" : {
      "resourceType" : "Consent",
      "id" : "0dcc5d4c-bf24-4c06-b02e-be5bc24587e2",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent"]
      },
      "status" : "active",
      "scope" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/consentscope",
          "code" : "patient-privacy",
          "display" : "Privacy Consent"
        }]
      },
      "category" : [{
        "coding" : [{
          "system" : "https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType",
          "code" : "CHARGCONS",
          "display" : "Consent for saving electronic charge item"
        }]
      }],
      "patient" : {
        "identifier" : {
          "system" : "http://fhir.de/sid/gkv/kvid-10",
          "value" : "P987654321",
          "assigner" : {
            "identifier" : {
              "system" : "http://fhir.de/sid/arge-ik/iknr",
              "value" : "168140950"
            }
          }
        }
      },
      "dateTime" : "2028-10-01T15:29:00.434+00:00",
      "policyRule" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
          "code" : "OPTIN"
        }]
      }
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
