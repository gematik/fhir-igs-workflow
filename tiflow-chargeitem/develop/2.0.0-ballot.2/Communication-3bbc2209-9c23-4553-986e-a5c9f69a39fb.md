# Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message - TIFlow - Abrechnungsinformationen v2.0.0-ballot.2

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message**

## Example Communication: Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message

Profile: [Reply on change Request on ChargeItem from pharmacy to Patient](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReply.md)

Tag: 

**basedOn**: [ChargeItem Not Applicable](ChargeItem-a51520ec-0899-404f-bb97-fe7d461f90a8.md)

**status**: Unknown

**sent**: 2028-10-01 15:29:00+0000

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
    "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply"],
    "tag" : [{
      "display" : "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
    }]
  },
  "basedOn" : [{
    "reference" : "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8"
  }],
  "status" : "unknown",
  "sent" : "2028-10-01T15:29:00.434+00:00",
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
