# GETPrescriptionEU - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GETPrescriptionEU**

## OperationDefinition: GETPrescriptionEU 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-erezept/OperationDefinition/GETPrescriptionEU | *Version*:2.0.0-ballot.3 |
| Draft as of 2026-06-30 | *Computable Name*:GETPrescriptionEU |

 
The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "GETPrescriptionEU",
  "url" : "https://gematik.de/fhir/tiflow-erezept/OperationDefinition/GETPrescriptionEU",
  "version" : "2.0.0-ballot.3",
  "name" : "GETPrescriptionEU",
  "status" : "draft",
  "kind" : "operation",
  "date" : "2026-06-30",
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
  "description" : "The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : false,
  "code" : "get-eu-prescriptions",
  "system" : true,
  "type" : false,
  "instance" : false,
  "inputProfile" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input",
  "outputProfile" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/gem-erpeu-pr-par-get-prescription-output",
  "parameter" : [{
    "name" : "return",
    "use" : "out",
    "min" : 0,
    "max" : "1",
    "documentation" : "Depending on the requesttype this operation returns a Bundle containing eRezept KBV_PR_ERP_Bundle Prescription-Bundles.",
    "type" : "Bundle"
  }]
}

```
