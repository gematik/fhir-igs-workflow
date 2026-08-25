# Validieren einer FHIR-Ressource - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.3

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Validieren einer FHIR-Ressource**

## OperationDefinition: Validieren einer FHIR-Ressource 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/OperationDefinition/tiflow-core-validate-op | *Version*:2.0.0-ballot.3 |
| Active as of 2026-06-30 | *Computable Name*:TIFlow-CORE-OP-Validate |
| **Copyright/Legal**: gematik GmbH / Dieser Implementation Guide ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Diese Operation validiert eine FHIR-Ressource gegen eine konfigurierbare FHIR-Konfiguration. 
Sie erweitert die standardisierte FHIR $validate-Operation (http://hl7.org/fhir/OperationDefinition/Resource-validate) um einen gematik-spezifischen `fhir_config` Parameter zur Auswahl der Validierungskonfiguration. 
Mit dem Parameter `returnBoolean` kann wahlweise ein kompaktes boolesches Ergebnis (`true`/`false`) angefordert werden, anstelle eines vollständigen OperationOutcome. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-core-validate-op",
  "url" : "https://gematik.de/fhir/tiflow/OperationDefinition/tiflow-core-validate-op",
  "version" : "2.0.0-ballot.3",
  "name" : "TIFlow-CORE-OP-Validate",
  "title" : "Validieren einer FHIR-Ressource",
  "status" : "active",
  "kind" : "operation",
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
  "description" : "Diese Operation validiert eine FHIR-Ressource gegen eine konfigurierbare FHIR-Konfiguration.\n\nSie erweitert die standardisierte FHIR $validate-Operation (http://hl7.org/fhir/OperationDefinition/Resource-validate) um einen gematik-spezifischen `fhir_config` Parameter zur Auswahl der Validierungskonfiguration.\n\nMit dem Parameter `returnBoolean` kann wahlweise ein kompaktes boolesches Ergebnis (`true`/`false`) angefordert werden, anstelle eines vollständigen OperationOutcome.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : false,
  "code" : "validate",
  "base" : "http://hl7.org/fhir/OperationDefinition/Resource-validate",
  "system" : true,
  "type" : false,
  "instance" : false,
  "inputProfile" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-core-validate-operation-input",
  "outputProfile" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-core-validate-operation-output",
  "parameter" : [{
    "name" : "resource",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Die zu validierende FHIR-Ressource.",
    "type" : "Resource"
  },
  {
    "name" : "fhir_config",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Angabe der FHIR-Konfiguration, gegen welche die Validierungskomponente validieren soll.",
    "type" : "code"
  },
  {
    "name" : "profile",
    "use" : "in",
    "min" : 0,
    "max" : "1",
    "documentation" : "Wenn angegeben, wird die Ressource gegen dieses spezifische Profil validiert. Falls der Server das Profil nicht kennt, wird ein Fehler zurückgegeben.",
    "type" : "canonical"
  },
  {
    "name" : "returnBoolean",
    "use" : "in",
    "min" : 0,
    "max" : "1",
    "documentation" : "Wenn 'true', gibt die Operation nur den Parameter 'valid' (boolean) zurück, ohne ein vollständiges OperationOutcome. Nützlich für schnelle Prüfungen, ob Daten valide sind.",
    "type" : "boolean"
  },
  {
    "name" : "return",
    "use" : "out",
    "min" : 0,
    "max" : "1",
    "documentation" : "Das Ergebnis der Validierung als OperationOutcome. Wird zurückgegeben, wenn 'returnBoolean' nicht gesetzt oder 'false' ist. Enthält keine Fehler, wenn die Validierung erfolgreich war.",
    "type" : "OperationOutcome"
  },
  {
    "name" : "valid",
    "use" : "out",
    "min" : 0,
    "max" : "1",
    "documentation" : "Boolesches Validierungsergebnis. Wird nur zurückgegeben, wenn 'returnBoolean=true' gesetzt wurde. 'true' bedeutet valide, 'false' bedeutet nicht valide.",
    "type" : "boolean"
  }]
}

```
