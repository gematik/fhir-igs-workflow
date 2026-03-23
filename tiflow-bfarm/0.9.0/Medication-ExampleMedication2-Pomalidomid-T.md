# Beispiel BfArM Medication (Abgabe) - Pomalidomid - TIFlow - Datenaustausch BfArM Webdienst v0.9.0

TIFlow - Datenaustausch BfArM Webdienst

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel BfArM Medication (Abgabe) - Pomalidomid**

## Example Medication: Beispiel BfArM Medication (Abgabe) - Pomalidomid



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleMedication2-Pomalidomid-T",
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/ifa/pzn",
      "code" : "19201712"
    }],
    "text" : "Pomalidomid Accord 1 mg 21 x 1 Hartkapseln"
  },
  "form" : {
    "coding" : [{
      "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM",
      "code" : "HKP"
    }]
  }
}

```
