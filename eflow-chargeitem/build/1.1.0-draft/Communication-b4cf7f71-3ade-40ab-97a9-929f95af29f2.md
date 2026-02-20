# Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode**

## Example Communication: Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode

Profile: [Request for Modification on ChargeItemversion: null1.1.0-draft)](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReq.md)

Tag: Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode (Details: [not stated] code null = 'Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode')

**basedOn**: [ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.2&canonical=http://fhir.org/packages/de.basisprofil.r4/ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea)

**status**: Unknown

**sent**: 2025-10-01 15:29:00+0000

**recipient**: Identifier: `https://gematik.de/fhir/sid/telematik-id`/3-2-APO-XanthippeVeilchenblau01

**sender**: Identifier: NamingSystemKVID/P987654321

### Payloads

| | |
| :--- | :--- |
| - | **Content[x]** |
| * | Bitte meinen Namen in Günther ändern, Waltraud ist falsch. |



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "b4cf7f71-3ade-40ab-97a9-929f95af29f2",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq|1.1"],
    "tag" : [{
      "display" : "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
    }]
  },
  "basedOn" : [{
    "reference" : "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
  }],
  "status" : "unknown",
  "sent" : "2025-10-01T15:29:00.434+00:00",
  "recipient" : [{
    "identifier" : {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "3-2-APO-XanthippeVeilchenblau01"
    }
  }],
  "sender" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "P987654321"
    }
  },
  "payload" : [{
    "contentString" : "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."
  }]
}

```
