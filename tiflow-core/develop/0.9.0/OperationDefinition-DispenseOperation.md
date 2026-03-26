# DispenseOperation - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DispenseOperation**

## OperationDefinition: DispenseOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/OperationDefinition/DispenseOperationDefinition | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:Dispense |

 
Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "DispenseOperation",
  "url" : "https://gematik.de/fhir/erp/OperationDefinition/DispenseOperationDefinition",
  "version" : "0.9.0",
  "name" : "Dispense",
  "status" : "draft",
  "kind" : "operation",
  "date" : "2025-09-25",
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
  "description" : "Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "dispense",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "inputProfile" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_DispenseOperation_Input"
}

```
