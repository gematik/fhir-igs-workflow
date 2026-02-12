# GEM ERP EX LastMedicationDispense - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX LastMedicationDispense**

## Extension: GEM ERP EX LastMedicationDispense 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-lastmedicationdispense-extension | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxLastMedicationDispenseExtension |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt den Zeitstempel der letzten Ausgabe an.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Task

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Task](StructureDefinition-eflow-rx-task.md)
* Examples for this Extension: [Task/9b48f82c-9c11-4a57-aa72-a805f9537a82](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md) and [Task/f5c21409-b84b-4125-8649-5630a00906b1](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-lastmedicationdispense-extension)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-lastmedicationdispense-extension.csv), [Excel](StructureDefinition-eflow-rx-lastmedicationdispense-extension.xlsx), [Schematron](StructureDefinition-eflow-rx-lastmedicationdispense-extension.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-lastmedicationdispense-extension",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-lastmedicationdispense-extension",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxLastMedicationDispenseExtension",
  "title" : "GEM ERP EX LastMedicationDispense",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt den Zeitstempel der letzten Ausgabe an.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Task"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Zeitstempel, der gesetzt wird, wenn ein Medikament für diese Aufgabe ausgegeben wurde. Angegeben im Format YYYY-MM-DDTHH:MM:SS(Z|±HH:MM)",
        "definition" : "Dieses Feld ermöglicht es der E-Rezept-FdV, dem Benutzer anzuzeigen, dass ein Medikament abgegeben wurde, bevor es von der Apotheke abgeschlossen wurde."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-lastmedicationdispense-extension"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Zeitstempel, der gesetzt wird, wenn ein Medikament für diese Aufgabe ausgegeben wurde.",
        "comment" : "Im Format YYYY-MM-DDTHH:MM:SS(Z|±HH:MM) angegeben",
        "type" : [
          {
            "code" : "instant"
          }
        ]
      }
    ]
  }
}

```
