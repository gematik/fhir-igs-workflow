### Zweck und Verwendung

Die Extension GEM_ERP_EX_CapabilityStatement_FDConfiguration ermöglicht die Deklaration konkreter Fachdienst-Konfigurationskennzeichen im CapabilityStatement.

Die Werte werden als `code` übertragen und bevorzugt gegen das ValueSet GEM_ERP_VS_FDConfiguration validiert.

### Not-Present-Pattern

Das zugrunde liegende CodeSystem GEM_ERP_CS_FDConfiguration verwendet bewusst `^content = #not-present`.

Dieses Pattern wurde gewählt, weil die konkrete Konzeptliste nicht in diesem IG-Paket gepflegt wird, sondern extern in gematik-Releaseartefakten versioniert bereitgestellt wird.

### Releaseprozess und Erweiterung

Neue FDConfiguration-Codes werden über den gematik-Releaseprozess eingeführt und nicht über eine IG-Publikation in diesem Repository.

Damit bleibt die Spezifikation stabil, während Konfigurationscodes kontrolliert im Betriebs- und Freigabeprozess erweitert werden können.

### Hinweis für Validierung

Validatoren können bei unbekannten Codes Warnungen ausgeben, wenn die konkrete externe Code-Liste lokal nicht vorliegt.

Dieses Verhalten ist erwartet und fachlich korrekt, solange der Terminologieserver bzw. das Releaseartefakt die neuen Codes kennt.
