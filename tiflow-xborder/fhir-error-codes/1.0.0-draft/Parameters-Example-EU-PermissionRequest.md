# GEM_ERPEU_PR_PAR_Access_Authorization_Request - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM_ERPEU_PR_PAR_Access_Authorization_Request**

## Example Parameters: GEM_ERPEU_PR_PAR_Access_Authorization_Request



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "Example-EU-PermissionRequest",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request"]
  },
  "parameter" : [{
    "name" : "countryCode",
    "valueCoding" : {
      "system" : "urn:iso:std:iso:3166",
      "code" : "BE"
    }
  },
  {
    "name" : "accessCode",
    "valueIdentifier" : {
      "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_EU_AccessCode",
      "value" : "ABC123"
    }
  }]
}

```
