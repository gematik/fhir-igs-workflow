# Example Parameters Patch Charge Item - TIFlow - Abrechnungsinformationen v2.0.0-ballot.2

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Parameters Patch Charge Item**

## Example Parameters: Example Parameters Patch Charge Item



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "Example-Parameters-Patch-ChargeItem-1",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input"]
  },
  "parameter" : [{
    "name" : "markingFlag",
    "part" : [{
      "name" : "insuranceProvider",
      "valueBoolean" : true
    },
    {
      "name" : "taxOffice",
      "valueBoolean" : true
    }]
  }]
}

```
