# Consent to store digital ChargeItem - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.3

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Consent to store digital ChargeItem**

## Example Consent: Consent to store digital ChargeItem



## Resource Content

```json
{
  "resourceType" : "Consent",
  "id" : "ChargeItemConsent-Request",
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
  "policyRule" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
      "code" : "OPTIN"
    }]
  }
}

```
