# TI FHIR Configuration - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI FHIR Configuration**

## Extension: TI FHIR Configuration 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration | *Version*:2.0.0-ballot.1 |
| Active as of 2026-06-01 | *Computable Name*:TIFHIRConfiguration |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Diese Extension deklariert eine konkrete Konfigurationsausprägung eines FHIR-Data Service in der TI auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert. Die Bedeutung und Konstellation einer FHIR-Konfiguration ist aus externen Quellen der Releaseplanung zu entnehmen.

**Context of Use**

This extension may be used on the following element(s):

* Element ID CapabilityStatement

**Usage info**

**Usages:**

* Use this Extension: [Capability Statement Profil für den TI-Flow-Fachdienst](StructureDefinition-ti-flow-capability-statement.md)
* Examples for this Extension: [CapabilityStatement/ExampleCapabilityStatementServerPU](CapabilityStatement-ExampleCapabilityStatementServerPU.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow|current/StructureDefinition/ti-fhir-configuration)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-fhir-configuration.csv), [Excel](StructureDefinition-ti-fhir-configuration.xlsx), [Schematron](StructureDefinition-ti-fhir-configuration.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-fhir-configuration",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFHIRConfiguration",
  "title" : "TI FHIR Configuration",
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
  "description" : "Diese Extension deklariert eine konkrete Konfigurationsausprägung eines FHIR-Data Service in der TI auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert. Die Bedeutung und Konstellation einer FHIR-Konfiguration ist aus externen Quellen der Releaseplanung zu entnehmen.",
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "CapabilityStatement"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "FHIR-Konfigurationskennzeichen für den FHIR-Data Service",
      "definition" : "Beschreibt eine konkrete FD-Konfiguration als Code im Kontext eines CapabilityStatements.",
      "comment" : "Die Codebedeutung wird über externe gematik-Releaseartefakte gepflegt."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "FDS-Konfigurationscode",
      "definition" : "Code für eine FHIR-Konfiguration aus dem im FDS gepflegten CodeSystem.",
      "comment" : "Hinweis an Spezifikateure: Wenn diese Extension genutzt wird, muss ein ValueSet hinterlegt oder die Quelle der Werte referenziert werden.",
      "min" : 1,
      "type" : [{
        "code" : "code"
      }]
    }]
  }
}

```
