# Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer**

## Logical Model: Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf169 | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:TIFlowFeatureWF169 |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln mit Steuerung durch den Leistungserbringer 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-ti-flow-feature-wf169.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-flow-feature-wf169.csv), [Excel](StructureDefinition-ti-flow-feature-wf169.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-flow-feature-wf169",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf169",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowFeatureWF169",
  "title" : "Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-30",
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
  "description" : "Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln mit Steuerung durch den Leistungserbringer",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf169",
  "baseDefinition" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature-definition",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ti-flow-feature-wf169",
      "path" : "ti-flow-feature-wf169",
      "short" : "Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer",
      "definition" : "Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln mit Steuerung durch den Leistungserbringer"
    },
    {
      "id" : "ti-flow-feature-wf169.url",
      "path" : "ti-flow-feature-wf169.url",
      "patternUri" : "https://gematik.de/fhir/tiflow/FeatureDefinition/WF169"
    },
    {
      "id" : "ti-flow-feature-wf169.status",
      "path" : "ti-flow-feature-wf169.status",
      "patternCode" : "active"
    },
    {
      "id" : "ti-flow-feature-wf169.description",
      "path" : "ti-flow-feature-wf169.description",
      "patternMarkdown" : "Dieses Feature deklariert, ob der TI-Flow-Fachdienst den `Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer` unterstützt und aktuell aktiv ist.\n\n**Wert `true`**: Der Flowtype ist aktiviert, alle Operationen und Abfragen nach Spezifikation sind erlaubt und dürfen durchgeführt werden.\n\n**Wert `false`**: Die Operation $create gestattet keine Erstellung von Tasks des betreffenden Flowtypes\nAlle FHIR-Operationen auf dem RessourceType \"Task\" des betreffenden Flowtypes werden mit dem entsprechendem Fehler abgebrochen\nAlle FHIR-Operationen auf System Ebene, durch eine andere oid als \"oid_versicherter\", die Informationen zu einem Task des betreffenden Flowtypes herausgeben oder manipulieren werden mit entsprechendem Fehler abgebrochen\nDer Aufruf GET /Task auf Tasks des betreffenden Flowtypes durch eine andere oid als \"oid_versicherter\" wird mit entsprechendem Fehler abgebrochen"
    },
    {
      "id" : "ti-flow-feature-wf169.valueType",
      "path" : "ti-flow-feature-wf169.valueType",
      "patternCode" : "boolean"
    }]
  }
}

```
