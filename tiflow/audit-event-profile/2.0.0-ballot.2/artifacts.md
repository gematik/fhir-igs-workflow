# FHIR-Artefakte - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein **Capability Statement** zur Beschreibung der unterstützten Funktionen sowie **Operation Definitions**, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die TIFlow-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ TIFlow Order Task ValueSet ](ValueSet-tiflow-order-task-status-vs.md) | TIFlow Order Task ValueSet |

**Tabelle:**Value Sets

### Logical Models

| | |
| :--- | :--- |
| [ TI Feature Definition ](StructureDefinition-ti-feature-definition.md) | Logical Model zur Beschreibung eines aktivierbaren Features. |

**Tabelle:**Logical Models

### Funktions Definition

| | |
| :--- | :--- |
| [ Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel ](StructureDefinition-ti-flow-feature-wf160.md) | Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln |
| [ Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer ](StructureDefinition-ti-flow-feature-wf169.md) | Featurebeschreibung für die Verordnung von Apothekenpflichtigen Arzneimitteln mit Steuerung durch den Leistungserbringer |

**Tabelle:**Funktions Definition

### Systemverhalten

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

| | |
| :--- | :--- |
| [ - ](CapabilityStatement-ExampleCapabilityStatementServerPU.md) | - |
| [ CapabilityStatement für den TI-Flow-Fachdienst ](CapabilityStatement-ti-flow-fachdienst-server.md) | CapabilityStatement für den TI-Flow-Fachdienst |

**Tabelle:**Capability Statements

#### Operation Outcomes

| | |
| :--- | :--- |
| [ TIFLOW Operation Outcome Details CS ](CodeSystem-tiflow-operation-outcome-details-cs.md) | Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können |
| [ TIFlow OperationOutcome ](StructureDefinition-tiflow-operation-outcome.md) | OperationOutcome für Angabe von Fehlermeldungen vom TI-Flow-Fachdienst |
| [ TIFLOW Operation Outcome Details VS ](ValueSet-tiflow-operation-outcome-details-vs.md) | Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können |

**Tabelle:**Operation Outcomes

### Telemetriedaten

| | |
| :--- | :--- |
| [ Telemetry Data Status Codes Concept Map ](ConceptMap-TIFLOW-CM-TelemetryDataStatusCodes.md) | Maps operation outcome codes to the telemetry data status codes |

**Tabelle:**Telemetriedaten Status Codes

### Ressourcenprofile

| | |
| :--- | :--- |
| [ TI Audit Event Rest ](StructureDefinition-tiflow-audit-event-rest.md) | Das AuditEvent-Profil für die Protokollierung des Zugriffs auf einen FHIR Data Service der Telematikinfrastruktur (TI) |
| [ Capability Statement Profil für den TI-Flow-Fachdienst ](StructureDefinition-tiflow-capability-statement.md) | Dieses Profil beschreibt die Fähigkeiten des TI-Flow-Fachdienst. |
| [ Generische TIFlow Communication ](StructureDefinition-tiflow-communication.md) | Generische TIFlow Workflow-Communication |
| [ Bundle der $accept Operation ](StructureDefinition-tiflow-op-accept-bundle.md) | Antwort des TI-Flow-Fachdienst auf die $accept-Operation |
| [ Task für TIFlow Verordnungen ](StructureDefinition-tiflow-order-task.md) | Task für die Verwaltung von Workflows der TIFlow Verordnungen |

**Tabelle:**Ressourcenprofile

### Legacy-Artefakte

Diese Sektion enthält FHIR-Artefakte, deren kanonische URL bewusst auf einem vorherigen Stand belassen wurde. Dadurch bleibt die Rückwärtskompatibilität für bestehende Implementierungen erhalten.

#### Lagacy Terminologien: Code Systems

| | |
| :--- | :--- |
| [ CodeSystem des Verfügbarkeitsstatus ](CodeSystem-GEM-ERP-CS-AvailabilityStatus.md) | Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit. |
| [ CodeSystem der Dokumententypen ](CodeSystem-GEM-ERP-CS-DocumentType.md) | Dokumententyp abhängig vom Empfänger des Bundles. |
| [ CodeSystem der Flowtypes in TIFlow Anwendungen ](CodeSystem-GEM-ERP-CS-FlowType.md) | Zeigt die verschiedenen Typen der TI Workflows entsprechend der Verordnungsformulare. WICHTIG: Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen! |

**Tabelle:**Lagacy Code Systems

#### Lagacy Terminologien: Value Sets

| | |
| :--- | :--- |
| [ ValueSet der Verfügbarkeitsstatus-Codes ](ValueSet-GEM-ERP-VS-AvailabilityStatus.md) | Art des Verfügbarkeitsstatus für die Verfügbarkeitsanfrage von Medikamenten |
| [ ValueSet der Dokumenttyp-Codes ](ValueSet-GEM-ERP-VS-DocumentType.md) | Art der Dokumente je nach Empfänger. |
| [ ValueSet der Flowtypes in TIFlow Anwendungen ](ValueSet-GEM-ERP-VS-FlowType.md) | Zeigt die verschiedenen Typen der TI Workflows entsprechend der Verordnungsformulare. |

**Tabelle:**Lagacy Value Sets

#### Lagacy Suchparameter

| | |
| :--- | :--- |
| [ TaskAcceptDateSP ](SearchParameter-TaskAcceptDateSP.md) | Das Einlösedatum eines E-Rezeptes. Nach Ablaufen dieses Datums darf ein E-Rezept nicht mehr zu Lasten des Kostenträgers abgegeben werden. |
| [ TaskExpiryDateSP ](SearchParameter-TaskExpiryDateSP.md) | Das Ablaufdatum eines E-Rezepzes. Nach ablauf dieses Datums darf ein E-Rezept nicht mehr beliefert werden. |

**Tabelle:**Lagacy Suchparameter

#### Lagacy Ressourcenprofile

| | |
| :--- | :--- |
| [ GEM ERP PR Binary ](StructureDefinition-GEM-ERP-PR-Binary.md) | PKCS7 signiertes Bundle im enveloping style |
| [ TIFlow Receipt Bundle ](StructureDefinition-GEM-ERP-PR-Bundle.md) | Dokumentenbündel für Quittung |
| [ GEM ERP PR Composition ](StructureDefinition-GEM-ERP-PR-Composition.md) | Composition für die Quittung für die Einlösung eines E-Rezepts |
| [ GEM ERP PR Device ](StructureDefinition-GEM-ERP-PR-Device.md) | Statische Informationen auf dem TI-Flow-Fachdienst |
| [ GEM ERP PR Digest ](StructureDefinition-GEM-ERP-PR-Digest.md) | QES-Digest in Binary |

**Tabelle:**Lagacy Ressourcenprofile

#### Lagacy Erweiterungen (Extension) Definitions

| | |
| :--- | :--- |
| [ TI Flow AcceptDate ](StructureDefinition-GEM-ERP-EX-AcceptDate.md) | Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt. |
| [ TIFlow Beneficiary ](StructureDefinition-GEM-ERP-EX-Beneficiary.md) | Der Begünstigte (z. B. Apotheke) der Quittung eines TIFlow Vorgangs, der erstellt wird, wenn der Workflow abgeschlossen ist. |
| [ TI Flow ExpiryDate ](StructureDefinition-GEM-ERP-EX-ExpiryDate.md) | Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an. |
| [ TI Flow Type ](StructureDefinition-GEM-ERP-EX-PrescriptionType.md) | Definiert den Typ eines Workflows im TIFlow. |

**Tabelle:**Extension Definitions

#### Lagacy Datentypen

| | |
| :--- | :--- |
| [ GEM_ERP_PR_Signature ](StructureDefinition-GEM-ERP-PR-Signature.md) | Profil für die Signatur von Bundles im E-Rezept-Kontext |

**Tabelle:**Lagacy Datentypen

### Beispielinstanzen

**CapabilityStatement**

* [Example CapabilityStatement Server PU - RX](CapabilityStatement-ExampleCapabilityStatementServerPU.md)

