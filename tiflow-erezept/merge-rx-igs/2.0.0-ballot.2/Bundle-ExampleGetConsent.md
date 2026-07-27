# Example for a Bundle with a Consent - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example for a Bundle with a Consent**

## Example Bundle: Example for a Bundle with a Consent



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleGetConsent",
  "type" : "searchset",
  "timestamp" : "2025-10-01T12:03:23Z",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-dev.zentral.erp.splitdns.ti-dienste.de/Consent?category=EUDISPCONS"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-dev.zentral.erp.splitdns.ti-dienste.de/Consent/f97a0772-c99f-4159-90c6-2a41c7d96779",
    "resource" : {
      "resourceType" : "Consent",
      "id" : "f97a0772-c99f-4159-90c6-2a41c7d96779",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERPEU-PR-Consent"]
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
          "system" : "https://gematik.de/fhir/tiflow-erezept/CodeSystem/GEM-ERPEU-CS-ConsentType",
          "code" : "EUDISPCONS",
          "display" : "Consent for redeeming e-prescriptions in EU countries"
        }]
      }],
      "patient" : {
        "identifier" : {
          "system" : "http://fhir.de/sid/gkv/kvid-10",
          "value" : "X123456789",
          "assigner" : {
            "identifier" : {
              "system" : "http://fhir.de/sid/arge-ik/iknr",
              "value" : "987655435"
            }
          }
        }
      },
      "dateTime" : "2025-10-01T12:03:23Z",
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
