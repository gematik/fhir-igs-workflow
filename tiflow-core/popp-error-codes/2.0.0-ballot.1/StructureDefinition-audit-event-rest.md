# TI Audit Event Rest - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Audit Event Rest**

## Resource Profile: TI Audit Event Rest 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-core/StructureDefinition/audit-event-rest | *Version*:2.0.0-ballot.1 |
| Active as of 2026-06-01 | *Computable Name*:TIAuditEventRest |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Das AuditEvent-Profil für die Protokollierung des Zugriffs auf einen FHIR Data Service der Telematikinfrastruktur (TI) 

**Usages:**

* CapabilityStatements using this Profile: [CapabilityStatement für den TI-Flow-Fachdienst](CapabilityStatement-ti-flow-fachdienst-server.md)
* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/audit-event-rest)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-audit-event-rest.csv), [Excel](StructureDefinition-audit-event-rest.xlsx), [Schematron](StructureDefinition-audit-event-rest.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "audit-event-rest",
  "url" : "https://gematik.de/fhir/tiflow-core/StructureDefinition/audit-event-rest",
  "version" : "2.0.0-ballot.1",
  "name" : "TIAuditEventRest",
  "title" : "TI Audit Event Rest",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-01",
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
  "description" : "Das AuditEvent-Profil für die Protokollierung des Zugriffs auf einen FHIR Data Service der Telematikinfrastruktur (TI)",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/AuditEvent",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "AuditEvent",
      "path" : "AuditEvent"
    },
    {
      "id" : "AuditEvent.type",
      "path" : "AuditEvent.type",
      "fixedCoding" : {
        "system" : "http://terminology.hl7.org/CodeSystem/audit-event-type",
        "code" : "rest"
      },
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.type.system",
      "path" : "AuditEvent.type.system",
      "min" : 1
    },
    {
      "id" : "AuditEvent.type.code",
      "path" : "AuditEvent.type.code",
      "min" : 1
    },
    {
      "id" : "AuditEvent.subtype",
      "path" : "AuditEvent.subtype",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.action",
      "path" : "AuditEvent.action",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.outcome",
      "path" : "AuditEvent.outcome",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent",
      "path" : "AuditEvent.agent",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.type",
      "path" : "AuditEvent.agent.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.who.identifier",
      "path" : "AuditEvent.agent.who.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id",
        "http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.name",
      "path" : "AuditEvent.agent.name",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.source",
      "path" : "AuditEvent.source",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.source.site",
      "path" : "AuditEvent.source.site",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.source.observer",
      "path" : "AuditEvent.source.observer",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Device"]
      }]
    },
    {
      "id" : "AuditEvent.source.observer.reference",
      "path" : "AuditEvent.source.observer.reference",
      "min" : 1
    }]
  }
}

```
