# Beispiel für $create Operation Parameter - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

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
      "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
      "code" : "160"
    }
  }]
}

```
