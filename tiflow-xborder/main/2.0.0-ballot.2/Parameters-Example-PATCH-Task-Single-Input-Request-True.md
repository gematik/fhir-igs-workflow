# Example_PATCH_Task_Single_Input - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example_PATCH_Task_Single_Input**

## Example Parameters: Example_PATCH_Task_Single_Input



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "Example-PATCH-Task-Single-Input-Request-True",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PAR-PATCH-Task-Input"]
  },
  "parameter" : [{
    "name" : "eu-isRedeemableByPatientAuthorization",
    "valueBoolean" : true
  }]
}

```
