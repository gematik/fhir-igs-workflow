# DiGA-Verordnungs-Bundle (unvollständig) - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DiGA-Verordnungs-Bundle (unvollständig)**

## Example Bundle: DiGA-Verordnungs-Bundle (unvollständig)



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleDiGABundle",
  "meta" : {
    "tag" : [{
      "display" : "Unvollständiges Beispiel eines DiGA-Rezept-Bundles - https://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle|1.2"
    }]
  },
  "identifier" : {
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
    "value" : "162.000.000.000.000.01"
  },
  "type" : "document",
  "timestamp" : "2028-10-01T15:29:00.434+00:00",
  "entry" : [{
    "fullUrl" : "https://erp-ref.example.org/Composition/ExampleDiGAComposition",
    "resource" : {
      "resourceType" : "Composition",
      "id" : "ExampleDiGAComposition",
      "status" : "final",
      "type" : {
        "coding" : [{
          "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_FORMULAR_ART",
          "code" : "e16D"
        }]
      },
      "date" : "2026-03-01T10:00:00+01:00",
      "author" : [{
        "display" : "Verordnende Praxis"
      }],
      "title" : "elektronische Verordnung digitaler Gesundheitsanwendungen"
    }
  }]
}

```
