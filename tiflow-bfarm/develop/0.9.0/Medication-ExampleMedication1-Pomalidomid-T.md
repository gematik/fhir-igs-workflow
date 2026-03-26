# Beispiel BfArM Medication (Verordnung) - Pomalidomid - TIFlow - Datenaustausch BfArM Webdienst v0.9.0

TIFlow - Datenaustausch BfArM Webdienst

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel BfArM Medication (Verordnung) - Pomalidomid**

## Example Medication: Beispiel BfArM Medication (Verordnung) - Pomalidomid



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleMedication1-Pomalidomid-T",
  "code" : {
    "coding" : [{
      "system" : "http://www.whocc.no/atc",
      "code" : "L04AX06",
      "display" : "pomalidomide"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM",
      "code" : "HKP",
      "display" : "Hartkapseln"
    }]
  }
}

```
