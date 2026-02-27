# DispenseOperation - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DispenseOperation**

## OperationDefinition: DispenseOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/OperationDefinition/DispenseOperation | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:Dispense |

 
Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "DispenseOperation",
  "url" : "https://gematik.de/fhir/erp/OperationDefinition/DispenseOperation",
  "version" : "1.0.0-draft",
  "name" : "Dispense",
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
  "inputProfile" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-dispense-operation-input-parameters",
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
    "min" : 1,
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
      "min" : 1,
      "max" : "1",
      "type" : "Medication"
    }]
  }]
}

```
