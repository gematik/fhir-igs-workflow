# EU Zugriff E-Rezept - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* **EU Zugriff E-Rezept**

## EU Zugriff E-Rezept

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu//ImplementationGuide/de.gematik.erezept.eu | *Version*:1.0.1 |
| Active as of 2026-02-27 | *Computable Name*:ERezeptWorkflowEU |

### EU Zugriff E-Rezept

Dieser Implementation Guide beschreibt das Feature zur Übermittlung von Verordnungen für die Einlösung im EU-Ausland. Im Fokus stehen die Prozessparameter und Ergänzungen an den Schnittstellen des E-Rezept-Fachdienstes sowie die Use Cases für Versicherte zur Verwaltung von Einwilligung und Zugriff.

Die Inhalte basieren auf der Spezifikation “EU Zugriff E-Rezept”, Version 1.0.1 (Stand: 10.04.2025). [gemspec eRp EU 1.0.1](https://gemspec.gematik.de/docs/gemF/gemF_eRp_EU/gemF_eRp_EU_V1.0.1/)

### Zweck und Geltungsbereich

* Ergänzungen zu den Schnittstellen des E-Rezept-Fachdienstes
* Beschreibung der fachlichen und technischen Use Cases
* Anforderungen für die beteiligten Produkttypen

### Nicht im Scope

* Anbindung der TI an die eHDSI
* Mapping zwischen deutschen Verordnungsdaten und dem EU-Datenmodell
* Abrechnung von im EU-Ausland eingelösten E-Rezepten
* Umsetzung von Workflows zu Arzneimitteln

### Wie dieser IG zu lesen ist

Die Kapitel folgen der Struktur Fachlichkeit, Technische Umsetzung und Schnittstellen. Szenarien und Anwendungsfälle verweisen auf die zugehörigen technischen Kapitel.

### Abhängigkeiten












### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an [erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de).

### Rechtliche Hinweise

Copyright ©2025+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von Health Level Seven International.



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "de.gematik.erezept.eu",
  "url" : "https://gematik.de/fhir/erp-eu//ImplementationGuide/de.gematik.erezept.eu",
  "version" : "1.0.1",
  "name" : "ERezeptWorkflowEU",
  "title" : "E-Rezept Workflow EU",
  "status" : "active",
  "date" : "2026-02-27T11:39:18+00:00",
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
  "description" : "Dieser IG Beschreibt Datenmodelle für den E-Rezept-Fachdienst mit dem NCPeH Deutschland",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "packageId" : "de.gematik.erezept.eu",
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
    "version" : "7.0.1"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.2.0"
  },
  {
    "id" : "de_basisprofil_r4",
    "uri" : "http://fhir.org/packages/de.basisprofil.r4/ImplementationGuide/de.basisprofil.r4",
    "packageId" : "de.basisprofil.r4",
    "version" : "1.5.4"
  },
  {
    "id" : "de_gematik_fhir_directory",
    "uri" : "http://fhir.org/packages/de.gematik.fhir.directory/ImplementationGuide/de.gematik.fhir.directory",
    "packageId" : "de.gematik.fhir.directory",
    "version" : "1.0.0"
  },
  {
    "id" : "de_gematik_epa_medication",
    "uri" : "https://gematik.de/fhir/epa-medication/ImplementationGuide/de.gematik.epa.medication",
    "packageId" : "de.gematik.epa.medication",
    "version" : "1.3.0"
  },
  {
    "id" : "de_gematik_terminology",
    "uri" : "https://gematik.de/fhir/terminology/ImplementationGuide/de.gematik.terminology",
    "packageId" : "de.gematik.terminology",
    "version" : "1.0.8"
  },
  {
    "id" : "de_gematik_ti",
    "uri" : "https://gematik.de/fhir/ti/ImplementationGuide/de.gematik.ti",
    "packageId" : "de.gematik.ti",
    "version" : "1.2.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2025+"
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
        "valueString" : "release"
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
        "valueString" : "https://gematik.de/fhir/erp-eu//history.html"
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
      "valueCode" : "hl7.fhir.uv.tools.r4#0.9.0"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2025+"
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
        "valueString" : "release"
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
        "valueString" : "https://gematik.de/fhir/erp-eu//history.html"
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
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/GEM-ERPEU-CS-RequestType"
      },
      "name" : "CodeSystem of NCPeH Request Types",
      "description" : "Type of Request from NCPeH",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/GEM-ERPEU-CS-ConsentType"
      },
      "name" : "CodeSystem of types for a consent",
      "description" : "Type of patient consent.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-Consent"
      },
      "name" : "Consent for ePrescriptions",
      "description" : "Records the consent of the patient for an operation in the context of ePrescription.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-MedicationDispense"
      },
      "name" : "Dispensation of the Prescription from the EU",
      "description" : "Handles information about the redeem of the prescription and the submited medication from the EU.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/logical-eu-dispense-data"
      },
      "name" : "Dispense Data from EU",
      "description" : "Logical Information that is Provided in the dispensation document by the NCPeH of country B for Dispensing Medication",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-Medication"
      },
      "name" : "EU-Medication",
      "description" : "Medication of a Prescription or Dispensation from the EU",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/EUCloseOperation"
      },
      "name" : "EUCloseOperation",
      "description" : "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleEUCloseInputParameters"
      },
      "name" : "Example EU-Close Parameters",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleEUGETPrescriptionDEMOGRAPHICS"
      },
      "name" : "Example EU-GET Prescription Parameters",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleEUGETPrescriptionE-PRESCRIPTIONS-LIST"
      },
      "name" : "Example EU-GET Prescription Parameters",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/ExampleEUGETPrescriptionE-PRESCRIPTIONS-RETRIEVAL"
      },
      "name" : "Example EU-GET Prescription Parameters",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/ExampleGetConsent"
      },
      "name" : "Example for a Bundle with a Consent",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Consent"
      }],
      "reference" : {
        "reference" : "Consent/f97a0772-c99f-4159-90c6-2a41c7d96779"
      },
      "name" : "Example for a Consent to redeem EU Prescritptions",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Consent"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationDispense"
      }],
      "reference" : {
        "reference" : "MedicationDispense/Example-MedicationDispense-EU"
      },
      "name" : "Example Medication Dispense",
      "description" : "Example of a Medication Dispense.",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-MedicationDispense"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Example-EU-Organization"
      },
      "name" : "Example-EU-Organization",
      "description" : "Example of an EU Organization",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      }],
      "reference" : {
        "reference" : "Practitioner/Example-EU-Practitioner"
      },
      "name" : "Example-EU-Practitioner",
      "description" : "Example of an EU Practitioner",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Practitioner"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "PractitionerRole"
      }],
      "reference" : {
        "reference" : "PractitionerRole/Example-EU-PractitionerRole"
      },
      "name" : "Example-EU-PractitionerRole",
      "description" : "Example of an EU PractitionerRole",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PractitionerRole"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Example-PATCH-Task-Single-Input-Request-True"
      },
      "name" : "Example_PATCH_Task_Single_Input",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-PATCH-Task-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Example-PATCH-Task-Single-Input-Request-False"
      },
      "name" : "Example_PATCH_Task_Single_Input",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-PATCH-Task-Input"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input"
      },
      "name" : "GEM ERP PR EU CloseOperation Input",
      "description" : "This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request"
      },
      "name" : "GEM ERPEU PR PAR Access Authorization Request",
      "description" : "Displays Parameters for EU Access Authorization",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response"
      },
      "name" : "GEM ERPEU PR PAR Access Authorization Response",
      "description" : "Displays Response Parameters for EU Access Authorization",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input"
      },
      "name" : "GEM ERPEU PR PAR GET Prescription Input",
      "description" : "This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/gem-erpeu-pr-par-get-prescription-output"
      },
      "name" : "GEM ERPEU PR PAR GET Prescription Output",
      "description" : "This profile defines the output parameters for the Get Prescription Operation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-PAR-PATCH-Task-Input"
      },
      "name" : "GEM ERPEU PR PAR PATCH Task Input",
      "description" : "This profile defines the parameters for patching the Task to mark the prescription as to-be-redeemed in the EU",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-EX-MedicinalPackageDescription"
      },
      "name" : "GEM_ERPEU_EX_MedicinalPackageDescription",
      "description" : "Description of a packaged medicinal product.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-EX-MedicinalPackageIdentifier"
      },
      "name" : "GEM_ERPEU_EX_MedicinalPackageIdentifier",
      "description" : "Identifier of a packaged medicinal product refers to a specific pack size of a specific product.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Example-EU-PermissionRequest"
      },
      "name" : "GEM_ERPEU_PR_PAR_Access_Authorization_Request",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      }],
      "reference" : {
        "reference" : "Parameters/Example-EU-PermissionResponse"
      },
      "name" : "GEM_ERPEU_PR_PAR_Access_Authorization_Response",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/GET-Prescription-EU"
      },
      "name" : "GET-Prescription-EU",
      "description" : "The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/Grant-EU-Access-Permission"
      },
      "name" : "Grant-EU-Access-Permission",
      "description" : "This operation receives the access code and the country that the patient wants to grant access to. The operation validates the country and creates registeres the Access Code.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:complex-type"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-AccessCode"
      },
      "name" : "Identifier Profile for EU AccessCode",
      "description" : "The AccessCode that is generated by the FdV in order to access the ePrescription in an EU country.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medication-Without-Strength-Code"
      },
      "name" : "Medication Without code or system for Strength",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medication-Without-Strength-Numerator"
      },
      "name" : "Medication Without code or system for Strength",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-Organization"
      },
      "name" : "Organization Information Received from the EU",
      "description" : "This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-Practitioner"
      },
      "name" : "Practitioner Information Received from the EU",
      "description" : "This Practitioner Profile is sent by the NCPeH when redeeming a Prescription in the EU",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERPEU-PR-PractitionerRole"
      },
      "name" : "PractitionerRole Information Received from the EU",
      "description" : "This PractitionerRole Profile is sent by the NCPeH when redeeming a Prescription in the EU",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/Read-EU-Access-Permission"
      },
      "name" : "Read-EU-Access-Permission",
      "description" : "This operation reads the currenty in the E-Rezept-Fachdienst registered Access Code for redeeming ePrescriptions in an EU country.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "OperationDefinition"
      }],
      "reference" : {
        "reference" : "OperationDefinition/Revoke-EU-Access-Permission"
      },
      "name" : "Revoke-EU-Access-Permission",
      "description" : "This operation revokes the currently registered access code for redeeming prescriptions in an EU country.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/SumatripanMedication"
      },
      "name" : "Sample Medication Sumatripan",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/SimpleMedication"
      },
      "name" : "Sample Simple Medication",
      "exampleCanonical" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/GEM-ERPEU-VS-ConsentType"
      },
      "name" : "ValueSet of Consent Codes",
      "description" : "Type of Consents for the ePrescription.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/GEM-ERPEU-VS-Consent-PolicyRule"
      },
      "name" : "ValueSet of Consent PolyRule Codes",
      "description" : "Type of Policy Rules for Consents of the ePrescription.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/GEM-ERPEU-VS-RequestType"
      },
      "name" : "ValueSet of NCPeH Request Types",
      "description" : "Type of Request from NCPeH",
      "exampleBoolean" : false
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
        "title" : "EU Zugriff E-Rezept",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-fachlichkeit-szenario-eu.html"
        }],
        "nameUrl" : "menu-fachlichkeit-szenario-eu.html",
        "title" : "Fachlichkeit - Szenario EU",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-technische-umsetzung-systemueberblick.html"
        }],
        "nameUrl" : "menu-technische-umsetzung-systemueberblick.html",
        "title" : "Technische Umsetzung - Systemüberblick",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-technische-umsetzung-anwendungsfaelle.html"
          }],
          "nameUrl" : "menu-technische-umsetzung-anwendungsfaelle.html",
          "title" : "Technische Umsetzung - Technische Anwendungsfälle",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "menu-technische-umsetzung-laender.html"
          }],
          "nameUrl" : "menu-technische-umsetzung-laender.html",
          "title" : "Zulässige europäische Länder",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-schnittstellen-datenschutz-und-sicherheit.html"
        }],
        "nameUrl" : "menu-schnittstellen-datenschutz-und-sicherheit.html",
        "title" : "Schnittstellen - Datenschutz und Sicherheit",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-schnittstellen-query-api.html"
        }],
        "nameUrl" : "menu-schnittstellen-query-api.html",
        "title" : "Schnittstellen - Query API",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "query-api-consent.html"
          }],
          "nameUrl" : "query-api-consent.html",
          "title" : "Query API: Consent",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-consent-req-fd.html"
            }],
            "nameUrl" : "query-api-consent-req-fd.html",
            "title" : "Server Anforderungen: Consent",
            "generation" : "markdown"
          }]
        },
        {
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
              "valueUrl" : "query-api-task-req-fdv.html"
            }],
            "nameUrl" : "query-api-task-req-fdv.html",
            "title" : "E-Rezept-FdV Anforderungen: Task",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-task-req-fd.html"
            }],
            "nameUrl" : "query-api-task-req-fd.html",
            "title" : "Server Anforderungen: Task",
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
        "title" : "Schnittstellen - Operation API",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-grant-eu-access-permission.html"
          }],
          "nameUrl" : "op-grant-eu-access-permission.html",
          "title" : "Operation API: Zugriffsberechtigung erstellen",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-grant-eu-access-permission-req-fd.html"
            }],
            "nameUrl" : "op-grant-eu-access-permission-req-fd.html",
            "title" : "Server Anforderungen: Zugriffsberechtigung erstellen",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-read-eu-access-permission.html"
          }],
          "nameUrl" : "op-read-eu-access-permission.html",
          "title" : "Operation API: Zugriffsberechtigung einsehen",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-read-eu-access-permission-req-fd.html"
            }],
            "nameUrl" : "op-read-eu-access-permission-req-fd.html",
            "title" : "Server Anforderungen: Zugriffsberechtigung einsehen",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-revoke-eu-access-permission.html"
          }],
          "nameUrl" : "op-revoke-eu-access-permission.html",
          "title" : "Operation API: Zugriffsberechtigung löschen",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-revoke-eu-access-permission-req-fd.html"
            }],
            "nameUrl" : "op-revoke-eu-access-permission-req-fd.html",
            "title" : "Server Anforderungen Anforderungen: Zugriffsberechtigung löschen",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-get-eu-prescriptions.html"
          }],
          "nameUrl" : "op-get-eu-prescriptions.html",
          "title" : "Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-get-eu-prescriptions-req-fd.html"
            }],
            "nameUrl" : "op-get-eu-prescriptions-req-fd.html",
            "title" : "Server Anforderungen: E-Rezepte zur Einlösung im EU-Ausland abrufen",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "op-eu-close.html"
          }],
          "nameUrl" : "op-eu-close.html",
          "title" : "Operation API: Abgabe von E-Rezepten im EU-Ausland",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-eu-close-req-fd.html"
            }],
            "nameUrl" : "op-eu-close-req-fd.html",
            "title" : "Server Anforderungen: Abgabe von E-Rezepten im EU-Ausland",
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
          "valueUrl" : "spec-sheet.html"
        }],
        "nameUrl" : "spec-sheet.html",
        "title" : "Steckbriefe",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "license.html"
        }],
        "nameUrl" : "license.html",
        "title" : "Lizenz",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-pages",
      "value" : "input/pagecontent"
    },
    {
      "code" : "path-pages",
      "value" : "input/content"
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
      "value" : "input/maps"
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
