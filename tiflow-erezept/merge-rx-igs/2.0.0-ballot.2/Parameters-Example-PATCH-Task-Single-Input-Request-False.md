# Example_PATCH_Task_Single_Input - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example_PATCH_Task_Single_Input**

## Example Parameters: Example_PATCH_Task_Single_Input



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "Example-PATCH-Task-Single-Input-Request-False",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERPEU-PR-PAR-PATCH-Task-Input"]
  },
  "parameter" : [{
    "name" : "eu-isRedeemableByPatientAuthorization",
    "valueBoolean" : false
  }]
}

```
