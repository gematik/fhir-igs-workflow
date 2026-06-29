# Konfiguration des TI-Flow-Fachdienst - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* **Konfiguration des TI-Flow-Fachdienst**

## Konfiguration des TI-Flow-Fachdienst

Der TI-Flow-Fachdienst unterstützt verschiedene Workflows und wird kontinuierlich um neue Workflows ergänzt. Um Pilotierungsphasen zu begleiten und Umgebungen gezielt zu konfigurieren, steuert der TI-Flow-Fachdienst die Aktivierung von Flowtypes und Features sowie die aktive FHIR-Validierungskonfiguration per Deployment-Konfiguration. Dies ermöglicht es, Funktionalität bereits im Code auszuliefern, ohne sie in der entsprechenden Umgebung zu aktivieren.

Die jeweils aktive Konfiguration einer Instanz wird im CapabilityStatement ausgegeben, damit Clientsysteme die Konfiguration abrufen und ihr Verhalten entsprechend anpassen können. Das CapabilityStatement ist konform zum Profil `ti-flow-capability-statement` und trägt drei typenspezifische Extensions:

| | |
| :--- | :--- |
| `ti-environment` | Betriebsumgebung der Instanz |
| `ti-fhir-configuration` | Aktive FHIR-Validierungskonfiguration |
| `ti-feature` | Aktivierungsstatus einzelner Flowtypes und Features |

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS alle für Clientsysteme relevanten Konfigurationsparameter:
* die aktive Betriebsumgebung
* den Status aller Flowtypes
* den Status aller Features
* sowie die aktive FHIR-Konfiguration
im CapabilityStatement ausgeben.
### Umgebungskennzeichnung

Die Extension `ti-environment` kennzeichnet die Betriebsumgebung, für die das CapabilityStatement gilt. Damit wird transparent, ob die beschriebenen Fähigkeiten für eine Produktiv-, Referenz-, Test- oder Entwicklungsumgebung deklariert werden. Pro CapabilityStatement wird sie genau einmal gesetzt, damit Clients die deklarierte Funktionalität eindeutig einer Zielumgebung zuordnen können.

#### Extension: ti-environment

Die Extension trägt einen einzelnen `valueCode` mit Required-Bindung an das entsprechende ValueSet, das Codes aus `TIEnvironmentsCS` enthält.

**Beispiel:**

```
{
  "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment",
  "valueCode": "prod"
}

```

### Konfiguration von Flowtypes

Die Operationalisierung einzelner Flowtypes kann per Konfiguration gesteuert werden. Das Deaktivieren eines Flowtypes verhindert den Abruf neuer Task-IDs für den entsprechenden Flowtype über die `$create`-Operation. Bereits erzeugte Tasks mit einem deaktivierten Flowtype bleiben vollständig bearbeitbar, um die Versorgung sicherzustellen.

Grundlage für die konfigurierbaren Parameter ist das [CodeSystem der Flowtypes](./CodeSystem-GEM-ERP-CS-FlowType.md). Mit der Definition neuer Flowtypes im CodeSystem erweitert sich die Menge der konfigurierbaren Parameter automatisch. Jeder Flowtype wird als `ti-feature`-Extension im CapabilityStatement ausgegeben.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS für jeden Wert aus dem FlowType-CodeSystem einen Konfigurationsparameter unterstützen, der die Operationalisierung des Flowtypes steuert, und den Aktivierungsstatus als `ti-feature`-Extension im CapabilityStatement ausgeben.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS für die valueCannonical der `ti-feature`-Extension für Flowtypes den Cannonical `https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf-<flowtype>` je Flowtype angeben.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei dem Versuch, die `$create`-Operation für einen deaktivierten Flowtype aufzurufen, die Operation mit dem folgenden Fehler abbrechen:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: forbidden
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_BLOCKED_FLOWTYPE
* HTTP-Code: Details Text
  * 403 - Forbidden: 

#### Extension: ti-feature

Die Extension `ti-feature` deklariert den Aktivierungsstatus eines einzelnen Flowtypes oder Features. Sie ist als Compound-Extension modelliert und wird für jeden Flowtype und jedes Feature als separate Instanz wiederholt.

Sie besteht aus zwei Sub-Extensions:

| | | |
| :--- | :--- | :--- |
| `definition` | `valueCanonical` | Kanonische URL der FeatureDefinition-Ressource, die den Flowtype oder das Feature eindeutig identifiziert |
| `value` | `valueBoolean` | `true`= aktiv,`false`= inaktiv |

**Beispiel:**

```
{
  "extension": [
    {
      "url": "definition",
      "valueCanonical": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf-160"
    },
    {
      "url": "value",
      "valueBoolean": true
    }
  ],
  "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature"
}

```

**Hinweis:** Für Flowtypes werden keine FeatureDefinitions spezifiziert. Diese werden automatisch durch den TI-Flow-Fachdienst gesetzt.

### Konfiguration von Features

Neben Flowtypes können auch Features konfiguriert werden, die sich nicht über einen Flowtype abbilden lassen. Features werden im jeweiligen FHIR-IG beschrieben und als `FeatureDefinition`-Ressource bereitgestellt. Sie müssen bei der Konzeption so abgekapselt werden, dass eine Deaktivierung technisch umsetzbar ist. Das Deaktivieren eines Features verhindert die Ausführung der zugehörigen Operationsaufrufe.

Jedes Feature wird als `ti-feature`-Extension im CapabilityStatement ausgegeben.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS für jedes im FHIR-IG beschriebene Feature als FeatureDefinition einen Konfigurationsparameter unterstützen, der die Verfügbarkeit des Features steuert, und den Aktivierungsstatus als `ti-feature`-Extension im CapabilityStatement ausgeben.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS für bei Deaktivierung eines im FHIR-IG beschriebenen Features alle zur Deaktivierung notwendigen featurespezifischen Vorgaben, die in der FeatureDefinition beschrieben sind umsetzen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei dem Aufruf einer Operation durch ein Clientsystem, die ein deaktiviertes Feature betrifft, die Operation mit dem folgenden Fehler abbrechen:

* HTTP-Code: Severity
  * 403 - Forbidden: error
* HTTP-Code: Code
  * 403 - Forbidden: forbidden
* HTTP-Code: Details Code
  * 403 - Forbidden: TIFLOW_BLOCKED_FEATURE
* HTTP-Code: Details Text
  * 403 - Forbidden: 

### FHIR-Konfiguration

Der TI-Flow-Fachdienst verwendet für die FHIR-Validierung eine definierte Kombination aus FHIR-Packages (FHIR-Konfiguration). Da der TI-Flow-Fachdienst auch externe FHIR-Pakete unterstützt, die sich außerhalb des IG-Release-Zyklus ändern können, publiziert die gematik FHIR-Konfigurationen außerhalb des FHIR-IGs. In einer Instanz ist jeweils genau eine FHIR-Konfiguration aktiv.

Zur Unterstützung von Testumgebungen existiert ein optionaler Konfigurationsparameter, der einen zeitlichen Versatz (Offset) des Referenzzeitpunkts für die FHIR-Validierung ermöglicht. Dieser Parameter darf ausschließlich in Test- und Referenzumgebungen gesetzt werden und erlaubt eine vorgelagerte FHIR-Validierung, ohne andere Systemkomponenten anpassen zu müssen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS die aktive FHIR-Konfiguration als `ti-fhir-configuration`-Extension im CapabilityStatement ausgeben.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS einen Konfigurationsparameter unterstützen, der einen zeitlichen Versatz (Offset) für den Referenzzeitpunkt der FHIR-Validierung umsetzt und die Validierung von FHIR-Instanzen entsprechend dem konfigurierten Offset durchsetzen.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS sicherstellen, dass der Konfigurationsparameter für den Offset des Referenzzeitpunkts der FHIR-Validierung in der Instanz der Produktivumgebung immer 0 ist.
#### Extension: ti-fhir-configuration

Die Extension `ti-fhir-configuration` deklariert das aktive Fachdienst-Konfigurationskennzeichen. Das zugrundeliegende CodeSystem verwendet das `#not-present`-Pattern, weil die konkrete Konzeptliste nicht im IG-Paket selbst gepflegt wird, sondern extern über den gematik-Releaseprozess versioniert bereitgestellt wird. Neue Codes werden ausschließlich durch gematik-Releaseartefakte eingeführt.

**Beispiel:**

```
{
  "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration",
  "valueCode": "tiflow_2028_03"
}

```

### Zusammengesetztes Beispiel

Das folgende CapabilityStatement deklariert einen Produktivumgebungs-Endpunkt mit Konfiguration `tiflow_2028_03`, auf dem WF160 aktiv und WF169 inaktiv ist:

```
{
  "resourceType": "CapabilityStatement",
  "id": "ExampleCapabilityStatementServerPU",
  "meta": {
    "profile": [
      "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-capability-statement"
    ]
  },
  "text": {
    "status": "extensions"
  },
  "extension": [
    {
      "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment",
      "valueCode": "prod"
    },
    {
      "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration",
      "valueCode": "tiflow_2028_03"
    },
    {
      "extension": [
        {
          "url": "definition",
          "valueCanonical": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf-160"
        },
        {
          "url": "value",
          "valueBoolean": true
        }
      ],
      "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature"
    },
    {
      "extension": [
        {
          "url": "definition",
          "valueCanonical": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf-169"
        },
        {
          "url": "value",
          "valueBoolean": false
        }
      ],
      "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature"
    }
  ]
}

```

| | | |
| :--- | :--- | :--- |
| `ti-environment` | `prod` | Produktivumgebung |
| `ti-fhir-configuration` | `tiflow_2028_03` | Aktive FHIR-Konfiguration |
| `ti-feature`(WF160) | `true` | Workflow 160 aktiv |
| `ti-feature`(WF169) | `false` | Workflow 169 inaktiv |

