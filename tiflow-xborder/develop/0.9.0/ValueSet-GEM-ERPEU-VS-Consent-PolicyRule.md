# ValueSet of Consent PolyRule Codes - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ValueSet of Consent PolyRule Codes**

## ValueSet: ValueSet of Consent PolyRule Codes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/ValueSet/GEM_ERPEU_VS_Consent_PolicyRule | *Version*:0.9.0 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_VS_Consent_PolicyRule |

 
Type of Policy Rules for Consents of the ePrescription. 

 **References** 

* [Consent for ePrescriptions](StructureDefinition-GEM-ERPEU-PR-Consent.md)
* [Consent for ePrescriptions](StructureDefinition-GEM-ERPEU-PR-Consent.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "GEM-ERPEU-VS-Consent-PolicyRule",
  "url" : "https://gematik.de/fhir/erp-eu/ValueSet/GEM_ERPEU_VS_Consent_PolicyRule",
  "version" : "0.9.0",
  "name" : "GEM_ERPEU_VS_Consent_PolicyRule",
  "title" : "ValueSet of Consent PolyRule Codes",
  "status" : "active",
  "date" : "2026-01-08",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    },
    {
      "system" : "email",
      "value" : "erp-umsetzung@gematik.de"
    }]
  }],
  "description" : "Type of Policy Rules for Consents of the ePrescription.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
      "version" : "10.0.0",
      "concept" : [{
        "code" : "OPTIN"
      }]
    }]
  }
}

```
