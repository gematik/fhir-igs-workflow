# Consent to store digital ChargeItem - TIFlow - Abrechnungsinformationen v1.0.0-draft

TIFlow - Abrechnungsinformationen

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Consent to store digital ChargeItem**

## Example Consent: Consent to store digital ChargeItem

Profile: [https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent|1.1](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent|1.1)

## Participants

* **Role**: Patient
  * **Details**: Identifier: NamingSystemKVID/P987654321

This consent is made under the regulation opt-in .

The subject has given their consent.



## Resource Content

```json
{
  "resourceType" : "Consent",
  "id" : "ChargeItemConsent-Request",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent|1.1"]
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
