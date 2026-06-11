# Implementation Guide TI-Flow-Fachdienst - TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* **Implementation Guide TI-Flow-Fachdienst**

## Implementation Guide TI-Flow-Fachdienst

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-erezept/ImplementationGuide/de.gematik.tiflow.erezept | *Version*:2.0.0-ballot.2 |
| Draft as of 2026-05-25 | *Computable Name*:gemIG_TIFlow_erezept |

Dieser Implementation Guide beschreibt die Datenmodelle und Prozesse des TI-Flow-Fachdienstes für den Anwendungsfall von "Arzneimittelverordnung". Er bildet das Fundament für die fachlichen Szenarien und die technischen Schnittstellen im E-Rezept-Workflow für dieses Szenario.

### Zweck und Geltungsbereich

* Grundlegende Workflows für E-Rezepte zur Arzneimittelversorgung: 
* **160, 200** zur Verordnung von Arzneimitteln
* **169, 209** zur Verordnung von Arzneimitteln mit Workflowsteuerung durch den Leistungserbringer
* **166** zur Verordnung von E-T-Rezepten
 
* Profile, Operationen und Validierungsregeln
* Funktionale Anforderungen

### Nicht im Scope

* Modul-übergreifende Anwendungsfälle
* Produkttyp-spezifische Implementierungsdetails außerhalb des Fachdienstes
* Beschreibung und Definition von Prozessen außerhalb des Fachdienstes

### Anforderungen zur Umsetzung des IGs

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst und dessen Clients MÜSSEN zur Umsetzung der Workflows 160, 166, 169, 200 und 209 den Implementation Guide "E-Rezept für Arzneimittel" umsetzen.

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: Herstellererklärung

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst und dessen Clients MÜSSEN zur Umsetzung des Implementation Guides "E-Rezept für Arzneimittel" alle Anforderungen und FHIR-Artefakte umsetzen, die in diesem IG definiert sind, sowie Anforderungen und Artefakte aus [gemIG_TIFlow_core], die in diesem IG referenziert werden.
### Wie dieser IG zu lesen ist

Dieser Implementation Guide ist "von links nach rechts" zu lesen. Die Menüstruktur beginnt mit fachlichen Inhalten, welche über die technischen Anwendungsfälle dann in den Spezifikationen der Endpunkte und APIs münden. Es wird empfohlen, die Inhalte in der vorgegebenen Reihenfolge zu lesen, um ein umfassendes Verständnis der Anforderungen und Spezifikationen zu erhalten.

Für einen Überblick über die Inhalte und die Struktur dieses Implementation Guides kann die [Inhaltsübersicht](toc.md) konsultiert werden. Dort sind die verschiedenen Kapitel und Abschnitte mit ihren jeweiligen Inhalten und Anforderungen aufgeführt.

### Abhängigkeiten















### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an [erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de).

### Rechtliche Hinweise

Copyright ©2026+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von Health Level Seven International.



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "de.gematik.tiflow.erezept",
  "url" : "https://gematik.de/fhir/tiflow-erezept/ImplementationGuide/de.gematik.tiflow.erezept",
  "version" : "2.0.0-ballot.2",
  "name" : "gemIG_TIFlow_erezept",
  "title" : "TIFlow - Verordnungen für Arzneimittel",
  "status" : "draft",
  "date" : "2026-05-25",
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
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "packageId" : "de.gematik.tiflow.erezept",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.1.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  },
  {
    "id" : "de_basisprofil_r4",
    "uri" : "http://fhir.org/packages/de.basisprofil.r4/ImplementationGuide/de.basisprofil.r4",
    "packageId" : "de.basisprofil.r4",
    "version" : "1.5.4"
  },
  {
    "id" : "de_gematik_epa_medication",
    "uri" : "https://gematik.de/fhir/epa-medication/ImplementationGuide/de.gematik.epa.medication",
    "packageId" : "de.gematik.epa.medication",
    "version" : "1.3.2"
  },
  {
    "id" : "de_gematik_terminology",
    "uri" : "https://gematik.de/fhir/terminology/ImplementationGuide/de.gematik.terminology",
    "packageId" : "de.gematik.terminology",
    "version" : "1.0.9"
  },
  {
    "id" : "de_gematik_ti",
    "uri" : "https://gematik.de/fhir/ti/ImplementationGuide/de.gematik.ti",
    "packageId" : "de.gematik.ti",
    "version" : "1.3.1"
  },
  {
    "id" : "de_gematik_tiflow",
    "uri" : "https://gematik.de/fhir/tiflow/ImplementationGuide/de.gematik.tiflow",
    "packageId" : "de.gematik.tiflow",
    "version" : "2.0.0-ballot.2"
  },
  {
    "id" : "hl7_fhir_uv_xver_r5_r4",
    "uri" : "http://hl7.org/fhir/uv/xver/ImplementationGuide/hl7.fhir.uv.xver-r5.r4",
    "packageId" : "hl7.fhir.uv.xver-r5.r4",
    "version" : "0.1.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "shownav"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "StructureDefinition/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Bundle/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "OperationOutcome/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Medication/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "MedicationRequest/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "MedicationDispense/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Parameters/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "CapabilityStatement/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Provenance/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://gematik.de/fhir/tiflow-erezept/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "shownav"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "StructureDefinition/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Bundle/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "OperationOutcome/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Medication/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "MedicationRequest/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "MedicationDispense/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Parameters/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "CapabilityStatement/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Provenance/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://gematik.de/fhir/tiflow-erezept/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/1f339db0-9e55-4946-9dfa-f1b30953be9b"
      },
      "name" : "1f339db0-9e55-4946-9dfa-f1b30953be9b",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/44420ed9-7388-4be5-acc5-9c124fad9f34"
      },
      "name" : "44420ed9-7388-4be5-acc5-9c124fad9f34",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/4863d1fb-dc26-4680-bb35-018610d1749d"
      },
      "name" : "4863d1fb-dc26-4680-bb35-018610d1749d",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/9581ce65-b118-4751-9073-19c091b341e0"
      },
      "name" : "9581ce65-b118-4751-9073-19c091b341e0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/9c85a2a5-92ee-4a57-83cb-ba90a0df2a21"
      },
      "name" : "9c85a2a5-92ee-4a57-83cb-ba90a0df2a21",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Subscription"
      }],
      "reference" : {
        "reference" : "Subscription/example-create-subscription-request"
      },
      "name" : "Anfrage fuer POST /Subscription",
      "description" : "Beispiel fuer eine Subscription-Anlage",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Subscription"
      }],
      "reference" : {
        "reference" : "Subscription/example-create-subscription-response"
      },
      "name" : "Antwort fuer POST /Subscription",
      "description" : "Beispiel fuer eine erfolgreiche Subscription-Anlage",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Communication"
      }],
      "reference" : {
        "reference" : "Communication/7977a4ab-97a9-4d95-afb3-6c4c1e2ac596"
      },
      "name" : "Antwort-Nachricht der Apotheke an den Patienten",
      "description" : "Beispiel für eine Antwort-Nachricht, die von der Apotheke an den Patienten als Antwort auf eine vorherige Task-bezogene Nachricht gesendet wird",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/example-searchset-auditevent"
      },
      "name" : "Antwortbundle fuer GET /AuditEvent",
      "description" : "Beispiel fuer eine AuditEvent-Suchantwort",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/example-searchset-consent"
      },
      "name" : "Antwortbundle fuer GET /Consent",
      "description" : "Beispiel fuer eine Consent-Suchantwort",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/example-searchset-medicationdispense"
      },
      "name" : "Antwortbundle fuer GET /MedicationDispense",
      "description" : "Beispiel fuer eine MedicationDispense-Suchantwort",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/example-searchset-task"
      },
      "name" : "Antwortbundle fuer GET /Task",
      "description" : "Beispiel fuer eine Task-Suchantwort mit zwei Treffern",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "AuditEvent"
      }],
      "reference" : {
        "reference" : "AuditEvent/9361863d-fec0-4ba9-8776-7905cf1b0cfa"
      },
      "name" : "AuditEvent-Eintrag vom TI-Flow-Fachdienst",
      "description" : "Beispiel für einen AuditEvent-Eintrag, der vom TI-Flow-Fachdienst beim Zugriff auf Patientendaten generiert wird",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AuditEvent"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/tiflow-rx-task-organizations-vs"
      },
      "name" : "Bearbeiter eines E-Rezeptes",
      "description" : "ValueSet der Organisationstyp-Codes eines Performers für den RX Task",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/Bundle-AcceptOperation"
      },
      "name" : "Beispiel Accept-Bundle",
      "description" : "Dieses Bundle enthält den Task und das qualifiziert signierte E-Rezept für die Accept-Operation",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle_OP_Accept"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleCloseInputParameters"
      },
      "name" : "Beispiel Close-Parameter",
      "description" : "Beispiel für Eingabeparameter der Close-Operation mit einfacher Medikamentenabgabe",
      "exampleCanonical" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleCloseInputParametersKombipackung"
      },
      "name" : "Beispiel Close-Parameter für Kombipackung",
      "description" : "Beispiel für Eingabeparameter der Close-Operation für eine Kombipackung",
      "exampleCanonical" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleCloseInputParametersMultipleMedicationDispenses"
      },
      "name" : "Beispiel Close-Parameter mit mehreren MedicationDispenses",
      "description" : "Beispiel für Eingabeparameter der Close-Operation mit mehreren Medikamentenabgaben",
      "exampleCanonical" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Kombipackung"
      },
      "name" : "Beispiel Kombipackung Medikamentenabgabe",
      "description" : "Beispiel für eine Medikamentenabgabe einer Kombipackung",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense"
      },
      "name" : "Beispiel Medikamentenabgabe",
      "description" : "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Dosage-tageszeit"
      },
      "name" : "Beispiel Medikamentenabgabe mit Dosierung nach 4er Schema",
      "description" : "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach 4er Schema",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Dosage-interval"
      },
      "name" : "Beispiel Medikamentenabgabe mit Dosierung nach Interval",
      "description" : "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Interval",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Dosage-comb-interval"
      },
      "name" : "Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Intervals",
      "description" : "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Kombination des Intervals",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Dosage-comb-dayofweek"
      },
      "name" : "Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Wochentags",
      "description" : "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Kombination des Wochentags",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Dosage-uhrzeit"
      },
      "name" : "Beispiel Medikamentenabgabe mit Dosierung nach Uhrzeitbezug",
      "description" : "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Uhrzeitbezug",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Dosage-weekday"
      },
      "name" : "Beispiel Medikamentenabgabe mit Dosierung nach Wochentagsbezug",
      "description" : "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Wochentagsbezug",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Without-Medication"
      },
      "name" : "Beispiel Medikamentenabgabe ohne Medikament",
      "description" : "Beispiel für eine Medikamentenabgabe ohne Medikamentenreferenz",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/ExampleUnitMedication"
      },
      "name" : "Beispiel-Medikament mit Einheiten",
      "description" : "Beispiel für ein Medikament mit spezifischen Maßeinheiten und Wirkstoffangaben",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/SumatripanMedication"
      },
      "name" : "Beispiel-Medikament Sumatriptan",
      "description" : "Beispiel für ein Sumatriptan-Medikament mit vollständigen Eigenschaften",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/ExampleAcceptResponseBundle"
      },
      "name" : "Beispielantwort fuer die $accept-Operation",
      "description" : "Bundle-Antwort der $accept-Operation mit Task und qualifiziert signiertem E-Rezept",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle_OP_Accept"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/ExampleRxCommunicationSearchset"
      },
      "name" : "Communication searchset response for Rx",
      "description" : "Example response for GET /Communication",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Communication"
      }],
      "reference" : {
        "reference" : "Communication/2be1c6ac-5d10-47f6-84ee-8318b2c22c76"
      },
      "name" : "DiGA-Zuweisung des Patienten an die Krankenkasse",
      "description" : "Beispiel für eine Nachricht des Patienten an die Krankenkasse zur Anfrage der DiGA-Abgabe mit AccessCode",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tiflow-rx-abort-op"
      },
      "name" : "E-Rezept abbrechen",
      "description" : "Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tiflow-rx-close-op"
      },
      "name" : "E-Rezept Abgabe vollziehen",
      "description" : "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tiflow-rx-accept-op"
      },
      "name" : "E-Rezept abrufen",
      "description" : "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tiflow-rx-activate-op"
      },
      "name" : "E-Rezept aktivieren",
      "description" : "Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tiflow-rx-create-op"
      },
      "name" : "E-Rezept erstellen",
      "description" : "Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tiflow-rx-dispense-op"
      },
      "name" : "E-Rezept vorläufig abgeben",
      "description" : "Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/tiflow-rx-reject-op"
      },
      "name" : "E-Rezept zurückgeben",
      "description" : "Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/SimpleMedication"
      },
      "name" : "Einfaches Beispiel-Medikament",
      "description" : "Beispiel für ein einfaches Medikament mit minimalen Eigenschaften",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Consent"
      }],
      "reference" : {
        "reference" : "Consent/QueryConsentCHARGCONS"
      },
      "name" : "Einwilligung fuer den Use Case CHARGCONS",
      "description" : "Beispiel einer Consent-Ressource fuer die Consent-Query",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleCloseInputParametersRezeptur"
      },
      "name" : "Example Close Parameters",
      "exampleCanonical" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleDispenseInputParameters"
      },
      "name" : "Example Dispense Parameters",
      "exampleCanonical" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Dispense-Operation-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleDispenseInputParametersMultipleMedicationDispenses"
      },
      "name" : "Example Dispense Parameters",
      "exampleCanonical" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Dispense-Operation-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleDispenseInputParametersKombipackung"
      },
      "name" : "Example Dispense Parameters",
      "exampleCanonical" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Dispense-Operation-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationOutcome"
      }],
      "reference" : {
        "reference" : "OperationOutcome/ExampleRxOperationOutcomeError"
      },
      "name" : "Example error response for Rx operations",
      "description" : "Representative error response for invalid task status during operation invocation",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleRxOperationRequestParameters"
      },
      "name" : "Example request parameters for Rx operations",
      "description" : "Reusable example request payload for operation documentation in the Rx IG",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-Rezeptur"
      },
      "name" : "Example Rezeptur Medication Dispense",
      "description" : "Example of a Rezeptur Medication Dispense.",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-EX-AvailabilityState"
      },
      "name" : "GEM ERP EX AvailabilityState",
      "description" : "Extension zur Angabe von Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PATIENT-AUTHORIZATION"
      },
      "name" : "GEM ERP EX EU IS REDEEMABLE BY PATIENT AUTHORIZATION",
      "description" : "Extension zur Angabe des Nutzers, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES"
      },
      "name" : "GEM ERP EX EU IS REDEEMABLE BY PROPERTIES",
      "description" : "Extension zur vom TI-Flow-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-EX-LastMedicationDispense"
      },
      "name" : "GEM ERP EX LastMedicationDispense",
      "description" : "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt den Zeitstempel der letzten Ausgabe an.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-EX-SupplyOptionsType"
      },
      "name" : "GEM ERP EX SupplyOptionsType",
      "description" : "Extension zur Angabe des bevorzugten Versorgungskanals",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-PAR-Accept-Operation-Output"
      },
      "name" : "GEM ERP PR AcceptOperation Output",
      "description" : "Dieses Profil definiert die Parameter für die Annahme eines Medikaments von AVS zum TI-Flow-Fachdienst. Dies kann für die $accept-Operation verwendet werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-PAR-Activate-Operation-Input"
      },
      "name" : "GEM ERP PR ActivateOperation Input",
      "description" : "Dieses Profil definiert die Parameter für das Einstellen eines E-Rezeptes von PVS zum TI-Flow-Fachdienst.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-PAR-Activate-Operation-Output"
      },
      "name" : "GEM ERP PR ActivateOperation Output",
      "description" : "Dieses Profil definiert die Parameter für die Aktivierung einer Aufgabe von PVS zum TI-Flow-Fachdienst. Dies kann für die $activate-Operation verwendet werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-AuditEvent"
      },
      "name" : "GEM ERP PR AuditEvent",
      "description" : "AuditEvent für die Protokollierung des Zugriffs auf E-Rezepte",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Bundle-OP-Accept"
      },
      "name" : "GEM ERP PR Bundle OP Accept",
      "description" : "Antwort des TI-Flow-Fachdienst auf die $accept-Operation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Input"
      },
      "name" : "GEM ERP PR CloseOperation Input",
      "description" : "Dieses Profil definiert die Parameter für das Schließen eines Workflows für ein Rezept vom AVS zum TI-Flow-Fachdienst. Dies kann für die Operationen $close und $dispense verwendet werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Output"
      },
      "name" : "GEM ERP PR CloseOperation Output",
      "description" : "Dieses Profil definiert die Parameter für die Ausgabe eines Medikaments von AVS an den TI-Flow-Fachdienst. Dies kann für die $close-Operation verwendet werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource:abstract"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Communication"
      },
      "name" : "GEM ERP PR Communication",
      "description" : "Generische Workflow-Communication",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Communication-DispReq"
      },
      "name" : "GEM ERP PR Communication DispReq",
      "description" : "Anfrage zur Einlösung des E-Rezepts",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Communication-Reply"
      },
      "name" : "GEM ERP PR Communication Reply",
      "description" : "Antwort vom Leistungserbringer an den Patienten",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-PAR-Create-Operation-Input"
      },
      "name" : "GEM ERP PR CreateOperation Input",
      "description" : "Dieses Profil definiert die Parameter für die Erstellung einer Aufgabe von PVS zum TI-Flow-Fachdienst. Dies kann für die $create-Operation verwendet werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-PAR-Create-Operation-Output"
      },
      "name" : "GEM ERP PR CreateOperation Output",
      "description" : "Dieses Profil definiert die Parameter für die Erstellung einer Aufgabe von PVS zum TI-Flow-Fachdienst. Dies kann für die $create-Operation verwendet werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-PAR-Dispense-Operation-Input"
      },
      "name" : "GEM ERP PR DispenseOperation Input",
      "description" : "Dieses Profil definiert die Parameter für die Abgabe eines Medikaments von AVS an den TI-Flow-Fachdienst. Dies kann für die $dispense-Operation verwendet werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Medication"
      },
      "name" : "GEM ERP PR Medication",
      "description" : "Medikament zur Ausgabe des Rezepts",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-MedicationDispense"
      },
      "name" : "GEM ERP PR MedicationDispense",
      "description" : "Dispensierung eines E-Rezepts",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/GEMErpPrMedicationdispenseMap"
      },
      "name" : "GEMErpPrMedicationdispenseMap",
      "description" : "Auto-generated StructureMap for GEM_ERP_PR_MedicationDispense|1.6.1 -> EPAMedicationDispense|1.3.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/GEMErpPrMedicationMap"
      },
      "name" : "GEMErpPrMedicationMap",
      "description" : "Auto-generated StructureMap for GEM_ERP_PR_Medication|1.6.1 -> EPAMedication|1.3.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      }],
      "reference" : {
        "reference" : "Device/ReceiptBundleDevice"
      },
      "name" : "Gerät für Quittungs-Bundle",
      "description" : "Beispiel für ein Gerät, das für die Erstellung von E-Rezept-Quittungen verwendet wird",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/KBVPrErpBundleMap"
      },
      "name" : "KBVPrErpBundleMap",
      "description" : "Auto-generated StructureMap for transformation KBV_PR_ERP_Bundle|1.4.0 -> EPAOpProvidePrescriptionERPInputParameters|1.3.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/KBVPrErpMedicationCompoundingMap"
      },
      "name" : "KBVPrErpMedicationCompoundingMap",
      "description" : "Auto-generated StructureMap for KBV_PR_ERP_Medication_Compounding|1.4.0 -> EPAMedication|1.3.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/KBVPrErpMedicationFreetextMap"
      },
      "name" : "KBVPrErpMedicationFreetextMap",
      "description" : "Auto-generated StructureMap for KBV_PR_ERP_Medication_FreeText|1.4.0 -> EPAMedication|1.3.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/KBVPrErpMedicationIngredientMap"
      },
      "name" : "KBVPrErpMedicationIngredientMap",
      "description" : "Auto-generated StructureMap for KBV_PR_ERP_Medication_Ingredient|1.4.0 -> EPAMedication|1.3.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/KBVPrErpMedicationPznMap"
      },
      "name" : "KBVPrErpMedicationPznMap",
      "description" : "Auto-generated StructureMap for KBV_PR_ERP_Medication_PZN|1.4.0 -> EPAMedication|1.3.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/KBVPrErpPrescriptionMap"
      },
      "name" : "KBVPrErpPrescriptionMap",
      "description" : "Auto-generated StructureMap for KBV_PR_ERP_Prescription|1.4.0 -> EPAMedicationRequest|1.3.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/KBVPrForOrganizationMap"
      },
      "name" : "KBVPrForOrganizationMap",
      "description" : "Auto-generated StructureMap for KBV_PR_FOR_Organization|1.3.0 -> OrganizationDirectory|1.0.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/KBVPrForPractitionerMap"
      },
      "name" : "KBVPrForPractitionerMap",
      "description" : "Auto-generated StructureMap for KBV_PR_FOR_Practitioner|1.3.0 -> PractitionerDirectory|1.0.0",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medication-Rezeptur-FD"
      },
      "name" : "Medication-Rezeptur-FD",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/ExampleRxMedicationDispenseSearchset"
      },
      "name" : "MedicationDispense searchset response for Rx",
      "description" : "Example response for GET /MedicationDispense",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medication-Without-Strength-Code"
      },
      "name" : "Medikament ohne Stärke-Code",
      "description" : "Beispiel für ein Medikament ohne System und Code für die Wirkstoffstärke",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medication-Without-Strength-Numerator"
      },
      "name" : "Medikament ohne Stärke-Numerator",
      "description" : "Beispiel für ein Medikament ohne Code oder System für die Stärkenangabe im Numerator",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medication-Kombipackung"
      },
      "name" : "Medikament-Kombipackung",
      "description" : "Beispiel für eine Kombipackung mit mehreren Einzelpräparaten",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medication-Rezeptur"
      },
      "name" : "Medikament-Rezeptur",
      "description" : "Beispiel für eine Rezeptur mit mehreren Wirkstoffen als zusammengesetztes Medikament",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/dffbfd6a-5712-4798-bdc8-07201eb77ab8"
      },
      "name" : "Quittungs-Bundle für abgeschlossene Rezeptabgabe",
      "description" : "Beispiel für ein Quittungs-Bundle nach erfolgter Abgabe eines E-Rezepts",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Communication"
      }],
      "reference" : {
        "reference" : "Communication/ExampleRxCommunicationDispReq"
      },
      "name" : "Rx Communication request example",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/ExampleRxMedicationDispense"
      },
      "name" : "Rx MedicationDispense example",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      }],
      "reference" : {
        "reference" : "Task/ExampleRxTaskInReadyState"
      },
      "name" : "Rx Task in ready state",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      }],
      "reference" : {
        "reference" : "Task/TaskInClosedState"
      },
      "name" : "Task abgeschlossen durch Apotheke via $close Operation",
      "description" : "Beispiel für einen Task, der von einer Apotheke über die $close Operation abgeschlossen wurde",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      }],
      "reference" : {
        "reference" : "Task/TaskInReadyState"
      },
      "name" : "Task aktiviert durch (Z)PVS/KIS via $activate Operation",
      "description" : "Beispiel für einen Task, der durch (Z)PVS/KIS über die $activate Operation aktiviert wurde und ein einlösbares E-Rezept trägt",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      }],
      "reference" : {
        "reference" : "Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e"
      },
      "name" : "Task angenommen durch Apotheke via $accept Operation",
      "description" : "Beispiel für einen Task, der von einer Apotheke über die $accept Operation angenommen wurde",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      }],
      "reference" : {
        "reference" : "Task/9b48f82c-9c11-4a57-aa72-a805f9537a82"
      },
      "name" : "Task angenommen und abgegeben via $dispense Operation",
      "description" : "Beispiel für einen Task, der von einer Apotheke angenommen und dann über die $dispense Operation abgegeben wurde",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      }],
      "reference" : {
        "reference" : "Task/b12eb5f7-91ce-4887-93c7-800454601377"
      },
      "name" : "Task erstellt durch Fachdienst via $create Operation",
      "description" : "Beispiel für einen Task, der vom Fachdienst über die $create Operation erstellt wurde",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      }],
      "reference" : {
        "reference" : "Task/b9f1fbdd-f28b-4ec7-959c-5283d3433b0e"
      },
      "name" : "Task erstellt durch Fachdienst via $create Operation",
      "description" : "Beispiel für einen Task, der vom Fachdienst über die $create Operation erstellt wurde",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Task"
      },
      "name" : "Task für E-Rezept",
      "description" : "Task für die Verwaltung des E-Rezept-Workflows",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      }],
      "reference" : {
        "reference" : "Task/f5c21409-b84b-4125-8649-5630a00906b1"
      },
      "name" : "Task mit mehreren MedicationDispenses",
      "description" : "Beispiel für einen Task, der von einer Apotheke angenommen und dann über die $dispense Operation mit mehreren MedicationDispenses abgegeben wurde",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/ExampleRxTaskSearchset"
      },
      "name" : "Task searchset response for Rx",
      "description" : "Example response for GET /Task",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/tiflow-erezept-operation-outcome-details-cs"
      },
      "name" : "TIFLOW EREZEPT Operation Outcome Details CS",
      "description" : "E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/tiflow-erezept-operation-outcome-details-vs"
      },
      "name" : "TIFLOW EREZEPT Operation Outcome Details VS",
      "description" : "E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/ti-flow-fachdienst-server-rx"
      },
      "name" : "TIFlow Fachdienst Server Capabilities",
      "description" : "CapabilityStatement für den E-Rezept-Fachdienst (Arzneimittel-Workflow)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Communication"
      }],
      "reference" : {
        "reference" : "Communication/a218a36e-f2fd-4603-ba67-c827acfef01b"
      },
      "name" : "Zuweisung des Patienten an die Apotheke",
      "description" : "Beispiel für eine Nachricht des Patienten an die Apotheke zur Anfrage der Medikamentenabgabe mit AccessCode",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-2"
      },
      "name" : "Zweites Beispiel Medikamentenabgabe",
      "description" : "Zweites Beispiel für eine Medikamentenabgabe mit anderen Eigenschaften",
      "exampleCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Parameters-output-example-1"
      }
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Parameters-output-example-2"
      }
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Parameters-output-example-3"
      }
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Parameters-output-example-4"
      }
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Parameters-output-example-5"
      }
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Implementation Guide TI-Flow-Fachdienst",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-fachlichkeit.html"
        }],
        "nameUrl" : "menu-fachlichkeit.html",
        "title" : "Fachliche Aspekte zur Arzneimittelverordnung",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-fachlichkeit-e-rezept.html"
          }],
          "nameUrl" : "menu-fachlichkeit-e-rezept.html",
          "title" : "Verordnung von apothekenpflichtigen Arzneimitteln",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-fachlichkeit-wf-le.html"
          }],
          "nameUrl" : "menu-fachlichkeit-wf-le.html",
          "title" : "Verordnung mit Steuerung durch Leistungserbringer",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-fachlichkeit-mvo.html"
          }],
          "nameUrl" : "menu-fachlichkeit-mvo.html",
          "title" : "Verordnung von Mehrfachverordnungen (MVO)",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-fachlichkeit-t-rezept.html"
          }],
          "nameUrl" : "menu-fachlichkeit-t-rezept.html",
          "title" : "Verordnung von E-T-Rezepten",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-fachlichkeit-ux-verordnend.html"
          }],
          "nameUrl" : "menu-fachlichkeit-ux-verordnend.html",
          "title" : "Best practice UX Primärsysteme für verordnende LEIs",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-fachlichkeit-ux-abgebend.html"
          }],
          "nameUrl" : "menu-fachlichkeit-ux-abgebend.html",
          "title" : "Best practice UX Primärsysteme für abgebende LEIs",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-technisch.html"
        }],
        "nameUrl" : "menu-technisch.html",
        "title" : "Technische Aspekte zur Arzneimittelverordnung",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-technische-umsetzung-anwendungsfaelle.html"
          }],
          "nameUrl" : "menu-technische-umsetzung-anwendungsfaelle.html",
          "title" : "Technische Anwendungsfälle",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-technische-umsetzung-dosierung.html"
          }],
          "nameUrl" : "menu-technische-umsetzung-dosierung.html",
          "title" : "Validierung von Dosierungsinformationen",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-technische-umsetzung-dispensierinformationen.html"
          }],
          "nameUrl" : "menu-technische-umsetzung-dispensierinformationen.html",
          "title" : "Erstellen von Dispensierinformationen",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-technische-umsetzung-abgabedatensatz.html"
          }],
          "nameUrl" : "menu-technische-umsetzung-abgabedatensatz.html",
          "title" : "Abgabedatensatz signieren",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-technische-umsetzung-kim.html"
          }],
          "nameUrl" : "menu-technische-umsetzung-kim.html",
          "title" : "E-Rezept-spezifische KIM-Messages",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-technische-umsetzung-mapping.html"
          }],
          "nameUrl" : "menu-technische-umsetzung-mapping.html",
          "title" : "Vorgaben zum Mapping von FHIR-Instanzen",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "mapping-prescription.html"
            }],
            "nameUrl" : "mapping-prescription.html",
            "title" : "Mapping von Verordnungsdaten",
            "generation" : "markdown",
            "page" : [{
              "extension" : [{
                "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                "valueUrl" : "mapping-prescription-bundle-parameters.html"
              }],
              "nameUrl" : "mapping-prescription-bundle-parameters.html",
              "title" : "Mapping des Bundles zu Parameters für Verordnungsdaten",
              "generation" : "markdown"
            },
            {
              "extension" : [{
                "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                "valueUrl" : "mapping-prescription-practitioner.html"
              }],
              "nameUrl" : "mapping-prescription-practitioner.html",
              "title" : "Mapping des Verordnenden für Verordnungsdaten",
              "generation" : "markdown"
            },
            {
              "extension" : [{
                "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                "valueUrl" : "mapping-prescription-organization.html"
              }],
              "nameUrl" : "mapping-prescription-organization.html",
              "title" : "Mapping der Organization für Verordnungsdaten",
              "generation" : "markdown"
            },
            {
              "extension" : [{
                "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                "valueUrl" : "mapping-prescription-medicationrequest.html"
              }],
              "nameUrl" : "mapping-prescription-medicationrequest.html",
              "title" : "Mapping der Verschreibung für Verordnungsdaten",
              "generation" : "markdown"
            },
            {
              "extension" : [{
                "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                "valueUrl" : "mapping-prescription-medication.html"
              }],
              "nameUrl" : "mapping-prescription-medication.html",
              "title" : "Mapping der Arzneimitteldaten für Verordnungsdaten",
              "generation" : "markdown",
              "page" : [{
                "extension" : [{
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "mapping-prescription-medication-compounding.html"
                }],
                "nameUrl" : "mapping-prescription-medication-compounding.html",
                "title" : "Mapping einer Rezeptur Medikation",
                "generation" : "markdown"
              },
              {
                "extension" : [{
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "mapping-prescription-medication-freetext.html"
                }],
                "nameUrl" : "mapping-prescription-medication-freetext.html",
                "title" : "Mapping einer Freitext Medikation",
                "generation" : "markdown"
              },
              {
                "extension" : [{
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "mapping-prescription-medication-ingredient.html"
                }],
                "nameUrl" : "mapping-prescription-medication-ingredient.html",
                "title" : "Mapping einer Wirkstoff Medikation",
                "generation" : "markdown"
              },
              {
                "extension" : [{
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "mapping-prescription-medication-pzn.html"
                }],
                "nameUrl" : "mapping-prescription-medication-pzn.html",
                "title" : "Mapping einer PZN Medikation",
                "generation" : "markdown"
              }]
            }]
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "mapping-dispensation.html"
            }],
            "nameUrl" : "mapping-dispensation.html",
            "title" : "Mapping von Dispensierinformationen",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "comparison-Bundle-input-example-1.html"
            }],
            "nameUrl" : "comparison-Bundle-input-example-1.html",
            "title" : "Beispiel für eine Transformation einer PZN",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "comparison-Bundle-input-example-2.html"
            }],
            "nameUrl" : "comparison-Bundle-input-example-2.html",
            "title" : "Beispiel für eine Transformation einer Wirkstoffverordnung",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "comparison-Bundle-input-example-3.html"
            }],
            "nameUrl" : "comparison-Bundle-input-example-3.html",
            "title" : "Beispiel für eine Transformation einer Freitextverordnung",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "comparison-Bundle-input-example-4.html"
            }],
            "nameUrl" : "comparison-Bundle-input-example-4.html",
            "title" : "Beispiel für eine Transformation einer Rezepturverordnung",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "comparison-Bundle-input-example-5.html"
            }],
            "nameUrl" : "comparison-Bundle-input-example-5.html",
            "title" : "Beispiel für eine Transformation einer Verordnung mit absoluter Referenzierung",
            "generation" : "markdown"
          }]
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-schnittstellen-query-api.html"
        }],
        "nameUrl" : "menu-schnittstellen-query-api.html",
        "title" : "Query API",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "query-api-task.html"
          }],
          "nameUrl" : "query-api-task.html",
          "title" : "Query API: Task",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-task-req-fd.html"
            }],
            "nameUrl" : "query-api-task-req-fd.html",
            "title" : "FD-Anforderungen: Task-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-task-req-fdv.html"
            }],
            "nameUrl" : "query-api-task-req-fdv.html",
            "title" : "FdV-Anforderungen: Task-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-task-req-avs.html"
            }],
            "nameUrl" : "query-api-task-req-avs.html",
            "title" : "AVS-Anforderungen: Task-Query",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "query-api-medicationdispense.html"
          }],
          "nameUrl" : "query-api-medicationdispense.html",
          "title" : "Query API: MedicationDispense",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-medicationdispense-req-fd.html"
            }],
            "nameUrl" : "query-api-medicationdispense-req-fd.html",
            "title" : "FD-Anforderungen: MedicationDispense-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-medicationdispense-req-fdv.html"
            }],
            "nameUrl" : "query-api-medicationdispense-req-fdv.html",
            "title" : "FdV-Anforderungen: MedicationDispense-Query",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "query-api-communication.html"
          }],
          "nameUrl" : "query-api-communication.html",
          "title" : "Query API: Communication",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-communication-req-fd.html"
            }],
            "nameUrl" : "query-api-communication-req-fd.html",
            "title" : "FD-Anforderungen: Communication-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-communication-req-fdv.html"
            }],
            "nameUrl" : "query-api-communication-req-fdv.html",
            "title" : "FdV-Anforderungen: Communication-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-communication-req-avs.html"
            }],
            "nameUrl" : "query-api-communication-req-avs.html",
            "title" : "AVS-Anforderungen: Communication-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-communication-req-data.html"
            }],
            "nameUrl" : "query-api-communication-req-data.html",
            "title" : "Datenmodell payload",
            "generation" : "markdown"
          }]
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-schnittstellen-operation-api.html"
        }],
        "nameUrl" : "menu-schnittstellen-operation-api.html",
        "title" : "Operation API",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-create.html"
          }],
          "nameUrl" : "op-create.html",
          "title" : "Operation $create (Task erzeugen)",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-create-req-fd.html"
            }],
            "nameUrl" : "op-create-req-fd.html",
            "title" : "FD-Anforderungen $create",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-create-req-pvs.html"
            }],
            "nameUrl" : "op-create-req-pvs.html",
            "title" : "PVS-Anforderungen $create",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-activate.html"
          }],
          "nameUrl" : "op-activate.html",
          "title" : "Operation $activate (Task aktivieren)",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-activate-req-fd.html"
            }],
            "nameUrl" : "op-activate-req-fd.html",
            "title" : "FD-Anforderungen $activate",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-activate-req-pvs.html"
            }],
            "nameUrl" : "op-activate-req-pvs.html",
            "title" : "PVS-Anforderungen $activate",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-accept.html"
          }],
          "nameUrl" : "op-accept.html",
          "title" : "Operation $accept (Task akzeptieren)",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-accept-req-fd.html"
            }],
            "nameUrl" : "op-accept-req-fd.html",
            "title" : "FD-Anforderungen $accept",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-accept-req-avs.html"
            }],
            "nameUrl" : "op-accept-req-avs.html",
            "title" : "AVS-Anforderungen $accept",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-reject.html"
          }],
          "nameUrl" : "op-reject.html",
          "title" : "Operation $reject (Task zurückweisen)",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-reject-req-fd.html"
            }],
            "nameUrl" : "op-reject-req-fd.html",
            "title" : "FD-Anforderungen $reject",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-reject-req-avs.html"
            }],
            "nameUrl" : "op-reject-req-avs.html",
            "title" : "AVS-Anforderungen $reject",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-dispense.html"
          }],
          "nameUrl" : "op-dispense.html",
          "title" : "Operation $dispense (Dispensierinformationen bereitstellen)",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-dispense-req-fd.html"
            }],
            "nameUrl" : "op-dispense-req-fd.html",
            "title" : "FD-Anforderungen $dispense",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-dispense-req-avs.html"
            }],
            "nameUrl" : "op-dispense-req-avs.html",
            "title" : "AVS-Anforderungen $dispense",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-close.html"
          }],
          "nameUrl" : "op-close.html",
          "title" : "Operation $close (Task schließen)",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-close-req-fd.html"
            }],
            "nameUrl" : "op-close-req-fd.html",
            "title" : "FD-Anforderungen $close",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-close-req-avs.html"
            }],
            "nameUrl" : "op-close-req-avs.html",
            "title" : "AVS-Anforderungen $close",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-abort.html"
          }],
          "nameUrl" : "op-abort.html",
          "title" : "Operation $abort (Task abbrechen)",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-abort-req-fd.html"
            }],
            "nameUrl" : "op-abort-req-fd.html",
            "title" : "FdV-Anforderungen $abort",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-abort-req-fdv.html"
            }],
            "nameUrl" : "op-abort-req-fdv.html",
            "title" : "E-Rezept-FdV Anforderungen $abort",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-abort-req-pvs.html"
            }],
            "nameUrl" : "op-abort-req-pvs.html",
            "title" : "PVS-Anforderungen $abort",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-abort-req-avs.html"
            }],
            "nameUrl" : "op-abort-req-avs.html",
            "title" : "AVS-Anforderungen $abort",
            "generation" : "markdown"
          }]
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "artifacts.html"
        }],
        "nameUrl" : "artifacts.html",
        "title" : "FHIR-Artefakte",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "referenced.html"
        }],
        "nameUrl" : "referenced.html",
        "title" : "Referenzen",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "downloads.html"
        }],
        "nameUrl" : "downloads.html",
        "title" : "Downloads",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "release-notes.html"
        }],
        "nameUrl" : "release-notes.html",
        "title" : "Release Notes",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "license.html"
        }],
        "nameUrl" : "license.html",
        "title" : "Apache Licence",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/resources/structuremaps"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources/kbv-bundles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources/transformed-kbv-bundles"
    },
    {
      "code" : "path-pages",
      "value" : "input/content"
    },
    {
      "code" : "path-pages",
      "value" : "input/pagecontent"
    },
    {
      "code" : "path-pages",
      "value" : "input/intro-notes"
    },
    {
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
