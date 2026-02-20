# GEM ERP CS OperationOutcomeDetails - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP CS OperationOutcomeDetails**

## CodeSystem: GEM ERP CS OperationOutcomeDetails 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM-ERP-CS-OperationOutcomeDetails | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_CS_OperationOutcomeDetails |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Fachliche Fehlercodes des E-Rezept-Fachdienst 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_OperationOutcomeDetails](ValueSet-GEM-ERP-VS-OperationOutcomeDetails.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-OperationOutcomeDetails",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM-ERP-CS-OperationOutcomeDetails",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_CS_OperationOutcomeDetails",
  "title" : "GEM ERP CS OperationOutcomeDetails",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
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
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
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
