# Gerät für Quittungs-Bundle - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Gerät für Quittungs-Bundle**

## Example Device: Gerät für Quittungs-Bundle

Profile: [GEM ERP PR Device](https://gematik.de/fhir/tiflow/2.0.0-ballot.3/StructureDefinition-GEM-ERP-PR-Device.html)

**status**: Active

**serialNumber**: 2.0.0

### DeviceNames

| | | |
| :--- | :--- | :--- |
| - | **Name** | **Type** |
| * | TI-Flow-Fachdienst | User Friendly name |

### Versions

| | |
| :--- | :--- |
| - | **Value** |
| * | 2.0.0 |

**contact**: [betrieb@gematik.de](mailto:betrieb@gematik.de)



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "ReceiptBundleDevice",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device"]
  },
  "status" : "active",
  "serialNumber" : "2.0.0",
  "deviceName" : [{
    "name" : "TI-Flow-Fachdienst",
    "type" : "user-friendly-name"
  }],
  "version" : [{
    "value" : "2.0.0"
  }],
  "contact" : [{
    "system" : "email",
    "value" : "betrieb@gematik.de"
  }]
}

```
