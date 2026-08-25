# ChargeItem-PATCH-Input - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.3

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ChargeItem-PATCH-Input**

## Example Parameters: ChargeItem-PATCH-Input



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "ChargeItem-PATCH-Input",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input"]
  },
  "parameter" : [{
    "name" : "markingFlag",
    "part" : [{
      "name" : "insuranceProvider",
      "valueBoolean" : false
    },
    {
      "name" : "taxOffice",
      "valueBoolean" : false
    }]
  }]
}

```
