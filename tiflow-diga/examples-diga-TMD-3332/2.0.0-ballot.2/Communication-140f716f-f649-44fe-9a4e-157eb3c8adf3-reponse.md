# DiGA-Nachricht eines Kostenträgers an den Patienten - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DiGA-Nachricht eines Kostenträgers an den Patienten**

## Example Communication: DiGA-Nachricht eines Kostenträgers an den Patienten

Profile: [GEM ERP PR Communication DiGA](StructureDefinition-GEM-ERP-PR-Communication-DiGA.md)

**basedOn**: [Task: extension = Muster 16 (Digitale Gesundheitsanwendungen) (CodeSystem der Flowtypes in TIFlow Anwendungen#162),2028-10-09,2028-10-09; identifier = https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId#162.000.000.000.000.01 (use: official, ),https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode#777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea (use: official, ); status = ready; intent = order; authoredOn = 2028-10-01 15:29:00+0000; lastModified = 2028-10-01 15:29:00+0000; performerType = Kostenträger](Task-ExampleDiGATaskInReadyState.md)

**status**: Unknown

**sent**: 2028-10-01 15:29:00+0000

**recipient**: Identifier: NamingSystemKVID/X234567890

**sender**: Identifier: `https://gematik.de/fhir/sid/telematik-id`/8-SMC-B-Testkarte-783498105628375

### Payloads

| | |
| :--- | :--- |
| - | **Content[x]** |
| * | Nachrichteninhalt für den Versicherten |



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "140f716f-f649-44fe-9a4e-157eb3c8adf3-reponse",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA"]
  },
  "basedOn" : [{
    "reference" : "Task/ExampleDiGATaskInReadyState"
  }],
  "status" : "unknown",
  "sent" : "2028-10-01T15:29:00.434+00:00",
  "recipient" : [{
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X234567890"
    }
  }],
  "sender" : {
    "identifier" : {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "8-SMC-B-Testkarte-783498105628375"
    }
  },
  "payload" : [{
    "contentString" : "Nachrichteninhalt für den Versicherten"
  }]
}

```
