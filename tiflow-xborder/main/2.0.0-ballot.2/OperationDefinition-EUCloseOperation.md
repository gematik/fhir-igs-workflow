# EUCloseOperation - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **EUCloseOperation**

## OperationDefinition: EUCloseOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-xborder/OperationDefinition/EUCloseOperation | *Version*:2.0.0-ballot.2 |
| Draft as of 2026-06-30 | *Computable Name*:EUCloseOperation |

 
The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "EUCloseOperation",
  "url" : "https://gematik.de/fhir/tiflow-xborder/OperationDefinition/EUCloseOperation",
  "version" : "2.0.0-ballot.2",
  "name" : "EUCloseOperation",
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
  "description" : "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "eu-close",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "inputProfile" : "https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input"
}

```
