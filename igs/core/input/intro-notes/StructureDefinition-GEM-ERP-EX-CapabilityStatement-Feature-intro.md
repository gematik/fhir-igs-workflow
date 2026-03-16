### Zweck und Verwendung

Die Extension-Familie für CapabilityStatements ergänzt die statische Schnittstellenbeschreibung um konkrete Laufzeit- und Deployment-Informationen.

- GEM_ERP_EX_CapabilityStatement_Feature beschreibt einzelne deklarierbare Features als Paar aus Referenz (definition) und Aktivierungsstatus (value).
- GEM_ERP_EX_CapabilityStatement_Environment kennzeichnet die Zielumgebung (PU, RU, TU, DEV), für die die Deklaration gilt.

### Modellierungsprinzip

Das Feature-Muster ist als Compound-Extension umgesetzt:

- definition: canonical Referenz auf ein Feature-Konzept
- value: boolescher Aktivierungszustand

Für die Referenz werden zwei CodeSysteme kombiniert:

- GEM_ERP_CS_FlowType für Workflow-Typ-Features
- GEM_ERP_CS_Features für weitere nicht-workflowbezogene Features

### Hinweis für Implementierende

Bei der Erzeugung konkreter CapabilityStatements sollte pro Feature eine eigene Instanz der Feature-Extension gesetzt werden. Damit kann für jede Funktion transparent dargestellt werden, ob sie auf einem konkreten Endpoint aktiv ist.
