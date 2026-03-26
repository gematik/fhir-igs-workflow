# FHIR-Artefakte - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Diese Seite enthält eine Übersicht aller FHIR-Artefakte, die im Rahmen dieses Implementation Guide definiert werden. Sie bilden die Grundlage für die strukturierte Abbildung und Verarbeitung von Daten. Dazu gehören Profile zur Spezifizierung von Ressourcen, ein **Capability Statement** zur Beschreibung der unterstützten Funktionen sowie **Operation Definitions**, die spezielle FHIR-Operationen für den Abruf und die Verwaltung der Daten festlegen.

### Terminologien: Value Sets

Die folgenden Value Sets sind für die FHIR-Data-Service-Funktionalitäten festgelegt.

### Terminologien: Code Systems

### Systemverhalten

#### Capability Statements

Das **Capability** **Statement** beschreibt die Anforderungen und Fähigkeiten, die ein Server für die konforme Implementierung des TIFlow Fachdienstes umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das der TIFlow Fachdienste unterstützen muss.

| | |
| :--- | :--- |
| [ ERP CapabilityStatement für den E-Rezept-Fachdienst ](CapabilityStatement-erp-fachdienst-server.md) | ERP CapabilityStatement für den E-Rezept-Fachdienst |
| [ ExampleCapabilityStatementServerPU ](CapabilityStatement-example-capabilitystatement-server-pu.md) | - |
| [ ExampleCapabilityStatementServerRU ](CapabilityStatement-example-capabilitystatement-server-ru.md) | - |
| [ ExampleCapabilityStatementServerTU ](CapabilityStatement-example-capabilitystatement-server-tu.md) | - |
| [ ERP CapabilityStatement Environment CodeSystem ](CodeSystem-GEM-ERP-CS-CapabilityStatement-Environment.md) | Dieses CodeSystem definiert standardisierte Umgebungskennzeichen für CapabilityStatements des E-Rezept-Fachdienstes. Es erlaubt die eindeutige Kennzeichnung, ob die beschriebene Fähigkeit für Produktions-, Referenz-, Test- oder Entwicklungsumgebung gilt. |
| [ GEM ERP EX CapabilityStatement Environment ](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Environment.md) | Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren. |
| [ GEM ERP EX CapabilityStatement FDConfiguration ](StructureDefinition-GEM-ERP-EX-CapabilityStatement-FDConfiguration.md) | Diese Extension deklariert eine konkrete Konfigurationsausprägung des E-Rezept-Fachdienstes auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert und bevorzugt gegen GEM_ERP_VS_FDConfiguration geprüft. |
| [ GEM ERP EX CapabilityStatement Feature ](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Feature.md) | Diese Compound-Extension deklariert ein einzelnes Feature eines konkreten Fachdienst-Deployments. Das Teilfeld definition verweist per Canonical auf den fachlichen Feature-Bezeichner (Workflow-Typ oder sonstiges Feature), während value den aktuellen Aktivierungszustand dieses Features am betrachteten Endpoint beschreibt. |
| [ GEM ERP PR CapabilityStatement ](StructureDefinition-GEM-ERP-PR-CapabilityStatement.md) | Dieses Profil beschreibt die Fähigkeiten des E-Rezept-Fachdienstes und definiert die verwendeten CapabilityStatement-Erweiterungen inklusive benannter Slices für Basis-URL, Header, Response-Informationen sowie ERP-spezifische Feature- und Konfigurationskennzeichen. |
| [ ERP CapabilityStatement Environment ValueSet ](ValueSet-GEM-ERP-VS-CapabilityStatement-Environment.md) | Dieses ValueSet enthält alle zulässigen Umgebungskennzeichen für CapabilityStatements des E-Rezept-Fachdienstes und wird für die verpflichtende Kennzeichnung der Zielumgebung verwendet. |
| [ ERP CapabilityStatement Feature ValueSet ](ValueSet-GEM-ERP-VS-CapabilityStatement-Feature.md) | Dieses ValueSet kombiniert Workflow-Typ-Codes aus GEM_ERP_CS_FlowType und nicht-workflowbezogene Feature-Codes aus GEM_ERP_CS_Features. Damit bildet es die vollständige Menge deklarierbarer Feature-Flags für CapabilityStatements des E-Rezept-Fachdienstes ab. |

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
| [ Reject ](OperationDefinition-RejectOperation.md) | Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden. |

**Tabelle:**Operation Definitions

### Parameterprofile für Operationen

| | |
| :--- | :--- |
| [ GEM ERP PR AcceptOperation Output ](StructureDefinition-GEM-ERP-PR-PAR-Accept-Operation-Output.md) | Dieses Profil definiert die Parameter für die Annahme eines Medikaments von AVS zum E-Rezept-Fachdienst. Dies kann für die $accept-Operation verwendet werden. |
| [ GEM ERP PR ActivateOperation Output ](StructureDefinition-GEM-ERP-PR-PAR-Activate-Operation-Output.md) | Dieses Profil definiert die Parameter für die Aktivierung einer Aufgabe von PVS zum E-Rezept-Fachdienst. Dies kann für die $activate-Operation verwendet werden. |
| [ GEM ERP PR CloseOperation Input ](StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Input.md) | Dieses Profil definiert die Parameter für das Schließen eines Workflows für ein Rezept vom AVS zum E-Rezept-Fachdienst. Dies kann für die Operationen $close und $dispense verwendet werden. |
| [ GEM ERP PR CloseOperation Output ](StructureDefinition-GEM-ERP-PR-PAR-Close-Operation-Output.md) | Dieses Profil definiert die Parameter für die Ausgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $close-Operation verwendet werden. |
| [ GEM ERP PR CreateOperation Output ](StructureDefinition-GEM-ERP-PR-PAR-Create-Operation-Output.md) | Dieses Profil definiert die Parameter für die Erstellung einer Aufgabe von PVS zum E-Rezept-Fachdienst. Dies kann für die $create-Operation verwendet werden. |
| [ GEM ERP PR DispenseOperation Input ](StructureDefinition-GEM-ERP-PR-PAR-Dispense-Operation-Input.md) | Dieses Profil definiert die Parameter für die Abgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $dispense-Operation verwendet werden. |

**Tabelle:**Parameterprofile

### Erweiterungen (Extension) Definitions

| | |
| :--- | :--- |
| [ GEM ERP EX AcceptDate ](StructureDefinition-GEM-ERP-EX-AcceptDate.md) | Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt. |
| [ GEM ERP EX AvailabilityState ](StructureDefinition-GEM-ERP-EX-AvailabilityState.md) | Extension zur Angabe von Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit. |
| [ GEM ERP EX Beneficiary ](StructureDefinition-GEM-ERP-EX-Beneficiary.md) | Der Begünstigte (z. B. Apotheke) des E-Rezept-Beleg, der erstellt wird, wenn der E-Rezept-Workflow abgeschlossen ist. |
| [ GEM ERP EX CapabilityStatement Environment ](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Environment.md) | Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren. |
| [ GEM ERP EX CapabilityStatement FDConfiguration ](StructureDefinition-GEM-ERP-EX-CapabilityStatement-FDConfiguration.md) | Diese Extension deklariert eine konkrete Konfigurationsausprägung des E-Rezept-Fachdienstes auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert und bevorzugt gegen GEM_ERP_VS_FDConfiguration geprüft. |
| [ GEM ERP EX CapabilityStatement Feature ](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Feature.md) | Diese Compound-Extension deklariert ein einzelnes Feature eines konkreten Fachdienst-Deployments. Das Teilfeld definition verweist per Canonical auf den fachlichen Feature-Bezeichner (Workflow-Typ oder sonstiges Feature), während value den aktuellen Aktivierungszustand dieses Features am betrachteten Endpoint beschreibt. |
| [ GEM ERP EX EU IS REDEEMABLE BY PATIENT AUTHORIZATION ](StructureDefinition-GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PATIENT-AUTHORIZATION.md) | Extension zur Angabe des Nutzers, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht. |
| [ GEM ERP EX EU IS REDEEMABLE BY PROPERTIES ](StructureDefinition-GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES.md) | Extension zur vom E-Rezept-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht. |
| [ GEM ERP EX ExpiryDate ](StructureDefinition-GEM-ERP-EX-ExpiryDate.md) | Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an. |
| [ GEM ERP EX InsuranceProvider ](StructureDefinition-GEM-ERP-EX-InsuranceProvider.md) | IK-Nummer (Institutionskennzeichen) des Versicherungsträgers, der das angeforderte Medikament abdeckt |
| [ GEM ERP EX LastMedicationDispense ](StructureDefinition-GEM-ERP-EX-LastMedicationDispense.md) | Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt den Zeitstempel der letzten Ausgabe an. |
| [ GEM ERP EX PrescriptionType ](StructureDefinition-GEM-ERP-EX-PrescriptionType.md) | Definiert den Typ eines Rezepts. |
| [ GEM ERP EX SupplyOptionsType ](StructureDefinition-GEM-ERP-EX-SupplyOptionsType.md) | Extension zur Angabe des bevorzugten Versorgungskanals |

**Tabelle:**Extension Definitions

### Beispielinstanzen

**AuditEvent**

* [AuditEvent-Eintrag vom E-Rezept-Fachdienst](AuditEvent-9361863d-fec0-4ba9-8776-7905cf1b0cfa.md)

**Bundle**

* [Beispiel Accept-Bundle](Bundle-Bundle-AcceptOperation.md)

* [Beispielantwort fuer die $accept-Operation](Bundle-ExampleAcceptResponseBundle.md)

* [Quittungs-Bundle für abgeschlossene Rezeptabgabe](Bundle-dffbfd6a-5712-4798-bdc8-07201eb77ab8.md)

* [Antwortbundle fuer GET /AuditEvent](Bundle-example-searchset-auditevent.md)

* [Antwortbundle fuer GET /Communication](Bundle-example-searchset-communication.md)

* [Antwortbundle fuer GET /Consent](Bundle-example-searchset-consent.md)

* [Antwortbundle fuer GET /MedicationDispense](Bundle-example-searchset-medicationdispense.md)

* [Antwortbundle fuer GET /Task](Bundle-example-searchset-task.md)

**CapabilityStatement**

* [Example CapabilityStatement Server PU](CapabilityStatement-example-capabilitystatement-server-pu.md)

* [Example CapabilityStatement Server RU](CapabilityStatement-example-capabilitystatement-server-ru.md)

* [Example CapabilityStatement Server TU](CapabilityStatement-example-capabilitystatement-server-tu.md)

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

**Subscription**

* [Anfrage fuer POST /Subscription](Subscription-example-create-subscription-request.md)

* [Antwort fuer POST /Subscription](Subscription-example-create-subscription-response.md)

**Task**

* [Task angenommen und abgegeben via $dispense Operation](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md)

* [Task abgeschlossen durch Apotheke via $close Operation](Task-TaskInClosedState.md)

* [Task aktiviert durch (Z)PVS/KIS via $activate Operation](Task-TaskInReadyState.md)

* [Task erstellt durch Fachdienst via $create Operation](Task-b12eb5f7-91ce-4887-93c7-800454601377.md)

* [Task angenommen durch Apotheke via $accept Operation](Task-d70932d1-9e1c-483c-b2d4-b7dced09b35e.md)

* [Task mit mehreren MedicationDispenses](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)

