# Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel**

## Logical Model: Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf160 | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowFeatureWF160 |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-ti-flow-feature-wf160.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-flow-feature-wf160.csv), [Excel](StructureDefinition-ti-flow-feature-wf160.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-flow-feature-wf160",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf160",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlowFeatureWF160",
  "title" : "Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel",
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
  "description" : "Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln",
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
  "type" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf160",
  "baseDefinition" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature-definition",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ti-flow-feature-wf160",
      "path" : "ti-flow-feature-wf160",
      "short" : "Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel",
      "definition" : "Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln"
    },
    {
      "id" : "ti-flow-feature-wf160.url",
      "path" : "ti-flow-feature-wf160.url",
      "patternUri" : "https://gematik.de/fhir/tiflow/FeatureDefinition/WF160"
    },
    {
      "id" : "ti-flow-feature-wf160.status",
      "path" : "ti-flow-feature-wf160.status",
      "patternCode" : "active"
    },
    {
      "id" : "ti-flow-feature-wf160.description",
      "path" : "ti-flow-feature-wf160.description",
      "patternMarkdown" : "Dieses Feature deklariert, ob der TI-Flow-Fachdienst den `Flowtype für Apothekenpflichtige Arzneimittel` unterstützt und aktuell aktiv ist.\n\n**Wert `true`**: Der Flowtype ist aktiviert, alle Operationen und Abfragen nach Spezifikation sind erlaubt und dürfen durchgeführt werden.\n\n**Wert `false`**: Die Operation $create gestattet keine Erstellung von Tasks des betreffenden Flowtypes\nAlle FHIR-Operationen auf dem RessourceType \"Task\" des betreffenden Flowtypes werden mit dem entsprechendem Fehler abgebrochen\nAlle FHIR-Operationen auf System Ebene, durch eine andere oid als \"oid_versicherter\", die Informationen zu einem Task des betreffenden Flowtypes herausgeben oder manipulieren werden mit entsprechendem Fehler abgebrochen\nDer Aufruf GET /Task auf Tasks des betreffenden Flowtypes durch eine andere oid als \"oid_versicherter\" wird mit entsprechendem Fehler abgebrochen"
    },
    {
      "id" : "ti-flow-feature-wf160.valueType",
      "path" : "ti-flow-feature-wf160.valueType",
      "patternCode" : "boolean"
    }]
  }
}

```
