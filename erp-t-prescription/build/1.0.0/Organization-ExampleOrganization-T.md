# Beispiel BfArM Organisation - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel BfArM Organisation**

## Example Organization: Beispiel BfArM Organisation

Profile: [E-T-Rezept Organization](StructureDefinition-erp-tprescription-organization.md)

**identifier**: 3-Test-APO000053

**name**: Stadt-Apotheke

**telecom**: [+49 987 6543210](tel:+499876543210)

**address**: Hauptstraße 10 Beispielstadt 54321 DE 



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "ExampleOrganization-T",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-organization"]
  },
  "identifier" : [{
    "value" : "3-Test-APO000053"
  }],
  "name" : "Stadt-Apotheke",
  "telecom" : [{
    "system" : "phone",
    "value" : "+49 987 6543210"
  }],
  "address" : [{
    "line" : ["Hauptstraße 10"],
    "city" : "Beispielstadt",
    "postalCode" : "54321",
    "country" : "DE"
  }]
}

```
