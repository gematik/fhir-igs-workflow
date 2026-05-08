# Einwilligung fuer den Use Case CHARGCONS - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Einwilligung fuer den Use Case CHARGCONS**

## Example Consent: Einwilligung fuer den Use Case CHARGCONS

## Participants

* **Role**: Patient
  * **Details**: Identifier: NamingSystemKVID/X123456789

This consent is made under the regulation opt-in .

The subject has given their consent.



## Resource Content

```json
{
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

```
