# Antwortbundle fuer GET /Consent - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Antwortbundle fuer GET /Consent**

## Example Bundle: Antwortbundle fuer GET /Consent



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "example-searchset-consent",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Consent?category=CHARGCONS"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Consent/QueryConsentCHARGCONS",
    "resource" : {
      "resourceType" : "Consent",
      "id" : "QueryConsentCHARGCONS",
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
          "system" : "http://loinc.org",
          "code" : "59284-0",
          "display" : "Consent Document"
        }]
      }],
      "patient" : {
        "identifier" : {
          "system" : "http://fhir.de/sid/gkv/kvid-10",
          "value" : "X123456789"
        }
      },
      "dateTime" : "2025-01-15T10:15:00+01:00",
      "policyRule" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
          "code" : "OPTIN"
        }]
      }
    }
  }]
}

```
