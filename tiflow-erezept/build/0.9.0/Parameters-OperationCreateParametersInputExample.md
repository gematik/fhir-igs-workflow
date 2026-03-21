# Beispiel für $create Operation Parameter - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für $create Operation Parameter**

## Example Parameters: Beispiel für $create Operation Parameter



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "OperationCreateParametersInputExample",
  "parameter" : [{
    "name" : "workflowType",
    "valueCoding" : {
      "system" : "https://gematik.de/fhir/tiflow/erezept/CodeSystem/GEM-ERP-CS-FlowType",
      "code" : "160"
    }
  }]
}

```
