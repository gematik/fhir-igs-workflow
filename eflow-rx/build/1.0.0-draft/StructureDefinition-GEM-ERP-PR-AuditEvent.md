# GEM ERP PR AuditEvent - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR AuditEvent**

## Resource Profile: GEM ERP PR AuditEvent 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-AuditEvent | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:GEM_ERP_PR_AuditEvent |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
AuditEvent für die Protokollierung des Zugriffs auf eRezepte 

**Usages:**

* Examples for this Profile: [AuditEvent/9361863d-fec0-4ba9-8776-6905cf1a0cfa](AuditEvent-9361863d-fec0-4ba9-8776-6905cf1a0cfa.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/GEM-ERP-PR-AuditEvent)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-AuditEvent.csv), [Excel](StructureDefinition-GEM-ERP-PR-AuditEvent.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-AuditEvent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-AuditEvent",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-AuditEvent",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_AuditEvent",
  "title" : "GEM ERP PR AuditEvent",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
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
  "description" : "AuditEvent für die Protokollierung des Zugriffs auf eRezepte",
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
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.type.system",
      "path" : "AuditEvent.type.system",
      "min" : 1,
      "fixedUri" : "http://terminology.hl7.org/CodeSystem/audit-event-type"
    },
    {
      "id" : "AuditEvent.type.code",
      "path" : "AuditEvent.type.code",
      "min" : 1,
      "fixedCode" : "rest"
    },
    {
      "id" : "AuditEvent.subtype",
      "path" : "AuditEvent.subtype",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "AuditEvent.action",
      "path" : "AuditEvent.action",
      "min" : 1
    },
    {
      "id" : "AuditEvent.outcome",
      "path" : "AuditEvent.outcome",
      "min" : 1
    },
    {
      "id" : "AuditEvent.agent",
      "path" : "AuditEvent.agent",
      "mustSupport" : true
    },
    {
      "id" : "AuditEvent.agent.type",
      "path" : "AuditEvent.agent.type",
      "min" : 1
    },
    {
      "id" : "AuditEvent.agent.who.identifier",
      "path" : "AuditEvent.agent.who.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id",
        "http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }]
    },
    {
      "id" : "AuditEvent.agent.name",
      "path" : "AuditEvent.agent.name",
      "min" : 1
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
      "fixedString" : "E-Rezept Fachdienst"
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
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
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
    }]
  }
}

```
