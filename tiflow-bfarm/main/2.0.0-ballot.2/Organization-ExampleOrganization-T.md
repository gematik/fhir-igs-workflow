# Beispiel BfArM Organisation - Implementation Guide TIFlow - Datenaustausch BfArM Webdienst v2.0.0-ballot.2

Implementation Guide

TIFlow - Datenaustausch BfArM Webdienst

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel BfArM Organisation**

## Example Organization: Beispiel BfArM Organisation

Profile: [E-T-Rezept Organization](StructureDefinition-erp-tprescription-organization.md)

**identifier**: `https://gematik.de/fhir/sid/telematik-id`/3-Test-APO000053

**name**: Stadt-Apotheke

**telecom**: [+49 987 6543210](tel:+499876543210)

**address**: Hauptstraße 10 Beispielstadt 54321 DE 



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "ExampleOrganization-T",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow-bfarm/StructureDefinition/erp-tprescription-organization"]
  },
  "identifier" : [{
    "system" : "https://gematik.de/fhir/sid/telematik-id",
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
