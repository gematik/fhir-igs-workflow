# Example Parameters Patch Charge Item - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

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
    "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input|1.1"]
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
