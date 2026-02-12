# AbortOperation - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **AbortOperation**

## OperationDefinition: AbortOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/OperationDefinition/AbortOperation | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:Abort |

 
Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "AbortOperation",
  "url" : "https://gematik.de/fhir/erp/OperationDefinition/AbortOperation",
  "version" : "1.0.0-draft",
  "name" : "Abort",
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
  "description" : "Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen.",
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
  "code" : "abort",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "parameter" : [
    {
      "name" : "ac",
      "use" : "in",
      "min" : 0,
      "max" : "1",
      "documentation" : "[Nur von Patienten und Anbietern (Ärzten/Zahnärzten) zu verwenden] Der secret Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.",
      "type" : "string"
    },
    {
      "name" : "secret",
      "use" : "in",
      "min" : 0,
      "max" : "1",
      "documentation" : "[Nur von der Apotheke zu verwenden] Der secret Parameter, der es einer Apotheke ermöglicht, exklusiv über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen.",
      "type" : "string"
    }
  ]
}

```
