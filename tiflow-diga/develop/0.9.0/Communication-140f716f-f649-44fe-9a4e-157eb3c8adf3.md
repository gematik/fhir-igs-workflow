# DiGA-Nachricht eines Kostenträgers an den Patienten - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DiGA-Nachricht eines Kostenträgers an den Patienten**

## Example Communication: DiGA-Nachricht eines Kostenträgers an den Patienten

Profile: [GEM ERP PR Communication DiGA](StructureDefinition-GEM-ERP-PR-Communication-DiGA.md)

**basedOn**: [Task/162.000.000.000.000.01](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Task/162.000.000.000.000.01)

**status**: Unknown

**sent**: 2026-07-01 15:29:00+0000

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
  "id" : "140f716f-f649-44fe-9a4e-157eb3c8adf3",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/diga/StructureDefinition/GEM_ERP_PR_Communication_DiGA"]
  },
  "basedOn" : [{
    "reference" : "Task/162.000.000.000.000.01"
  }],
  "status" : "unknown",
  "sent" : "2026-07-01T15:29:00.434+00:00",
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
