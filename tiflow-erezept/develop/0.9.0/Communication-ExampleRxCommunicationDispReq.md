# Rx Communication request example - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Rx Communication request example**

## Example Communication: Rx Communication request example

**status**: Unknown

**sent**: 2026-03-20 10:15:00+0100

### Payloads

| | |
| :--- | :--- |
| - | **Content[x]** |
| * | Bitte Rezept in Filiale bereitstellen |



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "ExampleRxCommunicationDispReq",
  "status" : "unknown",
  "sent" : "2026-03-20T10:15:00+01:00",
  "payload" : [{
    "contentString" : "Bitte Rezept in Filiale bereitstellen"
  }]
}

```
