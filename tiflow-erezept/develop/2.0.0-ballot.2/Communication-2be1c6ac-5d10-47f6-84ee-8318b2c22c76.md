# DiGA-Zuweisung des Patienten an die Krankenkasse - TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DiGA-Zuweisung des Patienten an die Krankenkasse**

## Example Communication: DiGA-Zuweisung des Patienten an die Krankenkasse

Profile: [GEM ERP PR Communication DispReq](StructureDefinition-GEM-ERP-PR-Communication-DispReq.md) version: 2.0.0-ballot.2

Tags: , 

**TI Flow Type**: [CodeSystem der Flowtypes in TIFlow Anwendungen: 162](https://gematik.de/fhir/tiflow/2.0.0-ballot.2/CodeSystem-ti-flowtypes-codes.html#ti-flowtypes-codes-162) (Flowtype für Digitale Gesundheitsanwendungen)

**basedOn**: [Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea)

**status**: Unknown

**sent**: 2028-10-01 15:29:00+0000

**recipient**: Identifier: `https://gematik.de/fhir/sid/telematik-id`/8-SMC-B-Testkarte-883110000123465

**sender**: Identifier: NamingSystemKVID/X234567890



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "2be1c6ac-5d10-47f6-84ee-8318b2c22c76",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq|2.0"],
    "tag" : [{
      "display" : "Dispense Request from Patient to Health Care Provider"
    },
    {
      "display" : "Communication message sent by patient to Health Care Provider to request the redeemCode for a DiGA"
    }]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType",
    "valueCoding" : {
      "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
      "code" : "162",
      "display" : "Flowtype für Digitale Gesundheitsanwendungen"
    }
  }],
  "basedOn" : [{
    "reference" : "Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
  }],
  "status" : "unknown",
  "sent" : "2028-10-01T15:29:00.434+00:00",
  "recipient" : [{
    "identifier" : {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "8-SMC-B-Testkarte-883110000123465"
    }
  }],
  "sender" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X234567890"
    }
  }
}

```
