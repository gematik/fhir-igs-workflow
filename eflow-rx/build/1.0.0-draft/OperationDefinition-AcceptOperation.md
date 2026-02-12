# AcceptOperation - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **AcceptOperation**

## OperationDefinition: AcceptOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/OperationDefinition/AcceptOperation | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:Accept |

 
Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in ‘in-progress’. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "AcceptOperation",
  "url" : "https://gematik.de/fhir/erp/OperationDefinition/AcceptOperation",
  "version" : "1.0.0-draft",
  "name" : "Accept",
  "status" : "draft",
  "kind" : "operation",
  "date" : "2025-12-15",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "affectsState" : true,
  "code" : "accept",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "outputProfile" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-accept-operation-output-parameters",
  "parameter" : [
    {
      "name" : "ac",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "documentation" : "Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.",
      "type" : "string"
    },
    {
      "name" : "return",
      "use" : "out",
      "min" : 1,
      "max" : "1",
      "documentation" : "Sammlung von Ressourcen (Task und Binary), damit eine Apotheke ein eRezept verarbeiten kann, das Folgendes enthält: 1. die aktualisierte Task (einschließlich eines Geheimnisses, das einer Apotheke exklusiven Zugriff auf die Task gewährt) und 2. eine base64Binary des qualifiziert signierten eRezepts. Der Status der Task ändert sich in 'in-progress'. Der Rezeptserver erstellt ein secret und speichert sie in Task.identifier:Secret.",
      "type" : "Bundle"
    }
  ]
}

```
