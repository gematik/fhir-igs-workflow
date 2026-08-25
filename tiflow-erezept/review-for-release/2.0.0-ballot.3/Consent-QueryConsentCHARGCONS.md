# Einwilligung fuer den Use Case CHARGCONS - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Einwilligung fuer den Use Case CHARGCONS**

## Example Consent: Einwilligung fuer den Use Case CHARGCONS



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
      "display" : "Einwilligung - Dokument"
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
