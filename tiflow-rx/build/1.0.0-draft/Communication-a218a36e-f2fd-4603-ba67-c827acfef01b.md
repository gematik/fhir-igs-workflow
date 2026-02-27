# Zuweisung des Patienten an die Apotheke - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Zuweisung des Patienten an die Apotheke**

## Example Communication: Zuweisung des Patienten an die Apotheke

Profile: [GEM ERP PR Communication DispReq](StructureDefinition-GEM-ERP-PR-Communication-DispReq.md)

Tags: Dispense Request from Patient to Pharmacy (Details: [not stated] code null = 'Dispense Request from Patient to Pharmacy'), Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode (Details: [not stated] code null = 'Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode')

**GEM ERP EX PrescriptionType**: EFlowRxFlowType: 160 (Flowtype für Apothekenpflichtige Arzneimittel)

**basedOn**: [Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea)

**status**: Unknown

**sent**: 2026-07-01 15:29:00+0000

**recipient**: Identifier: `https://gematik.de/fhir/sid/telematik-id`/3-SMC-B-Testkarte-883110000123465

**sender**: Identifier: NamingSystemKVID/X234567890

### Payloads

| | |
| :--- | :--- |
| - | **Content[x]** |
| * | { "version": "1", "supplyOptionsType": "delivery", "name": "Dr. Maximilian von Muster", "address": [ "wohnhaft bei Emilia Fischer", "Bundesallee 312", "123. OG", "12345 Berlin" ], "hint": "Bitte im Morsecode klingeln: -.-.", "phone": "004916094858168" } |



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "a218a36e-f2fd-4603-ba67-c827acfef01b",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Communication-DispReq"],
    "tag" : [{
      "display" : "Dispense Request from Patient to Pharmacy"
    },
    {
      "display" : "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
    }]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-PrescriptionType",
    "valueCoding" : {
      "system" : "https://gematik.de/fhir/erp/CodeSystem/EFlowRxFlowType",
      "code" : "160",
      "display" : "Flowtype für Apothekenpflichtige Arzneimittel"
    }
  }],
  "basedOn" : [{
    "reference" : "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
  }],
  "status" : "unknown",
  "sent" : "2026-07-01T15:29:00.434+00:00",
  "recipient" : [{
    "identifier" : {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "3-SMC-B-Testkarte-883110000123465"
    }
  }],
  "sender" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X234567890"
    }
  },
  "payload" : [{
    "contentString" : "{ \"version\": \"1\", \"supplyOptionsType\": \"delivery\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"hint\": \"Bitte im Morsecode klingeln: -.-.\", \"phone\": \"004916094858168\" }"
  }]
}

```
