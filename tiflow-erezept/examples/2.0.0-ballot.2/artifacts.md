# FHIR-Artefakte - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide für den TI-Flow-Fachdienst definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Medikationsdaten innerhalb des TI-Flow-Fachdienst. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein **Capability Statement** zur Beschreibung der unterstützten Funktionen sowie **Operation Definitions**, die spezielle FHIR-Operationen für den Abruf und die Verwaltung von Medikationsdaten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die FHIR-Data-Service-Funktionalitäten festgelegt.

|
|

**Tabelle:**Value Sets

| | |
| :--- | :--- |
| [ Bearbeiter eines E-Rezeptes ](ValueSet-GEM-ERP-VS-OrganizationType.md) | ValueSet der Organisationstyp-Codes eines Performers für den RX Task |
| [ TIFLOW EREZEPT Operation Outcome Details VS ](ValueSet-tiflow-erezept-operation-outcome-details-vs.md) | E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können |

### Terminologien: Code Systems

|
|

**Tabelle:**Code Systems

| | |
| :--- | :--- |
| [ TIFLOW EREZEPT Operation Outcome Details CS ](CodeSystem-tiflow-erezept-operation-outcome-details-cs.md) | E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können |

### Systemverhalten

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TI-Flow-Fachdienst umsetzen muss. Es handelt sich um eine Konformitätsbestätigung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das ePA-Aktensystem für den TI-Flow-Fachdienst unterstützen muss.

| | |
| :--- | :--- |
| [ TIFlow Fachdienst Server Capabilities ](CapabilityStatement-ti-flow-fachdienst-server-rx.md) | CapabilityStatement für den E-Rezept-Fachdienst (Arzneimittel-Workflow) |

**Tabelle:**Capability Statements

#### Operation Definitions

| | |
| :--- | :--- |
| [ E-Rezept abbrechen ](OperationDefinition-tiflow-rx-abort-op.md) | Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen. |
| [ E-Rezept abrufen ](OperationDefinition-tiflow-rx-accept-op.md) | Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'. |
| [ E-Rezept aktivieren ](OperationDefinition-tiflow-rx-activate-op.md) | Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow. |
| [ E-Rezept Abgabe vollziehen ](OperationDefinition-tiflow-rx-close-op.md) | Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed. |
| [ E-Rezept erstellen ](OperationDefinition-tiflow-rx-create-op.md) | Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes. |
| [ E-Rezept vorläufig abgeben ](OperationDefinition-tiflow-rx-dispense-op.md) | Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird. |
| [ E-Rezept zurückgeben ](OperationDefinition-tiflow-rx-reject-op.md) | Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden. |

**Tabelle:**Operation Definitions

### Parameterprofile für Operationen

| | |
| :--- | :--- |
| [ GEM ERP PR AcceptOperation Output ](StructureDefinition-GEM-ERP-PR-PAR-Accept-Operation-Output.md) | Dieses Profil definiert die Parameter für die Annahme eines Medikaments von AVS zum TI-Flow-Fachdienst. Dies kann für die $accept-Operation verwendet werden. |
| [ GEM ERP PR ActivateOperation Input ](StructureDefinition-GEM-ERP-PR-PAR-Activate-Operation-Input.md) | Dieses Profil definiert die Parameter für das Einstellen eines E-Rezeptes von PVS zum TI-Flow-Fachdienst. |
| [ GEM ERP PR ActivateOperation Output ](StructureDefinition-GEM-ERP-PR-PAR-Activate-Operation-Output.md) | Dieses Profil definiert die Parameter für die Aktivierung einer Aufgabe von PVS zum TI-Flow-Fachdienst. Dies kann für die $activate-Operation verwendet werden. |
| [ GEM ERP PR CloseOperation Input ](StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Input.md) | Dieses Profil definiert die Parameter für das Schließen eines Workflows für ein Rezept vom AVS zum TI-Flow-Fachdienst. Dies kann für die Operationen $close und $dispense verwendet werden. |
| [ GEM ERP PR CloseOperation Output ](StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Output.md) | Dieses Profil definiert die Parameter für die Ausgabe eines Medikaments von AVS an den TI-Flow-Fachdienst. Dies kann für die $close-Operation verwendet werden. |
| [ GEM ERP PR CreateOperation Input ](StructureDefinition-GEM-ERP-PR-PAR-Create-Operation-Input.md) | Dieses Profil definiert die Parameter für die Erstellung einer Aufgabe von PVS zum TI-Flow-Fachdienst. Dies kann für die $create-Operation verwendet werden. |
| [ GEM ERP PR CreateOperation Output ](StructureDefinition-GEM-ERP-PR-PAR-Create-Operation-Output.md) | Dieses Profil definiert die Parameter für die Erstellung einer Aufgabe von PVS zum TI-Flow-Fachdienst. Dies kann für die $create-Operation verwendet werden. |
| [ GEM ERP PR DispenseOperation Input ](StructureDefinition-GEM-ERP-PR-PAR-Dispense-Operation-Input.md) | Dieses Profil definiert die Parameter für die Abgabe eines Medikaments von AVS an den TI-Flow-Fachdienst. Dies kann für die $dispense-Operation verwendet werden. |

**Tabelle:**Parameterprofile

### Ressourcenprofile

| | |
| :--- | :--- |
| [ GEM ERP PR AuditEvent ](StructureDefinition-GEM-ERP-PR-AuditEvent.md) | AuditEvent für die Protokollierung des Zugriffs auf E-Rezepte |
| [ GEM ERP PR Bundle OP Accept ](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.md) | Antwort des TI-Flow-Fachdienst auf die $accept-Operation |
| [ GEM ERP PR Communication DispReq ](StructureDefinition-GEM-ERP-PR-Communication-DispReq.md) | Anfrage zur Einlösung des E-Rezepts |
| [ GEM ERP PR Communication Reply ](StructureDefinition-GEM-ERP-PR-Communication-Reply.md) | Antwort vom Leistungserbringer an den Patienten |
| [ GEM ERP PR Communication ](StructureDefinition-GEM-ERP-PR-Communication.md) | Generische Workflow-Communication |
| [ GEM ERP PR Medication ](StructureDefinition-GEM-ERP-PR-Medication.md) | Medikament zur Ausgabe des Rezepts |
| [ GEM ERP PR MedicationDispense ](StructureDefinition-GEM-ERP-PR-MedicationDispense.md) | Dispensierung eines E-Rezepts |
| [ Task für E-Rezept ](StructureDefinition-GEM-ERP-PR-Task.md) | Task für die Verwaltung des E-Rezept-Workflows |

**Tabelle:**Ressourcenprofile

### Datentypen

|
|

**Tabelle:**Datentypen

### Erweiterungen (Extension) Definitions

| | |
| :--- | :--- |
| [ GEM ERP EX AvailabilityState ](StructureDefinition-GEM-ERP-EX-AvailabilityState.md) | Extension zur Angabe von Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit. |
| [ GEM ERP EX EU IS REDEEMABLE BY PATIENT AUTHORIZATION ](StructureDefinition-GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PATIENT-AUTHORIZATION.md) | Extension zur Angabe des Nutzers, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht. |
| [ GEM ERP EX EU IS REDEEMABLE BY PROPERTIES ](StructureDefinition-GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES.md) | Extension zur vom TI-Flow-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht. |
| [ GEM ERP EX LastMedicationDispense ](StructureDefinition-GEM-ERP-EX-LastMedicationDispense.md) | Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt den Zeitstempel der letzten Ausgabe an. |
| [ GEM ERP EX SupplyOptionsType ](StructureDefinition-GEM-ERP-EX-SupplyOptionsType.md) | Extension zur Angabe des bevorzugten Versorgungskanals |

**Tabelle:**Extension Definitions

### Mapping Definitions (StructureMaps)

| | |
| :--- | :--- |
| [ GEMErpPrMedicationMap ](StructureMap-GEMErpPrMedicationMap.md) | Auto-generated StructureMap for GEM_ERP_PR_Medication|1.6.1 -> EPAMedication|1.3.0 |
| [ GEMErpPrMedicationdispenseMap ](StructureMap-GEMErpPrMedicationdispenseMap.md) | Auto-generated StructureMap for GEM_ERP_PR_MedicationDispense|1.6.1 -> EPAMedicationDispense|1.3.0 |
| [ KBVPrErpBundleMap ](StructureMap-KBVPrErpBundleMap.md) | Auto-generated StructureMap for transformation KBV_PR_ERP_Bundle|1.4.0 -> EPAOpProvidePrescriptionERPInputParameters|1.3.0 |
| [ KBVPrErpMedicationCompoundingMap ](StructureMap-KBVPrErpMedicationCompoundingMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Medication_Compounding|1.4.0 -> EPAMedication|1.3.0 |
| [ KBVPrErpMedicationFreetextMap ](StructureMap-KBVPrErpMedicationFreetextMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Medication_FreeText|1.4.0 -> EPAMedication|1.3.0 |
| [ KBVPrErpMedicationIngredientMap ](StructureMap-KBVPrErpMedicationIngredientMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Medication_Ingredient|1.4.0 -> EPAMedication|1.3.0 |
| [ KBVPrErpMedicationPznMap ](StructureMap-KBVPrErpMedicationPznMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Medication_PZN|1.4.0 -> EPAMedication|1.3.0 |
| [ KBVPrErpPrescriptionMap ](StructureMap-KBVPrErpPrescriptionMap.md) | Auto-generated StructureMap for KBV_PR_ERP_Prescription|1.4.0 -> EPAMedicationRequest|1.3.0 |
| [ KBVPrForOrganizationMap ](StructureMap-KBVPrForOrganizationMap.md) | Auto-generated StructureMap for KBV_PR_FOR_Organization|1.3.0 -> OrganizationDirectory|1.0.0 |
| [ KBVPrForPractitionerMap ](StructureMap-KBVPrForPractitionerMap.md) | Auto-generated StructureMap for KBV_PR_FOR_Practitioner|1.3.0 -> PractitionerDirectory|1.0.0 |

**Tabelle:**StructureMap

### Nutzung von Cross-Version-Extensions

Für die Profile der Ressourcen *MedicationRequest*, *MedicationDispense* und *MedicationStatement* werden die Backport-FHIR-Extensions `.renderedDosageInstruction` und `.effectiveDosePeriod` verwendet. Diese Elemente stammen aus FHIR R5 und wurden über den von der [FHIR-Spezifikation definierten Cross-Version-Mechanismus](https://hl7.org/fhir/versions.html#extensions) nach R4 zurückportiert. Dieser Mechanismus wird u. a. bereits vom [HL7 Java FHIR Validator](https://confluence.hl7.org/spaces/FHIR/pages/35718580/Using+the+FHIR+Validator) unterstützt; andere Validatoren müssen gegebenenfalls das entsprechende Cross-Version-Paket nachladen.

Das offizielle Cross-Version-Paket war zum Releasezeitpunkt dieses Implementation Guides noch nicht final in der FHIR-Registry verfügbar. Die Package-ID lautet: `hl7.fhir.uv.xver-r5.r4`. Bis zur offiziellen Veröffentlichung kann der Inhalt des folgenden Snapshot-Releases verwendet werden: [https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/](https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/)

In diesem Paket sind die benötigten cross-version Extensions enthalten:

* [MedicationDispense.renderedDosageInstruction](https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/StructureDefinition-ext-R5-MedicationDispense.renderedDosageInstruction.html)

### Beispielinstanzen

**AuditEvent**

* [AuditEvent-Eintrag vom TI-Flow-Fachdienst](AuditEvent-9361863d-fec0-4ba9-8776-7905cf1b0cfa.md)

**Bundle**

* [Beispiel Accept-Bundle](Bundle-Bundle-AcceptOperation.md)

* [Beispielantwort fuer die $accept-Operation](Bundle-ExampleAcceptResponseBundle.md)

* [Antwortbundle für GET /Communication (Rx)](Bundle-ExampleRxCommunicationSearchsetResponse.md)

* [Antwortbundle für GET /MedicationDispense (Rx)](Bundle-ExampleRxMedicationDispenseSearchsetResponse.md)

* [Antwortbundle für GET /Task (Rx)](Bundle-ExampleRxTaskSearchsetResponse.md)

* [Antwortbundle für GET /Task?status=ready (Rx)](Bundle-ExampleRxTaskSearchsetResponseReady.md)

* [Quittungs-Bundle für abgeschlossene Rezeptabgabe](Bundle-dffbfd6a-5712-4798-bdc8-07201eb77ab8.md)

* [Antwortbundle fuer GET /AuditEvent](Bundle-example-searchset-auditevent.md)

* [Antwortbundle fuer GET /Consent](Bundle-example-searchset-consent.md)

* [Antwortbundle fuer GET /MedicationDispense](Bundle-example-searchset-medicationdispense.md)

* [Antwortbundle fuer GET /Task](Bundle-example-searchset-task.md)

**Communication**

* [DiGA-Zuweisung des Patienten an die Krankenkasse](Communication-2be1c6ac-5d10-47f6-84ee-8318b2c22c76.md)

* [Antwort-Nachricht der Apotheke an den Patienten](Communication-7977a4ab-97a9-4d95-afb3-6c4c1e2ac596.md)

* [Zuweisung des Patienten an die Apotheke](Communication-a218a36e-f2fd-4603-ba67-c827acfef01b.md)

**Consent**

* [Einwilligung fuer den Use Case CHARGCONS](Consent-QueryConsentCHARGCONS.md)

**Device**

* [Gerät für Quittungs-Bundle](Device-ReceiptBundleDevice.md)

**Medication**

* [Beispiel-Medikament mit Einheiten](Medication-ExampleUnitMedication.md)

* [Medikament-Kombipackung](Medication-Medication-Kombipackung.md)

* [Medication-Rezeptur-FD](Medication-Medication-Rezeptur-FD.md)

* [Medikament-Rezeptur](Medication-Medication-Rezeptur.md)

* [Medikament ohne Stärke-Code](Medication-Medication-Without-Strength-Code.md)

* [Medikament ohne Stärke-Numerator](Medication-Medication-Without-Strength-Numerator.md)

* [Einfaches Beispiel-Medikament](Medication-SimpleMedication.md)

* [Beispiel-Medikament Sumatriptan](Medication-SumatripanMedication.md)

**MedicationDispense**

* [Zweites Beispiel Medikamentenabgabe](MedicationDispense-Example-MedicationDispense-2.md)

* [Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Wochentags](MedicationDispense-Example-MedicationDispense-Dosage-comb-dayofweek.md)

* [Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Intervals](MedicationDispense-Example-MedicationDispense-Dosage-comb-interval.md)

* [Beispiel Medikamentenabgabe mit Dosierung nach Interval](MedicationDispense-Example-MedicationDispense-Dosage-interval.md)

* [Beispiel Medikamentenabgabe mit Dosierung nach 4er Schema](MedicationDispense-Example-MedicationDispense-Dosage-tageszeit.md)

* [Beispiel Medikamentenabgabe mit Dosierung nach Uhrzeitbezug](MedicationDispense-Example-MedicationDispense-Dosage-uhrzeit.md)

* [Beispiel Medikamentenabgabe mit Dosierung nach Wochentagsbezug](MedicationDispense-Example-MedicationDispense-Dosage-weekday.md)

* [Beispiel Kombipackung Medikamentenabgabe](MedicationDispense-Example-MedicationDispense-Kombipackung.md)

* [Example Rezeptur Medication Dispense](MedicationDispense-Example-MedicationDispense-Rezeptur.md)

* [Beispiel Medikamentenabgabe ohne Medikament](MedicationDispense-Example-MedicationDispense-Without-Medication.md)

* [Beispiel Medikamentenabgabe](MedicationDispense-Example-MedicationDispense.md)

**OperationOutcome**

* [Beispiel Operation Outcome für Rx $abort Operation](OperationOutcome-ExampleRxAbortOperationOutcomeError.md)

* [Beispiel Operation Outcome für Rx $accept Operation](OperationOutcome-ExampleRxAcceptOperationOutcomeError.md)

* [Beispiel Operation Outcome für Rx $activate Operation](OperationOutcome-ExampleRxActivateOperationOutcomeError.md)

* [Beispiel Operation Outcome für Rx $close Operation](OperationOutcome-ExampleRxCloseOperationOutcomeError.md)

* [Beispiel Operation Outcome für Rx $create Operation](OperationOutcome-ExampleRxCreateOperationOutcomeError.md)

* [Beispiel Operation Outcome für Rx $dispense Operation](OperationOutcome-ExampleRxDispenseOperationOutcomeError.md)

* [Beispiel Operation Outcome für Rx $reject Operation](OperationOutcome-ExampleRxRejectOperationOutcomeError.md)

**Parameters**

* [Beispiel Close-Parameter](Parameters-ExampleCloseInputParameters.md)

* [Beispiel Close-Parameter für Kombipackung](Parameters-ExampleCloseInputParametersKombipackung.md)

* [Beispiel Close-Parameter mit mehreren MedicationDispenses](Parameters-ExampleCloseInputParametersMultipleMedicationDispenses.md)

* [Example Close Parameters](Parameters-ExampleCloseInputParametersRezeptur.md)

* [Example Dispense Parameters](Parameters-ExampleDispenseInputParameters.md)

* [Example Dispense Parameters](Parameters-ExampleDispenseInputParametersKombipackung.md)

* [Example Dispense Parameters](Parameters-ExampleDispenseInputParametersMultipleMedicationDispenses.md)

* [Beispiel Erfolgsantwort der Rx $accept Operation](Parameters-ExampleRxAcceptOutputParameters.md)

* [Example request parameters for Rx $activate operation](Parameters-ExampleRxActivateOperationRequestParameters.md)

* [Beispiel Erfolgsantwort der Rx $close Operation](Parameters-ExampleRxCloseOutputParameters.md)

* [Example request parameters for Rx $create operation](Parameters-ExampleRxCreateOperationRequestParameters.md)

**Subscription**

* [Anfrage fuer POST /Subscription](Subscription-example-create-subscription-request.md)

* [Antwort fuer POST /Subscription](Subscription-example-create-subscription-response.md)

**Task**

* [Task angenommen und abgegeben via $dispense Operation](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md)

* [Task abgeschlossen durch Apotheke via $close Operation](Task-TaskInClosedState.md)

* [Task aktiviert durch (Z)PVS/KIS via $activate Operation](Task-TaskInReadyState.md)

* [Task erstellt durch Fachdienst via $create Operation](Task-b12eb5f7-91ce-4887-93c7-800454601377.md)

* [Task erstellt durch Fachdienst via $create Operation](Task-b9f1fbdd-f28b-4ec7-959c-5283d3433b0e.md)

* [Task angenommen durch Apotheke via $accept Operation](Task-d70932d1-9e1c-483c-b2d4-b7dced09b35e.md)

* [Task mit mehreren MedicationDispenses](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)

