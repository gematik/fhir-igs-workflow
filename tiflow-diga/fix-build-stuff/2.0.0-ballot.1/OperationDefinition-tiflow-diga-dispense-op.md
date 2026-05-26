# E-Rezept vorläufig abgeben - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept vorläufig abgeben**

## OperationDefinition: E-Rezept vorläufig abgeben 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-dispense-op | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlow-DIGA-OP-Dispense |

 
Die Operation $dispense ermöglicht es dem Kostenträger, eine Ausgabe für eine DiGA-Verordnung durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass eine DiGA ausgegeben wurde, bevor sie vom Kostenträger abgeschlossen wird. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-diga-dispense-op",
  "url" : "https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-dispense-op",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlow-DIGA-OP-Dispense",
  "title" : "E-Rezept vorläufig abgeben",
  "status" : "active",
  "kind" : "operation",
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
  "description" : "Die Operation $dispense ermöglicht es dem Kostenträger, eine Ausgabe für eine DiGA-Verordnung durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass eine DiGA ausgegeben wurde, bevor sie vom Kostenträger abgeschlossen wird.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "dispense",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "inputProfile" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-dispense-operation-input"
}

```
