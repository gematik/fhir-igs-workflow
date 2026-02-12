# FHIR-Artefakte - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide für den E-Rezept-Fachdienst definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Medikationsdaten innerhalb des E-Rezept-Fachdienst. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein **Capability Statement** zur Beschreibung der unterstützten Funktionen sowie **Operation Definitions**, die spezielle FHIR-Operationen für den Abruf und die Verwaltung von Medikationsdaten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die FHIR-Data-Service-Funktionalitäten festgelegt.

|
|

**Tabelle:**Value Sets

| | |
| :--- | :--- |
| [ ValueSet der Verfügbarkeitsstatus-Codes ](ValueSet-eflow-rx-availabilitystatus.md) | Art des Verfügbarkeitsstatus für die Verfügbarkeitsanfrage von Medikamenten |
| [ ValueSet der Dokumenttyp-Codes ](ValueSet-eflow-rx-documenttype.md) | Art der Dokumente je nach Empfänger. |
| [ ValueSet der FlowType-Codes ](ValueSet-eflow-rx-flowtype.md) | Zeigt die verschiedenen Arten des E-Rezepts entsprechend den Verschreibungsformularen. |
| [ GEM ERP VS OperationOutcomeDetails ](ValueSet-eflow-rx-operationoutcomedetails.md) | Fachliche Fehlercodes des E-Rezept-Fachdienst |
| [ ValueSet der Organisationstyp-Codes ](ValueSet-eflow-rx-organizationtype.md) | Art der Organisation |

### Terminologien: Code Systems

|
|

**Tabelle:**Code Systems

| | |
| :--- | :--- |
| [ CodeSystem des Verfügbarkeitsstatus ](CodeSystem-eflow-rx-availabilitystatus.md) | Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit. |
| [ CodeSystem der Dokumententypen ](CodeSystem-eflow-rx-documenttype.md) | Dokumententyp abhängig vom Empfänger des Bundles. |
| [ CodeSystem der Flowtypen ](CodeSystem-eflow-rx-flowtype.md) | Zeigt die verschiedenen Typen des E-Rezept Workflows entsprechend der Verordnungsformulare. WICHTIG: Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen! |
| [ GEM ERP CS OperationOutcomeDetails ](CodeSystem-eflow-rx-operationoutcomedetails.md) | Fachliche Fehlercodes des E-Rezept-Fachdienst |
| [ CodeSystem der Organisationstyp-Codes ](CodeSystem-eflow-rx-organizationtype.md) | Typ der Organisation, bei der E-Rezepte eingelöst werden können. |

### Systemverhalten

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des E-Rezept-Fachdienst umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das ePA-Aktensystem für den E-Rezept-Fachdienst unterstützen muss.

| | |
| :--- | :--- |
| [ ERP Capability Statement für Clients des E-Rezept-Fachdienst ](CapabilityStatement-erp-fachdienst-client.md) | Dieses Capability Statement legt die Anforderungen an Clients des E-Rezept-Fachdienst fest. Es definiert die unterstützten Interaktionen, erforderliche HTTP Header sowie erwartete Status Codes. |
| [ ERP CapabilityStatement für den E-Rezept-Fachdienst ](CapabilityStatement-erp-fachdienst-server.md) | ERP CapabilityStatement für den E-Rezept-Fachdienst |

**Tabelle:**Capability Statements

#### Operation Definitions

| | |
| :--- | :--- |
| [ Abort ](OperationDefinition-AbortOperation.md) | Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen. |
| [ Accept ](OperationDefinition-AcceptOperation.md) | Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'. |
| [ Activate ](OperationDefinition-ActivateOperation.md) | Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der E-Rezept-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow. |
| [ Close ](OperationDefinition-CloseOperation.md) | Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed. |
| [ Create ](OperationDefinition-CreateOperation.md) | Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes. |
| [ Dispense ](OperationDefinition-DispenseOperation.md) | Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird. |
| [ Reject ](OperationDefinition-RejectOperation.md) | Lehnt die Ausgabe eines eRezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden. |

**Tabelle:**Operation Definitions

### Parameterprofile für Operationen

| | |
| :--- | :--- |
| [ GEM ERP PR AcceptOperation Output ](StructureDefinition-eflow-rx-accept-operation-output-parameters.md) | Dieses Profil definiert die Parameter für die Annahme eines Medikaments von AVS zum E-Rezept-Fachdienst. Dies kann für die $accept-Operation verwendet werden. |
| [ GEM ERP PR ActivateOperation Output ](StructureDefinition-eflow-rx-activate-operation-output-parameters.md) | Dieses Profil definiert die Parameter für die Aktivierung einer Aufgabe von PVS zum E-Rezept-Fachdienst. Dies kann für die $activate-Operation verwendet werden. |
| [ GEM ERP PR CloseOperation Input ](StructureDefinition-eflow-rx-close-operation-input-parameters.md) | Dieses Profil definiert die Parameter für das Schließen eines Workflows für ein Rezept vom AVS zum E-Rezept-Fachdienst. Dies kann für die Operationen $close und $dispense verwendet werden. |
| [ GEM ERP PR CloseOperation Output ](StructureDefinition-eflow-rx-close-operation-output-parameters.md) | Dieses Profil definiert die Parameter für die Ausgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $close-Operation verwendet werden. |
| [ GEM ERP PR CreateOperation Output ](StructureDefinition-eflow-rx-create-operation-output-parameters.md) | Dieses Profil definiert die Parameter für die Erstellung einer Aufgabe von PVS zum E-Rezept-Fachdienst. Dies kann für die $create-Operation verwendet werden. |
| [ GEM ERP PR DispenseOperation Input ](StructureDefinition-eflow-rx-dispense-operation-input-parameters.md) | Dieses Profil definiert die Parameter für die Abgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $dispense-Operation verwendet werden. |

**Tabelle:**Parameterprofile

### Ressourcenprofile

|
|

**Tabelle:**Ressourcenprofile

### Datentypen

|
|

**Tabelle:**Datentypen

### Erweiterungen (Extension) Definitions

| | |
| :--- | :--- |
| [ GEM ERP EX AcceptDate ](StructureDefinition-eflow-rx-acceptdate-extension.md) | Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt. |
| [ GEM ERP EX AvailabilityState ](StructureDefinition-eflow-rx-availabilitystate-extension.md) | Extension zur Angabe von Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit. |
| [ GEM ERP EX Beneficiary ](StructureDefinition-eflow-rx-beneficiary-extension.md) | Der Begünstigte (z. B. Apotheke) des E-Rezept-Beleg, der erstellt wird, wenn der E-Rezept-Workflow abgeschlossen ist. |
| [ GEM ERP EX EU IS REDEEMABLE BY PATIENT AUTHORIZATION ](StructureDefinition-eflow-rx-eu-is-redeemable-by-patient-authorization-extension.md) | Extension zur Angabe des Nutzers, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht. |
| [ GEM ERP EX EU IS REDEEMABLE BY PROPERTIES ](StructureDefinition-eflow-rx-eu-is-redeemable-by-properties-extension.md) | Extension zur vom E-Rezept-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht. |
| [ GEM ERP EX ExpiryDate ](StructureDefinition-eflow-rx-expirydate-extension.md) | Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an. |
| [ GEM ERP EX InsuranceProvider ](StructureDefinition-eflow-rx-insuranceprovider-extension.md) | IK-Nummer (Institutionskennzeichen) des Versicherungsträgers, der das angeforderte Medikament abdeckt |
| [ GEM ERP EX LastMedicationDispense ](StructureDefinition-eflow-rx-lastmedicationdispense-extension.md) | Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt den Zeitstempel der letzten Ausgabe an. |
| [ GEM ERP EX PrescriptionType ](StructureDefinition-eflow-rx-prescriptiontype-extension.md) | Definiert den Typ eines Rezepts. |
| [ GEM ERP EX SupplyOptionsType ](StructureDefinition-eflow-rx-supplyoptionstype-extension.md) | Extension zur Angabe des bevorzugten Versorgungskanals |

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

* [AuditEvent-Eintrag vom E-Rezept-Fachdienst](AuditEvent-9361863d-fec0-4ba9-8776-6905cf1a0cfa.md)

**Bundle**

* [Beispiel Accept-Bundle](Bundle-Bundle-AcceptOperation.md)

* [Quittungs-Bundle für abgeschlossene Rezeptabgabe](Bundle-dffbfd6a-5712-4798-bdc8-07201eb77ab8.md)

**Communication**

* [Antwort-Nachricht der Apotheke an den Patienten](Communication-7977a4ab-97a9-4d95-afb3-6c4c1e2ac596.md)

* [Zuweisung des Patienten an die Apotheke](Communication-a218a36e-f2fd-4603-ba67-c827acfef01b.md)

**Device**

* [Gerät für Quittungs-Bundle](Device-1.md)

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

* [Beispiel für Abort-Operation Fehlerantwort (AVS)](OperationOutcome-ExampleOperationAbortErrorAVS.md)

* [Beispiel für Abort-Operation Fehlerantwort (PVS)](OperationOutcome-ExampleOperationAbortErrorPVS.md)

* [Beispiel für Accept-Operation Fehlerantwort](OperationOutcome-ExampleOperationAcceptError.md)

* [Example Activate operation error response](OperationOutcome-ExampleOperationActivateError.md)

* [Beispiel für Close-Operation Fehlerantwort](OperationOutcome-ExampleOperationCloseError.md)

* [Beispiel für Create-Operation Fehlerantwort](OperationOutcome-ExampleOperationCreateError.md)

* [Beispiel für Reject-Operation Fehlerantwort](OperationOutcome-ExampleOperationRejectError.md)

**Parameters**

* [Beispiel Close-Parameter](Parameters-ExampleCloseInputParameters.md)

* [Beispiel Close-Parameter für Kombipackung](Parameters-ExampleCloseInputParametersKombipackung.md)

* [Beispiel Close-Parameter mit mehreren MedicationDispenses](Parameters-ExampleCloseInputParametersMultipleMedicationDispenses.md)

* [Example Close Parameters](Parameters-ExampleCloseInputParametersRezeptur.md)

* [Example Dispense Parameters](Parameters-ExampleDispenseInputParameters.md)

* [Example Dispense Parameters](Parameters-ExampleDispenseInputParametersKombipackung.md)

* [Example Dispense Parameters](Parameters-ExampleDispenseInputParametersMultipleMedicationDispenses.md)

* [Example Activate operation input parameters](Parameters-ExampleOperationActivateParametersInput.md)

* [Beispiel für $create Operation Parameter](Parameters-OperationCreateParametersInputExample.md)

**Task**

* [Task abgeschlossen durch Apotheke via $close Operation](Task-09330307-16ce-4cdc-810a-ca24ef80dde3.md)

* [Task aktiviert durch (Z)PVS/KIS via $activate Operation](Task-607255ed-ce41-47fc-aad3-cfce1c39963f.md)

* [Task angenommen und abgegeben via $dispense Operation](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md)

* [Task erstellt durch Fachdienst via $create Operation](Task-b12eb5f7-91ce-4887-93c7-800454601377.md)

* [Task angenommen durch Apotheke via $accept Operation](Task-d70932d1-9e1c-483c-b2d4-b7dced09b35e.md)

* [Task mit mehreren MedicationDispenses](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)

