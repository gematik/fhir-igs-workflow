# CloseOperation - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CloseOperation**

## OperationDefinition: CloseOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/OperationDefinition/CloseOperation | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:Close |

 
Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "CloseOperation",
  "url" : "https://gematik.de/fhir/erp/OperationDefinition/CloseOperation",
  "version" : "1.0.0-draft",
  "name" : "Close",
  "status" : "draft",
  "kind" : "operation",
  "date" : "2025-12-15",
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
  "description" : "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "close",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "inputProfile" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-input-parameters",
  "outputProfile" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-output-parameters",
  "parameter" : [{
    "name" : "secret",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Der secret Parameter, der einer Apotheke den exklusiven Zugriff auf die Aufgabe als Teil der URL ermöglicht. Dieser Parameter muss dem Wert entsprechen, der in Task.identifier:Secret gespeichert ist. Andernfalls wird der Vorgang mit einem Fehler abgebrochen.",
    "type" : "string"
  },
  {
    "name" : "rxDispensation",
    "use" : "in",
    "min" : 0,
    "max" : "*",
    "documentation" : "Informationen zu abgegebenen Medikament(en)",
    "part" : [{
      "name" : "medicationDispense",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "MedicationDispense"
    },
    {
      "name" : "medication",
      "use" : "in",
      "min" : 0,
      "max" : "1",
      "type" : "Medication"
    }]
  },
  {
    "name" : "return",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "documentation" : "Das Quittungs Bundle, das Angaben zum signierenden Fachdienst, die Telematik-ID der Apotheke und die Signatur enthält.",
    "type" : "Bundle"
  }]
}

```
