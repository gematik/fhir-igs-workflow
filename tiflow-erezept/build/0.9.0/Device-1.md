# Gerät für Quittungs-Bundle - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Gerät für Quittungs-Bundle**

## Example Device: Gerät für Quittungs-Bundle

Profile: [GEM ERP PR Device](StructureDefinition-GEM-ERP-PR-Device.md)

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
  "id" : "1",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/erezept/StructureDefinition/GEM-ERP-PR-Device"]
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
