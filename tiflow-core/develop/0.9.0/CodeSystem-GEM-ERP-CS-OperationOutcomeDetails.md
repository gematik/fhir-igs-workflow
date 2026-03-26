# GEM ERP CS OperationOutcomeDetails - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP CS OperationOutcomeDetails**

## CodeSystem: GEM ERP CS OperationOutcomeDetails 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OperationOutcomeDetails | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_CS_OperationOutcomeDetails |
| **Copyright/Legal**: gematik GmbH | |

 
Fachliche Fehlercodes des E-Rezept-Fachdienst 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_OperationOutcomeDetails](ValueSet-GEM-ERP-VS-OperationOutcomeDetails.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-OperationOutcomeDetails",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OperationOutcomeDetails",
  "version" : "0.9.0",
  "name" : "GEM_ERP_CS_OperationOutcomeDetails",
  "title" : "GEM ERP CS OperationOutcomeDetails",
  "status" : "draft",
  "date" : "2025-09-25",
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
  "description" : "Fachliche Fehlercodes des E-Rezept-Fachdienst",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
    "code" : "ERPFD_NO_VALID_STRUCTURE",
    "display" : "Invalid Data Structure in ePrescription Service"
  },
  {
    "code" : "ERPFD_PRESCRIPTION_NO_EXIST",
    "display" : "Prescription Not Found in ePrescription Service"
  },
  {
    "code" : "ERPFD_PRESCRIPTION_STATUS",
    "display" : "Operation Not Permitted on Current Prescription Status"
  },
  {
    "code" : "ERPFD_PARAMETERS_REFERENCE_NO_EXIST",
    "display" : "Unresolved Reference in Parameters"
  },
  {
    "code" : "ERPFD_PARAMETERS_INVALID_CONTENT",
    "display" : "Provided content not allowed"
  },
  {
    "code" : "ERPFD_DOSAGE_INVALID",
    "display" : "Invalid dosage structure or content"
  }]
}

```
