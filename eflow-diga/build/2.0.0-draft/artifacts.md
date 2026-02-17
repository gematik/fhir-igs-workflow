# FHIR-Artefakte - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

# FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen des DiGA-Implementation Guides definiert werden.

### Parameterprofile fuer Operationen

| | |
| :--- | :--- |
| [ GEM ERP PR CloseOperation Input ](StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Input.md) | Dieses Profil definiert die Parameter fuer das Schliessen eines Workflows fuer ein Rezept vom AVS zum E-Rezept-Fachdienst. Dies kann fuer die Operationen $close und $dispense verwendet werden. |

**Tabelle:**Parameterprofile

### Ressourcenprofile

| | |
| :--- | :--- |
| [ GEM ERP PR Communication DiGA ](StructureDefinition-GEM-ERP-PR-Communication-DiGA.md) | Antwort des Leistungserbringers an den Patienten |
| [ GEM ERP PR MedicationDispense DiGA ](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md) | Dispensierung einer DiGA-Verordnung |

**Tabelle:**Ressourcenprofile

### Logische Modelle

| | |
| :--- | :--- |
| [ Logical DiGA Medication Dispense ](StructureDefinition-GEM-ERP-LOG-MedicationDispense-DiGA.md) | Fachliches Modell zur Beschreibung der Informationen, die bei $close und $dispense in der MedicationDispense-Ressource fuer DiGAs uebermittelt werden. |

**Tabelle:**Logische Modelle

### Erweiterungen (Extension) Definitions

| | |
| :--- | :--- |
| [ GEM ERP EX DeepLink ](StructureDefinition-GEM-ERP-EX-DeepLink.md) | Enthält Informationen zum Deep Link für eine DiGA. |
| [ GEM ERP EX RedeemCode ](StructureDefinition-GEM-ERP-EX-RedeemCode.md) | Gibt den Einlösecode für eine DiGA an. |

**Tabelle:**Extension Definitions

### Mapping Definitions (StructureMaps)

|
|

**Tabelle:**StructureMaps

### Beispielinstanzen

**Communication**

* [DiGA-Nachricht eines Kostenträgers an den Patienten](Communication-140f716f-f649-44fe-9a4e-157eb3c8adf3.md)

* [DiGA-Zuweisung des Patienten an die Krankenkasse](Communication-2be1c6ac-5d10-47f6-84ee-8318b2c22c76.md)

**MedicationDispense**

* [Medication Dispense DiGA with a deep link.](MedicationDispense-Example-MedicationDispense-DiGA-DeepLink.md)

* [Medication Dispense DiGA, Name and PZN](MedicationDispense-Example-MedicationDispense-DiGA-Name-And-PZN.md)

* [Medication Dispense DiGA without a redeem code](MedicationDispense-Example-MedicationDispense-DiGA-NoRedeemCode.md)

**Parameters**

* [Example Close Parameters](Parameters-ExampleCloseInputParametersDiGA.md)

