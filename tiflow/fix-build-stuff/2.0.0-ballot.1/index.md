# Implementation Guide TI-Flow Core - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* **Implementation Guide TI-Flow Core**

## Implementation Guide TI-Flow Core

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/ImplementationGuide/de.gematik.tiflow | *Version*:2.0.0-ballot.1 |
| Draft as of 2026-05-25 | *Computable Name*:gemIG_TIFlow_core |

Dieser IG beschreibt die zentralen, IG-übergreifenden Anforderungen an den TI-Flow-Fachdienst. Er fasst grundlegende Sicherheits-, Protokollierungs- und Validierungsvorgaben zusammen, die in allen nachgelagerten IGs wiederverwendet werden.

## Systemübersicht

Der TI-Flow-Fachdienst ist ein zentraler Ressourcenserver der Telematikinfrastruktur, der anwendungsübergreifende Workflows auf Basis des FHIR-Standards über eine RESTful API verwaltet.

Jeder Workflow wird über eine eindeutige Ressourcen-ID (Task-ID) adressiert und durchläuft ein definiertes Statusmodell. Der Fachdienst steuert die Statusübergänge und stellt sicher, dass nur zulässige, durch Nutzer initiierte Übergänge ausgeführt werden.

Alle Zugriffe auf einen Workflow werden für den zugeordneten Versicherten protokolliert. Die Datenhaltung erfolgt ausschließlich im Rahmen der gesetzlich zulässigen Speicherdauer.

Nach außen bietet der TI-Flow-Fachdienst seine Schnittstellen im Internet an und setzt für die Authentisierung und Autorisierung von Clientsystemen Zero Trust Access (ZETA) Mechanismen um. Ergänzend unterstützt er die asynchrone Übermittlung von Daten an Drittsysteme, etwa den ePA Medication Service.

Die Vertraulichkeit und Integrität der verarbeiteten Daten gewährleistet der Fachdienst durch das Konzept der vertrauenswürdigen Ausführungsumgebung (VAU). Diese sichert eine durchgängige Verschlüsselung der Verordnungen und zugehörigen Daten – während des Transports, der Verarbeitung und der persistierten Speicherung – durch eine Kombination kryptographischer Verfahren. Die VAU wird dabei nicht vom TI-Flow-Fachdienst selbst implementiert, sondern durch seinen Betrieb auf einem TI-Flow-Cluster, das als Healthcare Confidential Computing (HCC) Plattform dient und auch weiteren TI-Anwendungen zur Verfügung steht.

**Abbildung: **Systemüberblick TI-Flow-Fachdienst


## Zweck und Geltungsbereich

Um die Funktionalität des TI-Flow-Fachdienst verständlich und adressatengerecht zu beschreiben wurden mehrere FHIR-Implementation Guides angelegt.

Dieser “IG TIFlow Kernfunktionalitäten” fokussiert auf die technische Basisschicht und Kernfunktionalitäten des Fachdienstes und beschreibt mehrfach verwendete Funktionalitäten sowie übergreifendes Verhalten:

* Verbindungsaufbau der Clientsysteme zum TI-Flow-Fachdienst
* Validierung von FHIR-Ressourcen und Bundles
* Modulübergreifende Operationen auf Task ($create, $activate, $abort, …)
* Zugriffs- und Systemprotokollierung (AuditEvent)
* Löschfristen und automatisches Löschen

Inhalte aus diesem IG werden dann in zwei weiteren Arten von IG’s in der TI-Flow Landschaft weiterverwendet:

| | |
| :--- | :--- |
| Modul IG | Diese Implementation Guides enthalten Inhalte zu einem Modul, bzw. Anwendung innerhalb des TI-Flow-Fachdienst. Diese werden über eine eigenen eigenen URL-Pfad adressiert und sind durch eine eigene Domäne und Akteure gekennzeichnet. Jede Workflow-Anwendung im TI-Flow-Fachdienst wird durch einen eigenen IG beschrieben, der auf Beschreibungen und Verhalten der Kernfunktionalitäten basiert. |
| Funktions IG | Diese Implementation Guides enthalten Beschreibungen zu Endpunkten und Funktionalitäten, die als Bausteine wiederverwendet werden können und daher zentral beschrieben werden. Sie existieren nicht als eigene Anwendung in der TI-Flow-Fachdienst landschaft. |

**Tabelle: **Beschreibung der IG Arten im TI-Flow-Fachdienst

**Abbildung: **Übersicht der FHIR-IGs des TI-Flow-Fachdienst


## Aufbau

* [FHIR-Artefakte](./artifacts.md)
* [FHIR-Validierung](./fhir-validate.md)
* [Query API (modulübergreifend)](./menu-schnittstellen-query-api.md)
* [Operation API (modulübergreifend)](./menu-schnittstellen-operation-api.md)
* [Zugriffsprotokollierung](./audit-service.md)
* [Löschfristen](./ttl.md)

## Bezug zu weiteren IGs

Dieser IG enthält nur die gemeinsamen Vorgaben. Fachliche und prozessspezifische Details werden in den jeweiligen IGs dokumentiert.



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "de.gematik.tiflow",
  "url" : "https://gematik.de/fhir/tiflow/ImplementationGuide/de.gematik.tiflow",
  "version" : "2.0.0-ballot.1",
  "name" : "gemIG_TIFlow_core",
  "title" : "TIFlow - Kernfunktionalitäten",
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
  "packageId" : "de.gematik.tiflow",
  "license" : "Apache-2.0",
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
        "valueString" : "no-validate"
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
        "valueString" : "no-validate"
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
        "valueString" : "no-validate"
      },
      {
        "url" : "value",
        "valueString" : "Communication/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-validate"
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
        "valueString" : "no-validate"
      },
      {
        "url" : "value",
        "valueString" : "OperationDefinition/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-validate"
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
        "valueString" : "no-validate"
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
        "valueString" : "no-validate"
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
        "valueString" : "no-validate"
      },
      {
        "url" : "value",
        "valueString" : "Task/*"
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
        "valueString" : "Communication/*"
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
        "valueString" : "OperationDefinition/*"
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
        "valueString" : "Task/*"
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
        "valueString" : "https://gematik.de/fhir/tiflow/history.html"
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
        "valueCode" : "no-validate"
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
        "valueCode" : "no-validate"
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
        "valueCode" : "no-validate"
      },
      {
        "url" : "value",
        "valueString" : "Communication/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-validate"
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
        "valueCode" : "no-validate"
      },
      {
        "url" : "value",
        "valueString" : "OperationDefinition/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-validate"
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
        "valueCode" : "no-validate"
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
        "valueCode" : "no-validate"
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
        "valueCode" : "no-validate"
      },
      {
        "url" : "value",
        "valueString" : "Task/*"
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
        "valueString" : "Communication/*"
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
        "valueString" : "OperationDefinition/*"
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
        "valueString" : "Task/*"
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
        "valueString" : "https://gematik.de/fhir/tiflow/history.html"
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
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-op-accept-bundle"
      },
      "name" : "Bundle der $accept Operation",
      "description" : "Antwort des TI-Flow-Fachdienst auf die $accept-Operation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-flow-capability-statement"
      },
      "name" : "Capability Statement Profil für den TI-Flow-Fachdienst",
      "description" : "Dieses Profil beschreibt die Fähigkeiten des TI-Flow-Fachdienst.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/ti-flow-fachdienst-server"
      },
      "name" : "CapabilityStatement für den TI-Flow-Fachdienst",
      "description" : "CapabilityStatement für den TI-Flow-Fachdienst",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/GEM-ERP-CS-DocumentType"
      },
      "name" : "CodeSystem der Dokumententypen",
      "description" : "Dokumententyp abhängig vom Empfänger des Bundles.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/ti-flowtypes-codes"
      },
      "name" : "CodeSystem der Flowtypes in TIFlow Anwendungen",
      "description" : "Zeigt die verschiedenen Typen der TI Workflows entsprechend der Verordnungsformulare.\n\nWICHTIG: Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen!",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/GEM-ERP-CS-AvailabilityStatus"
      },
      "name" : "CodeSystem des Verfügbarkeitsstatus",
      "description" : "Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/ExampleCapabilityStatementServerPU"
      },
      "name" : "Example CapabilityStatement Server PU - RX",
      "description" : "Example capability statement for productive environment with common features enabled.",
      "exampleCanonical" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-capability-statement"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-flow-feature-wf160"
      },
      "name" : "Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel",
      "description" : "Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-flow-feature-wf169"
      },
      "name" : "Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer",
      "description" : "Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln mit Steuerung durch den Leistungserbringer",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Binary"
      },
      "name" : "GEM ERP PR Binary",
      "description" : "PKCS7 signiertes Bundle im enveloping style",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-receipt-composition"
      },
      "name" : "GEM ERP PR Composition",
      "description" : "Composition für die Quittung für die Einlösung eines E-Rezepts",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Device"
      },
      "name" : "GEM ERP PR Device",
      "description" : "Statische Informationen auf dem TI-Flow-Fachdienst",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Digest"
      },
      "name" : "GEM ERP PR Digest",
      "description" : "QES-Digest in Binary",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:complex-type"
      }],
      "reference" : {
        "reference" : "StructureDefinition/GEM-ERP-PR-Signature"
      },
      "name" : "GEM_ERP_PR_Signature",
      "description" : "Profil für die Signatur von Bundles im E-Rezept-Kontext",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-task"
      },
      "name" : "Task für TIFlow Anwendungen",
      "description" : "Task für die Verwaltung von Workflows der TIFlow Anwendungen",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      }],
      "reference" : {
        "reference" : "SearchParameter/TaskAcceptDateSP"
      },
      "name" : "TaskAcceptDateSP",
      "description" : "Das Einlösedatum eines E-Rezeptes. Nach Ablaufen dieses Datums darf ein E-Rezept nicht mehr zu Lasten des Kostenträgers abgegeben werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      }],
      "reference" : {
        "reference" : "SearchParameter/TaskExpiryDateSP"
      },
      "name" : "TaskExpiryDateSP",
      "description" : "Das Ablaufdatum eines E-Rezepzes. Nach ablauf dieses Datums darf ein E-Rezept nicht mehr beliefert werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ConceptMap"
      }],
      "reference" : {
        "reference" : "ConceptMap/TIFLOW-CM-TelemetryDataStatusCodes"
      },
      "name" : "Telemetry Data Status Codes Concept Map",
      "description" : "Maps operation outcome codes to the telemetry data status codes",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/audit-event-rest"
      },
      "name" : "TI Audit Event Rest",
      "description" : "Das AuditEvent-Profil für die Protokollierung des Zugriffs auf einen FHIR Data Service der Telematikinfrastruktur (TI)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-environment"
      },
      "name" : "TI Environment",
      "description" : "Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/ti-environment-codes"
      },
      "name" : "TI Environments CodeSystem",
      "description" : "Dieses CodeSystem definiert standardisierte Umgebungskennzeichen für CapabilityStatements des TI-Flow-Fachdienstes. Es erlaubt die eindeutige Kennzeichnung, ob die beschriebene Fähigkeit für Produktions-, Referenz-, Test- oder Entwicklungsumgebung gilt.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/ti-environment-vs"
      },
      "name" : "TI Environments ValueSet",
      "description" : "Dieses ValueSet enthält alle zulässigen Umgebungskennzeichen für CapabilityStatements des TI-Flow-Fachdienstes und wird für die verpflichtende Kennzeichnung der Zielumgebung verwendet.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-feature"
      },
      "name" : "TI Feature",
      "description" : "Deklariert ein einzelnes Feature eines Fachdienst-Deployments. \nDas Teilfeld `definition` verweist per Canonical auf den Feature-Bezeichner \n(analog zum HL7 Application Feature Framework, `hl7.fhir.uv.application-feature`);\n`value` beschreibt den aktuellen Zustand des Features am betrachteten Endpoint.\n\nKompatibilitätshinweis: Diese Extension spiegelt bewusst die Sub-Extension-Namen\n`definition` und `value` des HL7-Frameworks wider, um eine spätere Migration oder\nProfilierung ohne Breaking Change zu ermöglichen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-feature-definition"
      },
      "name" : "TI Feature Definition",
      "description" : "Logical Model zur Beschreibung eines aktivierbaren Features.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-fhir-configuration"
      },
      "name" : "TI FHIR Configuration",
      "description" : "Diese Extension deklariert eine konkrete Konfigurationsausprägung eines FHIR-Data Service in der TI auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert. Die Bedeutung und Konstellation einer FHIR-Konfiguration ist aus externen Quellen der Releaseplanung zu entnehmen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/ti-fhir-configuration-vs"
      },
      "name" : "TI FHIR Configuration ValueSet",
      "description" : "Dieses ValueSet bildet den zulässigen Wertebereich für die FHIR-Konfiguration eines FHIR-Data Service der TI ab.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-accept-date"
      },
      "name" : "TI Flow AcceptDate",
      "description" : "Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:complex-type"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-access-code"
      },
      "name" : "TI Flow AccessCode",
      "description" : "Der AccessCode ist ein generiertes Geheimnis, das Zugriff auf eine Ressource gewährt, z. B. Task.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-expiry-date"
      },
      "name" : "TI Flow ExpiryDate",
      "description" : "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:complex-type"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-secret"
      },
      "name" : "TI Flow Secret",
      "description" : "Das Secret ist ein generiertes Geheimnis, das Zugriff auf eine TIFlow Verordnung gewährt, z. B. Task.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ti-flowtype"
      },
      "name" : "TI Flow Type",
      "description" : "Definiert den Typ eines Workflows im TIFlow.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/ti-fhir-configuration-cs"
      },
      "name" : "TIFHIR Configuration CS",
      "description" : "Dieses CodeSystem beschreibt die FHIR-Konfigurationen eines FHIR-Data Service der TI. Die konkrete Konzeptliste wird extern im gematik-Releaseprozess als Release-Artefakt verwaltet und versioniert; dieser IG referenziert diese Konzepte nur über das Canonical.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-beneficiary"
      },
      "name" : "TIFlow Beneficiary",
      "description" : "Der Begünstigte (z. B. Apotheke) der Quittung eines TIFlow Vorgangs, der erstellt wird, wenn der Workflow abgeschlossen ist.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/tiflow-operation-outcome-details-cs"
      },
      "name" : "TIFLOW Operation Outcome Details CS",
      "description" : "Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/tiflow-operation-outcome-details-vs"
      },
      "name" : "TIFLOW Operation Outcome Details VS",
      "description" : "Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-operation-outcome"
      },
      "name" : "TIFlow OperationOutcome",
      "description" : "OperationOutcome für Angabe von Fehlermeldungen vom TI-Flow-Fachdienst",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/tiflow-receipt-bundle"
      },
      "name" : "TIFlow Receipt Bundle",
      "description" : "Dokumentenbündel für Quittung",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/GEM-ERP-VS-DocumentType"
      },
      "name" : "ValueSet der Dokumenttyp-Codes",
      "description" : "Art der Dokumente je nach Empfänger.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/ti-flowtypes-vs"
      },
      "name" : "ValueSet der Flowtypes in TIFlow Anwendungen",
      "description" : "Zeigt die verschiedenen Typen der TI Workflows entsprechend der Verordnungsformulare.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/GEM-ERP-VS-AvailabilityStatus"
      },
      "name" : "ValueSet der Verfügbarkeitsstatus-Codes",
      "description" : "Art des Verfügbarkeitsstatus für die Verfügbarkeitsanfrage von Medikamenten",
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
        "title" : "Implementation Guide TI-Flow Core",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "audit-service.html"
        }],
        "nameUrl" : "audit-service.html",
        "title" : "Zugriffsprotokollierung",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "fhir-validate.html"
        }],
        "nameUrl" : "fhir-validate.html",
        "title" : "FHIR-Ressource validieren",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "ttl.html"
        }],
        "nameUrl" : "ttl.html",
        "title" : "Löschfristen",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-technische-umsetzung-zeta.html"
        }],
        "nameUrl" : "menu-technische-umsetzung-zeta.html",
        "title" : "Zero Trust Access (ZETA)",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "zeta-client.html"
          }],
          "nameUrl" : "zeta-client.html",
          "title" : "Nutzung ZETA durch Clientsystme",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-technische-umsetzung-epa-ms.html"
        }],
        "nameUrl" : "menu-technische-umsetzung-epa-ms.html",
        "title" : "ePA MedicationService",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-technische-umsetzung-push.html"
        }],
        "nameUrl" : "menu-technische-umsetzung-push.html",
        "title" : "Push Notification senden",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "error-codes.html"
        }],
        "nameUrl" : "error-codes.html",
        "title" : "Fehlercodes",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "error-codes-req-fd.html"
          }],
          "nameUrl" : "error-codes-req-fd.html",
          "title" : "Anforderungen zur Fehlerbehandlung",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "kommunikation-dienste-ti.html"
        }],
        "nameUrl" : "kommunikation-dienste-ti.html",
        "title" : "Kommunikation zu Diensten der TI",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "datamatrix-code-client.html"
        }],
        "nameUrl" : "datamatrix-code-client.html",
        "title" : "Datamatrix Code",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "pki-zertifikatspruefung.html"
        }],
        "nameUrl" : "pki-zertifikatspruefung.html",
        "title" : "Zertifikatsprüfung",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "health-check.html"
        }],
        "nameUrl" : "health-check.html",
        "title" : "Health Check",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "fehlerbehandlung-client.html"
        }],
        "nameUrl" : "fehlerbehandlung-client.html",
        "title" : "Fehlerbehandlung Clientsysteme",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-schnittstellen-datenschutz-und-sicherheit.html"
        }],
        "nameUrl" : "menu-schnittstellen-datenschutz-und-sicherheit.html",
        "title" : "Datenschutz und Sicherheit",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-schnittstellen-generelle-prinzipien.html"
        }],
        "nameUrl" : "menu-schnittstellen-generelle-prinzipien.html",
        "title" : "Generelle Prinzipien",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-technische-umsetzung-systemueberblick.html"
        }],
        "nameUrl" : "menu-technische-umsetzung-systemueberblick.html",
        "title" : "Technische Umsetzung - Systemüberblick",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-technische-umsetzung-paging.html"
        }],
        "nameUrl" : "menu-technische-umsetzung-paging.html",
        "title" : "Handhabung der Rückgabe von mehreren FHIR-Objekten",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-technische-umsetzung-subscription.html"
        }],
        "nameUrl" : "menu-technische-umsetzung-subscription.html",
        "title" : "Notifications für Clientsysteme",
        "generation" : "markdown"
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
            "title" : "Server-Anforderungen $create",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-create-req-pvs.html"
            }],
            "nameUrl" : "op-create-req-pvs.html",
            "title" : "Client-Anforderungen $create",
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
            "title" : "Server-Anforderungen $activate",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-activate-req-pvs.html"
            }],
            "nameUrl" : "op-activate-req-pvs.html",
            "title" : "Client-Anforderungen $activate",
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
            "title" : "Server-Anforderungen $accept",
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
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-accept-req-ktr.html"
            }],
            "nameUrl" : "op-accept-req-ktr.html",
            "title" : "KTR-Anforderungen $accept",
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
            "title" : "Server-Anforderungen $reject",
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
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-reject-req-ktr.html"
            }],
            "nameUrl" : "op-reject-req-ktr.html",
            "title" : "KTR-Anforderungen $reject",
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
            "title" : "Server-Anforderungen $close",
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
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-close-req-ktr.html"
            }],
            "nameUrl" : "op-close-req-ktr.html",
            "title" : "KTR-Anforderungen $close",
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
            "title" : "Server-Anforderungen $abort",
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
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "op-abort-req-fdv.html"
            }],
            "nameUrl" : "op-abort-req-fdv.html",
            "title" : "FdV-Anforderungen $abort",
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
            "title" : "Server-Anforderungen: Task-Query",
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
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-task-req-ktr.html"
            }],
            "nameUrl" : "query-api-task-req-ktr.html",
            "title" : "KTR-Anforderungen: Task-Query",
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
            "title" : "Server-Anforderungen: MedicationDispense-Query",
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
            "valueUrl" : "query-api-auditevent.html"
          }],
          "nameUrl" : "query-api-auditevent.html",
          "title" : "Query API: AuditEvent",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-auditevent-req-fd.html"
            }],
            "nameUrl" : "query-api-auditevent-req-fd.html",
            "title" : "Server-Anforderungen: AuditEvent-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-auditevent-req-fdv.html"
            }],
            "nameUrl" : "query-api-auditevent-req-fdv.html",
            "title" : "FdV-Anforderungen: AuditEvent-Query",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "query-api-device.html"
          }],
          "nameUrl" : "query-api-device.html",
          "title" : "Query API: Device",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-device-req-fd.html"
            }],
            "nameUrl" : "query-api-device-req-fd.html",
            "title" : "Server-Anforderungen: Device-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-device-req-fdv.html"
            }],
            "nameUrl" : "query-api-device-req-fdv.html",
            "title" : "FdV-Anforderungen: Device-Query",
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
            "title" : "Server-Anforderungen: Communication-Query",
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
              "valueUrl" : "query-api-communication-req-ktr.html"
            }],
            "nameUrl" : "query-api-communication-req-ktr.html",
            "title" : "KTR-Anforderungen: Communication-Query",
            "generation" : "markdown"
          }]
        },
        {
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
            "title" : "Server-Anforderungen: Consent-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-consent-req-fdv.html"
            }],
            "nameUrl" : "query-api-consent-req-fdv.html",
            "title" : "Client-Anforderungen: Consent-Query",
            "generation" : "markdown"
          }]
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "menu-schnittstellen-additional-api.html"
        }],
        "nameUrl" : "menu-schnittstellen-additional-api.html",
        "title" : "Additional API",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "query-api-channels.html"
          }],
          "nameUrl" : "query-api-channels.html",
          "title" : "Query API: Channels",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-channels-req-fd.html"
            }],
            "nameUrl" : "query-api-channels-req-fd.html",
            "title" : "Server-Anforderungen: Channels-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-channels-req-fdv.html"
            }],
            "nameUrl" : "query-api-channels-req-fdv.html",
            "title" : "FdV-Anforderungen: Channels-Query",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "query-api-pushers.html"
          }],
          "nameUrl" : "query-api-pushers.html",
          "title" : "Query API: Pushers",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-pushers-req-fd.html"
            }],
            "nameUrl" : "query-api-pushers-req-fd.html",
            "title" : "Server-Anforderungen: Pushers-Query",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-pushers-req-fdv.html"
            }],
            "nameUrl" : "query-api-pushers-req-fdv.html",
            "title" : "FdV-Anforderungen: Pushers-Query",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "query-api-subscription.html"
          }],
          "nameUrl" : "query-api-subscription.html",
          "title" : "Additional API: Subscription",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-subscription-req-fd.html"
            }],
            "nameUrl" : "query-api-subscription-req-fd.html",
            "title" : "Server-Anforderungen: Subscription",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-subscription-req-avs.html"
            }],
            "nameUrl" : "query-api-subscription-req-avs.html",
            "title" : "AVS-Anforderungen: Subscription",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "query-api-subscription-req-ktr.html"
            }],
            "nameUrl" : "query-api-subscription-req-ktr.html",
            "title" : "KTR-Anforderungen: Subscription",
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
          "valueUrl" : "requirement-mapping-old-to-new.html"
        }],
        "nameUrl" : "requirement-mapping-old-to-new.html",
        "title" : "Mapping alter Anforderungen auf FHIR-IG Anforderungen",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "license.html"
        }],
        "nameUrl" : "license.html",
        "title" : "Apache License",
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
