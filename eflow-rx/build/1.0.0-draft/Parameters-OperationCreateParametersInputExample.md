# Beispiel für $create Operation Parameter - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für $create Operation Parameter**

## Example Parameters: Beispiel für $create Operation Parameter



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "OperationCreateParametersInputExample",
  "parameter" : [
    {
      "name" : "workflowType",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/eflow-rx-flowtype",
        "code" : "160"
      }
    }
  ]
}

```
