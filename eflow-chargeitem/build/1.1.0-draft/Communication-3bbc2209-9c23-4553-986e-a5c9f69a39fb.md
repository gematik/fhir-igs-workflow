# Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message**

## Example Communication: Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message

Profile: [Reply on change Request on ChargeItem from pharmacy to Patientversion: null1.1.0-draft)](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReply.md)

Tag: Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message (Details: [not stated] code null = 'Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message')

**basedOn**: [ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.2&canonical=http://fhir.org/packages/de.basisprofil.r4/ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8)

**status**: Unknown

**sent**: 2025-10-01 15:29:00+0000

**recipient**: Identifier: NamingSystemKVID/P987654321

**sender**: Identifier: `https://gematik.de/fhir/sid/telematik-id`/3-2-APO-XanthippeVeilchenblau01

### Payloads

| | |
| :--- | :--- |
| - | **Content[x]** |
| * | Erledigt. |



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "3bbc2209-9c23-4553-986e-a5c9f69a39fb",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply|1.1"],
    "tag" : [{
      "display" : "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
    }]
  },
  "basedOn" : [{
    "reference" : "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8"
  }],
  "status" : "unknown",
  "sent" : "2025-10-01T15:29:00.434+00:00",
  "recipient" : [{
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "P987654321"
    }
  }],
  "sender" : {
    "identifier" : {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "3-2-APO-XanthippeVeilchenblau01"
    }
  },
  "payload" : [{
    "contentString" : "Erledigt."
  }]
}

```
