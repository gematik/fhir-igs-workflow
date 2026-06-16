### Zweck und Verwendung

Die Extension GEM_ERP_EX_CapabilityStatement_Environment kennzeichnet die konkrete Betriebsumgebung eines CapabilityStatements.

Mit dem Umgebungskennzeichen wird transparent, ob die beschriebenen Fähigkeiten für eine Produktiv-, Referenz-, Test- oder Entwicklungsumgebung gelten.

### Kodierung und Bindung

Die Extension verwendet ein einzelnes valueCode-Feld mit Required-Bindung an das ValueSet GEM_ERP_VS_CapabilityStatement_Environment.

Zulässige Codes sind:

- PU: Produktivumgebung
- RU: Referenzumgebung
- TU: Testumgebung
- DEV: Entwicklungsumgebung

### Hinweis für Implementierende

Die Environment-Extension sollte pro veröffentlichtem CapabilityStatement genau einmal gesetzt werden, damit Clients die deklarierte Funktionalität eindeutig einer Zielumgebung zuordnen können.
