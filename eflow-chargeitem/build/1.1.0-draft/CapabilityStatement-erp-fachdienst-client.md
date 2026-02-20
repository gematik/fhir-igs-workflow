# ERPCHRG CapabilityStatement für Clients des E-Rezept-Fachdienst - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERPCHRG CapabilityStatement für Clients des E-Rezept-Fachdienst**

## CapabilityStatement: ERPCHRG CapabilityStatement für Clients des E-Rezept-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/OperationDefinition/ERPFachdienstClientChrgOperationDefinition | *Version*:1.1.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:ERPFachdienstClientChrg |

 
Dieses CapabilityStatement legt die Anforderungen an Clients des E-Rezept-Fachdienst für PKV-Abrechnungsinformationen fest. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "erp-fachdienst-client",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
    "valueString" : "https://gematik.de/fhir/erpchrg"
  }],
  "url" : "https://gematik.de/fhir/erpchrg/OperationDefinition/ERPFachdienstClientChrgOperationDefinition",
  "version" : "1.1.0-draft",
  "name" : "ERPFachdienstClientChrg",
  "title" : "ERPCHRG CapabilityStatement für Clients des E-Rezept-Fachdienst",
  "status" : "draft",
  "date" : "2025-04-10",
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
  "description" : "Dieses CapabilityStatement legt die Anforderungen an Clients des E-Rezept-Fachdienst für PKV-Abrechnungsinformationen fest.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+json", "application/fhir+xml"],
  "rest" : [{
    "mode" : "client",
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "MAY"
      }],
      "type" : "Task",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "search-type"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "MAY"
      }],
      "type" : "ChargeItem",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "search-type"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "create"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "update"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "patch"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "delete"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "MAY"
      }],
      "type" : "Consent",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "create"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "delete"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "MAY"
      }],
      "type" : "Communication",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "code" : "create"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    }]
  }]
}

```
