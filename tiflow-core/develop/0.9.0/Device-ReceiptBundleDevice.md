# Gerät für Quittungs-Bundle - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Gerät für Quittungs-Bundle**

## Example Device: Gerät für Quittungs-Bundle

Profile: [https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device|1.6](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device|1.6)

**status**: Active

**serialNumber**: 1.14.0

### DeviceNames

| | | |
| :--- | :--- | :--- |
| - | **Name** | **Type** |
| * | E-Rezept-Fachdienst | User Friendly name |

### Versions

| | |
| :--- | :--- |
| - | **Value** |
| * | 1.14.0 |

**contact**: [betrieb@gematik.de](mailto:betrieb@gematik.de)



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "ReceiptBundleDevice",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device|1.6"]
  },
  "status" : "active",
  "serialNumber" : "1.14.0",
  "deviceName" : [{
    "name" : "E-Rezept-Fachdienst",
    "type" : "user-friendly-name"
  }],
  "version" : [{
    "value" : "1.14.0"
  }],
  "contact" : [{
    "system" : "email",
    "value" : "betrieb@gematik.de"
  }]
}

```
