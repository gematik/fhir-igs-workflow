# GEM ERP PR AuditEvent - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR AuditEvent**

## Resource Profile: GEM ERP PR AuditEvent 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AuditEvent | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERP_PR_AuditEvent |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
AuditEvent für die Protokollierung des Zugriffs auf E-Rezepte 

**Usages:**

* Examples for this Profile: [AuditEvent/9361863d-fec0-4ba9-8776-7905cf1b0cfa](AuditEvent-9361863d-fec0-4ba9-8776-7905cf1b0cfa.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.erezept|current/StructureDefinition/StructureDefinition-GEM-ERP-PR-AuditEvent.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-AuditEvent.csv), [Excel](StructureDefinition-GEM-ERP-PR-AuditEvent.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-AuditEvent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-AuditEvent",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AuditEvent",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_PR_AuditEvent",
  "title" : "GEM ERP PR AuditEvent",
  "status" : "active",
  "experimental" : false,
  "date" : "2028-04-01",
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
  "description" : "AuditEvent für die Protokollierung des Zugriffs auf E-Rezepte",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "dicom",
    "uri" : "http://nema.org/dicom",
    "name" : "DICOM Tag Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "w3c.prov",
    "uri" : "http://www.w3.org/ns/prov",
    "name" : "W3C PROV"
  },
  {
    "identity" : "fhirprovenance",
    "uri" : "http://hl7.org/fhir/provenance",
    "name" : "FHIR Provenance Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "AuditEvent",
  "baseDefinition" : "https://gematik.de/fhir/tiflow/StructureDefinition/audit-event-rest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "AuditEvent",
      "path" : "AuditEvent"
    },
    {
      "id" : "AuditEvent.meta",
      "path" : "AuditEvent.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.meta.profile",
      "path" : "AuditEvent.meta.profile",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "$this"
        }],
        "description" : "Slicing für meta profile",
        "ordered" : false,
        "rules" : "closed"
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.meta.profile:workflowProfile",
      "path" : "AuditEvent.meta.profile",
      "sliceName" : "workflowProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AuditEvent|2.0",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.source.site",
      "path" : "AuditEvent.source.site",
      "fixedString" : "TI-Flow-Fachdienst"
    },
    {
      "id" : "AuditEvent.entity",
      "path" : "AuditEvent.entity",
      "max" : "1"
    },
    {
      "id" : "AuditEvent.entity.what",
      "path" : "AuditEvent.entity.what",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity.name",
      "path" : "AuditEvent.entity.name",
      "short" : "KVNR des Patienten, auf den sich das AuditEvent bezieht",
      "definition" : "KVNR des Patienten, auf den sich das AuditEvent bezieht, verwendet als Filterkriterium, wenn der Patient auf seine Daten zugreift.",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity.description",
      "path" : "AuditEvent.entity.description",
      "short" : "E-Rezept-ID",
      "definition" : "E-Rezept-ID soll eine Beziehung zu den Versicherungsunternehmensdaten haben, wenn der Task bereits gelöscht wurde",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity:patient",
      "path" : "AuditEvent.entity",
      "sliceName" : "patient"
    },
    {
      "id" : "AuditEvent.entity:patient.what",
      "path" : "AuditEvent.entity.what",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity:patient.name",
      "path" : "AuditEvent.entity.name",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity:patient.description",
      "path" : "AuditEvent.entity.description",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity:task",
      "path" : "AuditEvent.entity",
      "sliceName" : "task"
    },
    {
      "id" : "AuditEvent.entity:task.what",
      "path" : "AuditEvent.entity.what",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity:task.name",
      "path" : "AuditEvent.entity.name",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity:task.description",
      "path" : "AuditEvent.entity.description",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity:service",
      "path" : "AuditEvent.entity",
      "sliceName" : "service"
    },
    {
      "id" : "AuditEvent.entity:service.what",
      "path" : "AuditEvent.entity.what",
      "min" : 1
    },
    {
      "id" : "AuditEvent.entity:service.description",
      "path" : "AuditEvent.entity.description",
      "min" : 1
    }]
  }
}

```
