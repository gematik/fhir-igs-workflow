# TI Audit Event Rest - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Audit Event Rest**

## Resource Profile: TI Audit Event Rest 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/audit-event-rest | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-01 | *Computable Name*:TIFlowAuditEventRest |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Das AuditEvent-Profil für die Protokollierung des Zugriffs auf einen FHIR Data Service der Telematikinfrastruktur (TI) 

**Usages:**

* CapabilityStatements using this Profile: [CapabilityStatement für den TI-Flow-Fachdienst](CapabilityStatement-ti-flow-fachdienst-server.md)
* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-audit-event-rest.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-audit-event-rest.csv), [Excel](StructureDefinition-audit-event-rest.xlsx), [Schematron](StructureDefinition-audit-event-rest.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "audit-event-rest",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/audit-event-rest",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowAuditEventRest",
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
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.type",
      "path" : "AuditEvent.agent.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.type.coding.system",
      "path" : "AuditEvent.agent.type.coding.system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.type.coding.code",
      "path" : "AuditEvent.agent.type.coding.code",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent:user",
      "path" : "AuditEvent.agent",
      "sliceName" : "user",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "AuditEvent.agent:user.type.coding.system",
      "path" : "AuditEvent.agent.type.coding.system",
      "patternUri" : "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
    },
    {
      "id" : "AuditEvent.agent:user.type.coding.code",
      "path" : "AuditEvent.agent.type.coding.code",
      "patternCode" : "humanuser"
    },
    {
      "id" : "AuditEvent.agent:user.who.identifier",
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
      "id" : "AuditEvent.agent:user.who.identifier.value",
      "path" : "AuditEvent.agent.who.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent:client",
      "path" : "AuditEvent.agent",
      "sliceName" : "client",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "AuditEvent.agent:client.type",
      "path" : "AuditEvent.agent.type",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/tiflow/ValueSet/tiflow-audit-event-agent-type-vs"
      }
    },
    {
      "id" : "AuditEvent.agent:client.type.coding.system",
      "path" : "AuditEvent.agent.type.coding.system",
      "patternUri" : "http://dicom.nema.org/resources/ontology/DCM|01"
    },
    {
      "id" : "AuditEvent.agent:client.type.coding.code",
      "path" : "AuditEvent.agent.type.coding.code",
      "patternCode" : "110150"
    },
    {
      "id" : "AuditEvent.agent:client.who.identifier",
      "path" : "AuditEvent.agent.who.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent:client.who.identifier.value",
      "path" : "AuditEvent.agent.who.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent:internal",
      "path" : "AuditEvent.agent",
      "sliceName" : "internal",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "AuditEvent.agent:internal.type.coding.system",
      "path" : "AuditEvent.agent.type.coding.system",
      "patternUri" : "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
    },
    {
      "id" : "AuditEvent.agent:internal.type.coding.code",
      "path" : "AuditEvent.agent.type.coding.code",
      "patternCode" : "dataprocessor"
    },
    {
      "id" : "AuditEvent.agent:internal.name",
      "path" : "AuditEvent.agent.name",
      "short" : "Name des FHIR Data Service",
      "min" : 1,
      "patternString" : "TI-Flow-Fachdienst",
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
    },
    {
      "id" : "AuditEvent.entity",
      "path" : "AuditEvent.entity",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity.type",
      "path" : "AuditEvent.entity.type",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity.type.system",
      "path" : "AuditEvent.entity.type.system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity.type.code",
      "path" : "AuditEvent.entity.type.code",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity:patient",
      "path" : "AuditEvent.entity",
      "sliceName" : "patient",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "AuditEvent.entity:patient.what.identifier",
      "path" : "AuditEvent.entity.what.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity:patient.type.system",
      "path" : "AuditEvent.entity.type.system",
      "patternUri" : "http://terminology.hl7.org/CodeSystem/audit-entity-type"
    },
    {
      "id" : "AuditEvent.entity:patient.type.code",
      "path" : "AuditEvent.entity.type.code",
      "patternCode" : "Patient"
    },
    {
      "id" : "AuditEvent.entity:task",
      "path" : "AuditEvent.entity",
      "sliceName" : "task",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "AuditEvent.entity:task.what.identifier",
      "path" : "AuditEvent.entity.what.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/e-prescription-id"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.entity:task.type.system",
      "path" : "AuditEvent.entity.type.system",
      "patternUri" : "http://terminology.hl7.org/CodeSystem/audit-entity-type"
    },
    {
      "id" : "AuditEvent.entity:task.type.code",
      "path" : "AuditEvent.entity.type.code",
      "patternCode" : "Task"
    },
    {
      "id" : "AuditEvent.entity:service",
      "path" : "AuditEvent.entity",
      "sliceName" : "service",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "AuditEvent.entity:service.type.system",
      "path" : "AuditEvent.entity.type.system",
      "patternUri" : "http://terminology.hl7.org/CodeSystem/audit-entity-type"
    },
    {
      "id" : "AuditEvent.entity:service.type.code",
      "path" : "AuditEvent.entity.type.code",
      "patternCode" : "4"
    },
    {
      "id" : "AuditEvent.entity:service.name",
      "path" : "AuditEvent.entity.name",
      "short" : "Name des FHIR Data Service",
      "definition" : "Der Name des FHIR Data Service, auf den zugegriffen wurde.",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
