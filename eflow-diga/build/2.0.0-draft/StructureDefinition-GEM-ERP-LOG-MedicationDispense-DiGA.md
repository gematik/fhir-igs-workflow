# Logical DiGA Medication Dispense - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Logical DiGA Medication Dispense**

## Logical Model: Logical DiGA Medication Dispense 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-LOG-MedicationDispense-DiGA | *Version*:2.0.0-draft |
| Draft as of 2026-02-06 | *Computable Name*:GEM_ERP_LOG_MedicationDispense_DiGA |

 
Fachliches Modell zur Beschreibung der Informationen, die bei $close und $dispense in der MedicationDispense-Ressource fuer DiGAs uebermittelt werden. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-diga|current/StructureDefinition/GEM-ERP-LOG-MedicationDispense-DiGA)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-LOG-MedicationDispense-DiGA.csv), [Excel](StructureDefinition-GEM-ERP-LOG-MedicationDispense-DiGA.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-LOG-MedicationDispense-DiGA",
  "url" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-LOG-MedicationDispense-DiGA",
  "version" : "2.0.0-draft",
  "name" : "GEM_ERP_LOG_MedicationDispense_DiGA",
  "title" : "Logical DiGA Medication Dispense",
  "status" : "draft",
  "date" : "2026-02-06",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    },
    {
      "system" : "email",
      "value" : "erp-umsetzung@gematik.de"
    }]
  }],
  "description" : "Fachliches Modell zur Beschreibung der Informationen, die bei $close und $dispense in der MedicationDispense-Ressource fuer DiGAs uebermittelt werden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
    "uri" : "GEM_ERP_PR_MedicationDispense_DiGA",
    "name" : "Mapping fuer MedicationDispense DiGA",
    "comment" : "This mapping maps the logical units of the DiGA MedicationDispense to the profile"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM-ERP-LOG-MedicationDispense-DiGA",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Element",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA",
      "short" : "Logical DiGA Medication Dispense",
      "definition" : "Fachliches Modell zur Beschreibung der Informationen, die bei $close und $dispense in der MedicationDispense-Ressource fuer DiGAs uebermittelt werden.",
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "GEM_ERP_PR_MedicationDispense_DiGA"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.prescriptionId",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.prescriptionId",
      "short" : "ID des E-Rezepts",
      "definition" : "ID des E-Rezepts",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "identifier[prescriptionID].value"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.status",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.status",
      "short" : "Status fixedValue: #completed",
      "definition" : "Status fixedValue: #completed",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "status"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.patientKVNR",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.patientKVNR",
      "short" : "KVNR des Patienten",
      "definition" : "KVNR des Patienten",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "subject.identifier.value"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabeAbgebendeInstutition",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabeAbgebendeInstutition",
      "short" : "Telematik-ID der abgebenden Institution",
      "definition" : "Telematik-ID der abgebenden Institution",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "performer.actor.identifier.value"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.freischaltCode",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.freischaltCode",
      "short" : "Freischaltcode fuer die DiGA",
      "definition" : "Optional, da die Kasse die Bereitstellung eines Freischaltcodes ablehnen kann.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "extension[redeemCode].valueString"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.deepLink",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.deepLink",
      "short" : "Universeller Deep Link, der vom DiGA Hersteller bereitgestellt wird",
      "definition" : "Universeller Deep Link, der vom DiGA Hersteller bereitgestellt wird",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "extension[deepLink].valueUrl"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabenZurDiGA",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabenZurDiGA",
      "short" : "Angaben zur DiGA. Zwingend anzugeben, wenn ein Freischaltcode bereitgestellt wird.",
      "definition" : "Angaben zur DiGA. Zwingend anzugeben, wenn ein Freischaltcode bereitgestellt wird.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "medicationReference"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabenZurDiGA.name",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabenZurDiGA.name",
      "short" : "Name der DiGA-Verordnungseinheit",
      "definition" : "Name der DiGA-Verordnungseinheit",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "medicationReference.display"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabenZurDiGA.pzn",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabenZurDiGA.pzn",
      "short" : "Pharmazentralnummer als eindeutige Identifikationsnummer zu einer Verordnungseinheit einer digitalen Gesundheitsanwendung (PZN).",
      "definition" : "Pharmazentralnummer als eindeutige Identifikationsnummer zu einer Verordnungseinheit einer digitalen Gesundheitsanwendung (PZN).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "medicationReference.identifier.value"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabenZurDiGA.dataAbsentReason",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.angabenZurDiGA.dataAbsentReason",
      "short" : "Wird angegeben, wenn kein Freischaltcode bereitgestellt wird. fixedValue: #unknown",
      "definition" : "Wird angegeben, wenn kein Freischaltcode bereitgestellt wird. fixedValue: #unknown",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "medicationReference.extension[data-absent-reason].valueCode"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.datum",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.datum",
      "short" : "Abgabedatum im Format YYYY-MM-DD",
      "definition" : "Abgabedatum im Format YYYY-MM-DD",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "whenHandedOver"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.note",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.note",
      "short" : "Wenn der Workflow abgeschlossen wird, ohne dass ein Freischaltcode bereitgestellt wird, muss dieser Wert angegeben werden.",
      "definition" : "Wenn der Workflow abgeschlossen wird, ohne dass ein Freischaltcode bereitgestellt wird, muss dieser Wert angegeben werden.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Annotation"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "note"
      }]
    },
    {
      "id" : "GEM-ERP-LOG-MedicationDispense-DiGA.substitution",
      "path" : "GEM-ERP-LOG-MedicationDispense-DiGA.substitution",
      "short" : "Substitution darf lt. BAS nicht erfolgen.",
      "definition" : "Substitution darf lt. BAS nicht erfolgen.",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "GEM-ERP-MAP-MedicationDispense-DiGA",
        "map" : "substitution"
      }]
    }]
  }
}

```
