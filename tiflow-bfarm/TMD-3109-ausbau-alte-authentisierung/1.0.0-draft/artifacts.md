# FHIR-Artefakte - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementierungsleitfadens definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Übertragung des digitalen Durchschlags E-T-Rezept. Dazu gehören Fachmodelle, Profile zur Spezifizierung von Ressourcen, Mapping Dateien zur Erstellung des Durchschlags aus Quelldaten, sowie Beispielen.

### Fachmodelle

Fachmodelle fasst Informationen zusammen, die auf fachlicher Ebene ausgetauscht werden. Sie dienen dazu den Kontext und die Inhalte der Profile nachzuvollziehen.

| | |
| :--- | :--- |
| [ Logisches Modell digitaler Durchschlag E-T-Rezept ](StructureDefinition-erp-tprescription-carbon-copy-logical.md) | Logical Model zur Abbildung der im digitalen Durchschlag E-T-Rezept erforderlichen fachlichen Informationen. |

### Profile

Die folgenden Profile stellen dar, welche Inhalte an den BfArM Webdienst übertragen werden:

| | |
| :--- | :--- |
| [ Digitaler Durchschlag T-Rezept ](StructureDefinition-erp-tprescription-carbon-copy.md) | Dieses Profil beschreibt den digitalen Durchschlag T-Rezept der alle Informationen zusammenführt und verlinkt. Alle für den Anwendungsfall relevanten Ressourcen sind hier aufgelistet. |
| [ E-T-Rezept Medication Dispense ](StructureDefinition-erp-tprescription-medication-dispense.md) | Abgabeinformationen einer Apotheke, die es im Rahmen der Belieferung eines T-Rezeptes an den E-Rezept-Fachdienst übermittelt hat. |
| [ E-T-Rezept Medication Request ](StructureDefinition-erp-tprescription-medication-request.md) | Informationen zu einer Verordnung, die ein Arzt im E-T-Rezept angegeben hat. |
| [ E-T-Rezept Medication ](StructureDefinition-erp-tprescription-medication.md) | Medikationsprofil, welches Informationen zum verordneten oder abgegebenen Arzneimittel enthält. |
| [ E-T-Rezept Organization ](StructureDefinition-erp-tprescription-organization.md) | Angaben zur Apotheke, die das T-Rezept beliefert hat. |

### Artefakte für das Mapping

Im folgenden sind Artefakte abgebildet, die unterstützen das Mapping der Quelldaten auf den digitalen Durchschlag E-T-Rezept zu realisieren.

#### StructureMaps

StructureMaps sind strukturierte Dokumente, die maschinenlesbare Möglichkeit bieten Daten in andere Formate zu überführen.

| | |
| :--- | :--- |
| [ E-T-Rezept Structure Map for CarbonCopy ](StructureMap-ERPTPrescriptionStructureMapCarbonCopy.md) | Diese Ressource beschreibt das Mapping und führt die Mappings aller Teilressourcen zusammen. Weitere Informationen und Beschreibungen zum Mapping können auf der Seite [Mapping des digitalen Durchschlag E-T-Rezept](./menu-technische-umsetzung-mapping.html#mapping-des-digitalen-durchschlags-e-t-rezept) eingesehen werden. |
| [ E-T-Rezept Structure Map for Medication ](StructureMap-ERPTPrescriptionStructureMapGEMMedication.md) | Maps GEM ERP Medication to BfArM T-Prescription Medication format |
| [ E-T-Rezept Structure Map for KBV Compounding Medication ](StructureMap-ERPTPrescriptionStructureMapKBVCompoundingMedication.md) | Mapping-Anweisungen zur Transformation von KBV Rezeptur-Medikamenten zu BfArM T-Prescription Format |
| [ E-T-Rezept Structure Map for KBV FreeText Medication ](StructureMap-ERPTPrescriptionStructureMapKBVFreeTextMedication.md) | Maps KBV FreeText Medication to BfArM T-Prescription Medication format |
| [ E-T-Rezept Structure Map for KBV Ingredient Medication ](StructureMap-ERPTPrescriptionStructureMapKBVIngredientMedication.md) | Maps KBV-Ingredient ERP Medication to BfArM T-Prescription Medication format |
| [ E-T-Rezept Structure Map for KBV PZN Medication ](StructureMap-ERPTPrescriptionStructureMapKBVPZNMedication.md) | Mapping-Anweisungen zur Transformation von KBV PZN-Medikamenten zu BfArM T-Prescription Format |
| [ E-T-Rezept Structure Map for Medication ](StructureMap-ERPTPrescriptionStructureMapMedication.md) | Router-Mapping zur Auswahl der korrekten Medication-Transformation basierend auf dem KBV/gematik Profil |
| [ E-T-Rezept Structure Map for MedicationDispense ](StructureMap-ERPTPrescriptionStructureMapMedicationDispense.md) | Mapping-Anweisungen zur Transformation von gematik ERP MedicationDispense zu BfArM T-Prescription MedicationDispense |
| [ E-T-Rezept Structure Map for MedicationRequest ](StructureMap-ERPTPrescriptionStructureMapMedicationRequest.md) | Mapping-Anweisungen zur Transformation von KBV MedicationRequest zu BfArM T-Prescription MedicationRequest |
| [ E-T-Rezept Structure Map for Organization ](StructureMap-ERPTPrescriptionStructureMapOrganization.md) | Mapping-Anweisungen zur Erstellung einer BfArM Organization aus dem VZD SearchSet |
| [ E-T-Rezept Structure Map for Task ](StructureMap-ERPTPrescriptionStructureMapTask.md) | Mappt die E-Rezept ID aus dem Task in ein Identifier Objekt |

### Beispielinstanzen

**Bundle**

* [Beispiel VZD SearchSet Bundle](Bundle-VZD-SearchSet-Bundle.md)

**Medication**

* [Beispiel BfArM Medication (Verordnung) - Pomalidomid](Medication-ExampleMedication1-Pomalidomid-T.md)

* [Beispiel BfArM Medication (Abgabe) - Pomalidomid](Medication-ExampleMedication2-Pomalidomid-T.md)

**MedicationDispense**

* [Beispiel BfArM MedicationDispense](MedicationDispense-ExampleMedicationDispense-T.md)

**MedicationRequest**

* [Beispiel BfArM MedicationRequest](MedicationRequest-ExampleMedicationRequest-T.md)

**OperationOutcome**

* [Fehlermeldung BfArM Webdienst](OperationOutcome-ERP-TPrescription-OperationOutcome-1.md)

**Organization**

* [Beispiel BfArM Organisation](Organization-ExampleOrganization-T.md)

**Parameters**

* [Beispiel digitaler Durchschlag E-T-Rezept](Parameters-TRP-Carbon-Copy.md)

