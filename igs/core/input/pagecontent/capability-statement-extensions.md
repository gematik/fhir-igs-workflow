Das CapabilityStatement des TI-Flow-Fachdienstes ist ein FHIR-Ressource, die maschinenlesbar deklariert, welche Funktionen ein Fachdienst-Endpunkt unterstützt und unter welchen Bedingungen er betrieben wird. Es wird von Clientsystemen abgefragt, um Feature-Verfügbarkeit und Umgebungszugehörigkeit zu ermitteln, bevor fachliche Interaktionen stattfinden.

Das CapabilityStatement konformiert zum Profil `ti-flow-capability-statement` und trägt drei typenspezifische Extensions, um 

- die Umgebung
- die FHIR-Konfiguration
- und Workflow, sowie Feature-Toggle

vom TI-Flow-Fachdienst abzufragen. Diese Extensions werden im folgenden beschrieben.

### Extension: ti-environment

Kennzeichnet die Betriebsumgebung, für die das CapabilityStatement gilt. Damit wird transparent, ob die beschriebenen Fähigkeiten für eine Produktiv-, Referenz-, Test- oder Entwicklungsumgebung deklariert werden.

Die Extension trägt einen einzelnen `valueCode` mit Required-Bindung an das entsprechende ValueSet, das Codes aus `TIEnvironmentsCS` enthält. Pro CapabilityStatement wird sie genau einmal gesetzt, damit Clients die deklarierte Funktionalität eindeutig einer Zielumgebung zuordnen können.

| Code | Bedeutung |
|---|---|
| `PU` | Produktivumgebung |
| `RU` | Referenzumgebung |
| `TU` | Testumgebung |
| `DEV` | Entwicklungsumgebung |

**Beispiel:**

```json
{
  "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment",
  "valueCode": "PU"
}
```

### Extension: ti-fhir-configuration

Deklariert das Fachdienst-Konfigurationskennzeichen (FDConfiguration) des Endpunkts. Es identifiziert, welche Version des Fachdienst-Konfigurationspakets aktiv ist – also welche Workflow-Versionen, Policies und Konfigurationsartefakte gelten.

Die Werte werden als `code` übertragen. Das zugrundeliegende CodeSystem verwendet das `#not-present`-Pattern, weil die konkrete Konzeptliste nicht im IG-Paket selbst gepflegt wird, sondern extern über den gematik-Releaseprozess versioniert bereitgestellt wird. Neue Codes werden ausschließlich durch gematik-Releaseartefakte eingeführt.

**Beispiel:**

```json
{
  "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration",
  "valueCode": "tiflow_2028_03"
}
```

### Extension: ti-feature

Deklariert den Aktivierungsstatus eines einzelnen Features. Die Extension ist als Compound-Extension modelliert und wird für jedes Feature als separate Instanz wiederholt.

Sie besteht aus zwei Sub-Extensions:

| Sub-Extension | Typ | Bedeutung |
|---|---|---|
| `definition` | `valueCanonical` | Kanonische URL der Feature-StructureDefinition, die das Feature eindeutig identifiziert |
| `value` | `valueBoolean` | `true` = Feature aktiv, `false` = Feature inaktiv |

Features repräsentieren konkrete Workflow-Typen oder Funktionsblöcke des Fachdienstes, z.B. einzelne Workflow-Varianten (WF160, WF169 usw.).

**Beispiel:**

```json
{
  "extension": [
    {
      "url": "definition",
      "valueCanonical": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf160"
    },
    {
      "url": "value",
      "valueBoolean": true
    }
  ],
  "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature"
}
```

### Zusammengesetztes Beispiel

Das folgende CapabilityStatement deklariert einen Produktivumgebungs-Endpunkt mit Konfiguration `tiflow_2028_03`, auf dem WF160 aktiv und WF169 inaktiv ist:

```json
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
      "valueCode": "PU"
    },
    {
      "url": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration",
      "valueCode": "tiflow_2028_03"
    },
    {
      "extension": [
        {
          "url": "definition",
          "valueCanonical": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf160"
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
          "valueCanonical": "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf169"
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

| Extension | Wert | Bedeutung |
|---|---|---|
| `ti-environment` | `PU` | Produktivumgebung |
| `ti-fhir-configuration` | `tiflow_2028_03` | Aktive Fachdienst-Konfiguration |
| `ti-feature` (WF160) | `true` | Workflow 160 aktiv |
| `ti-feature` (WF169) | `false` | Workflow 169 inaktiv |
