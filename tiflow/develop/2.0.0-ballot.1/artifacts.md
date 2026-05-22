# FHIR-Artefakte - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein **Capability Statement** zur Beschreibung der unterstützten Funktionen sowie **Operation Definitions**, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die FHIR-Data-Service-Funktionalitäten festgelegt.

### Terminologien: Code Systems

### Systemverhalten

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

| | |
| :--- | :--- |
| [ - ](CapabilityStatement-ExampleCapabilityStatementServerPU.md) | - |
| [ CapabilityStatement für den TI-Flow-Fachdienst ](CapabilityStatement-ti-flow-fachdienst-server.md) | CapabilityStatement für den TI-Flow-Fachdienst |

**Tabelle:**Capability Statements

#### Operation Definitions

|
|

**Tabelle:**Operation Definitions

### Telemetriedaten

| | |
| :--- | :--- |
| [ Telemetry Data Status Codes Concept Map ](ConceptMap-TIFLOW-CM-TelemetryDataStatusCodes.md) | Maps operation outcome codes to the telemetry data status codes |

**Tabelle:**Telemetriedaten Status Codes

### Parameterprofile für Operationen

|
|

**Tabelle:**Parameterprofile

### Erweiterungen (Extension) Definitions

| | |
| :--- | :--- |
| [ TI Environment ](StructureDefinition-ti-environment.md) | Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren. |
| [ TI Feature ](StructureDefinition-ti-feature.md) | Deklariert ein einzelnes Feature eines Fachdienst-Deployments. Das Teilfeld `definition` verweist per Canonical auf den Feature-Bezeichner (analog zum HL7 Application Feature Framework, `hl7.fhir.uv.application-feature`); `value` beschreibt den aktuellen Zustand des Features am betrachteten Endpoint. Kompatibilitätshinweis: Diese Extension spiegelt bewusst die Sub-Extension-Namen `definition` und `value` des HL7-Frameworks wider, um eine spätere Migration oder Profilierung ohne Breaking Change zu ermöglichen. |
| [ TI FHIR Configuration ](StructureDefinition-ti-fhir-configuration.md) | Diese Extension deklariert eine konkrete Konfigurationsausprägung eines FHIR-Data Service in der TI auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert. Die Bedeutung und Konstellation einer FHIR-Konfiguration ist aus externen Quellen der Releaseplanung zu entnehmen. |
| [ TI Flow Type ](StructureDefinition-ti-flowtype.md) | Definiert den Typ eines Workflows im TIFlow. |
| [ TI Flow AcceptDate ](StructureDefinition-tiflow-accept-date.md) | Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt. |
| [ TIFlow Beneficiary ](StructureDefinition-tiflow-beneficiary.md) | Der Begünstigte (z. B. Apotheke) der Quittung eines TIFlow Vorgangs, der erstellt wird, wenn der Workflow abgeschlossen ist. |
| [ TI Flow ExpiryDate ](StructureDefinition-tiflow-expiry-date.md) | Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an. |

**Tabelle:**Extension Definitions

### Beispielinstanzen

**CapabilityStatement**

* [Example CapabilityStatement Server PU - RX](CapabilityStatement-ExampleCapabilityStatementServerPU.md)

