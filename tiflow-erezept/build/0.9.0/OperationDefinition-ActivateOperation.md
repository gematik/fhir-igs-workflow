# ActivateOperation - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ActivateOperation**

## OperationDefinition: ActivateOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/erezept/OperationDefinition/ActivateOperation | *Version*:0.9.0 |
| Draft as of 2025-12-15 | *Computable Name*:Activate |

 
Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der E-Rezept-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "ActivateOperation",
  "url" : "https://gematik.de/fhir/tiflow/erezept/OperationDefinition/ActivateOperation",
  "version" : "0.9.0",
  "name" : "Activate",
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
  "description" : "Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der E-Rezept-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "activate",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "inputProfile" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "outputProfile" : "https://gematik.de/fhir/tiflow/erezept/StructureDefinition/eflow-rx-activate-operation-output-parameters",
  "parameter" : [{
    "name" : "ePrescription",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Das qualifizierte unterzeichnete Verordnung (QES) zur Aktivierung des E-Rezept-Workflows.",
    "type" : "Binary"
  },
  {
    "name" : "return",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "documentation" : "Geben Sie die aktualisierte und aktivierte Aufgabe zurück.",
    "type" : "Task"
  }]
}

```
