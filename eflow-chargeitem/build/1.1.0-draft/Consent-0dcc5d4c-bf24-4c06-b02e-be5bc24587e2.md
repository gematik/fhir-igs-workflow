# Consent to store digital ChargeItem - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Consent to store digital ChargeItem**

## Example Consent: Consent to store digital ChargeItem

Profile: [GEM_ERPCHRG_PR_Consentversion: null1.1.0-draft)](StructureDefinition-GEM-ERPCHRG-PR-Consent.md)

## Participants

* **Role**: # Who the consent applies toPatient
  * **Details**: Identifier: NamingSystemKVID/P987654321

This consent is made under the regulation opt-in .

The subject has given their consent.



## Resource Content

```json
{
  "resourceType" : "Consent",
  "id" : "0dcc5d4c-bf24-4c06-b02e-be5bc24587e2",
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
  "dateTime" : "2025-10-01T15:29:00.434+00:00",
  "policyRule" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
      "code" : "OPTIN"
    }]
  }
}

```
