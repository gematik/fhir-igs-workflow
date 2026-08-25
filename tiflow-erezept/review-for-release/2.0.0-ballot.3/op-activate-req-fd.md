# FD-Anforderungen $activate - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $activate (Task aktivieren)**](op-activate.md)
* **FD-Anforderungen $activate**

## FD-Anforderungen $activate

Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob die QES gemäß der professionOID des Signaturzertifikats von einer Berufsgruppe ausgestellt wurde, die einer der folgenden professionOID entspricht:
* oid_arzt
* oid_zahnarzt
und bei einer Abweichung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von Medikamenten ermächtigt sind.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 166 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, dass die QES gemäß der professionOID des Signaturzertifikats von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht:
* oid_arzt
und bei einer Abweichung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von T-Rezepten ermächtigt sind.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 160, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 00 enthalten ist, und andernfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_FLOWTYPE_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: Für diesen Workflowtypen sind nur Arzneimittelverordnungen zulässig

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 166 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 02 enthalten ist, und andernfalls die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_FLOWTYPE_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: Für diesen Workflowtypen sind nur T-Rezept Verordnungen zulässig

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate die Validierung von strukturierten Dosierungen anwenden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 160 oder 169 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob Coverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_COVERAGE_TYPE_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_COVERAGE_TYPE_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.

funkt. Eignung: HerstellererklärungDer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn der übergebene QES-Datensatz als Betäubungsmittel-Verordnung (Bundle.Medication.extension:KBV_EX_ERP_Medication_Category:code gleich "01") gekennzeichnet ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_DRUG_CATEGORY_FORBIDDEN
* HTTP-Code: Details Text
  * 400 - Bad Request: BTM nicht zulässig

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den Wert für Task.extension:eu-isRedeemableByProperties auf "true" setzen, wenn:
* Task.extension:flowType = 160 oder 200 und
* MedicationRequests.medication vom Typ KBV_PR_ERP_Medication_PZN.
Andernfalls ist der Wert der Extension auf "false" zu setzen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 160, 166, 169, 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate bei erfolgreichem Abschluss der Operation, die Daten des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.
### Prozessparamter

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei einem Task mit Task.flowType = 160 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_004 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Apothekenpflichtige Arzneimittel"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.AcceptDate = >Datum der QES.Erstellung im Signaturobjekt> + 28 Kalendertagesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.AcceptDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage

**Tabelle: **TAB_eRpDM_004 Prozessparameter Flowtype 160

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei einem Task mit Task.flowType = 166 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_006 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Arzneimittel nach § 3a AMVV"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 6 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 6 Kalendertage

**Tabelle: **TAB_eRpDM_006 Prozessparameter Flowtype 166

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei einem Task mit Task.flowType = 169 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_007 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Workflow-Steuerung durch Leistungserbringer"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.AcceptDate = >Datum der QES.Erstellung im Signaturobjekt> + 28 Kalendertagesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.AcceptDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage

**Tabelle: **TAB_eRpDM_007 Prozessparameter Flowtype 169

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei einem Task mit Task.flowType = 200 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_008 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Apothekenpflichtige Arzneimittel (PKV)"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.AcceptDate = >Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.AcceptDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage

**Tabelle: **TAB_eRpDM_008 Prozessparameter Flowtype 200

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei einem Task mit Task.flowType = 209 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_009 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.54"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Öffentliche Apotheke"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Workflow-Steuerung durch Leistungserbringer (PKV)"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.ExpiryDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.ExpiryDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage
* Feld in Task: Task.AcceptDate
  * Feldbelegung: wenn MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false:Task.AcceptDate = >Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonatesonstwenn MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end angegebenTask.AcceptDate = MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.endsonstTask.AcceptDate = <Datum der QES.Erstellung im Signaturobjekt> + 365 Kalendertage

**Tabelle: **TAB_eRpDM_007 Prozessparameter Flowtype 209

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS nach der Feststellung der Prozessparametern die folgenden Parameter mit abweichenden Werten belegen:
* Task.AcceptDate = <Datum der QES.ErstellungBundle.signature.when> + 2 Werktage (Montag bis Samstag, ausgenommen bundeseinheitliche Feiertage) (Abweichende Regelungen durch denGemeinsamen Bundesausschuss (G-BA) sind zu beachten.)
wenn das in der http-POST-Operation /Task/<id>/$activate übergebene, gültig signierte E-Rezept-Bundle in der Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition den code="04" oder "14" des Code-Systems https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_STATUSKENNZEICHEN ("Entlassmanagement-Kennzeichen") enthält und die übrigen Prozessparameter unverändert übernehmen, damit der Prozess für das E-Rezept mit den abweichenden Festlegungen für das Entlassrezept gemäß Arzneimittelrichtlinie [AM-RL] umgesetzt wird.
### Verifizieren von Prüfziffern

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im FHIR Profil KBV_PR_ERP_Medication_PZN gespeicherten Wert für code.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_PZN_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln.

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate den im FHIR Profil KBV_PR_ERP_Medication_Compounding gespeicherten Wert für ingredient.item[x]:itemCodeableConcept.coding:pznCode.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren, und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_PZN_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln.

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate, wenn die PZN einer übergebenen PZN-Verordnung in KBV_PR_ERP_Medication_PZN.code.coding.code nicht 8-stellig ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_PZN_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Länge PZN unzulässig (muss 8-stellig sein)

abbrechen.
### Prüfung von Mehrfachverordnungen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Flowtype ungleich 160, 169, 200 oder 209 ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_FLOWTYPE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, weil Mehrfachverordnungen nur für die Verordnungen von apothekenpflichtigen Arzneimittel (kein BtM, kein T-Rezept) zulässig sind.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator oder Denominator größer als 4 ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, weil eine Mehrfachverordnungen aus maximal 4 Teilverordnungen bestehen darf.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator kleiner als 1 ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Denominator kleiner als 2 ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, weil eine Mehrfachverordnungen aus mindestens 2 Teilverordnungen bestehen muss.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator größer als der Denominator ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung nicht als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false) gekennzeichnet ist, aber eine Extension Nummerierung oder Zeitraum enthält, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, weil normale Verordnungen keine MVO-Angaben enthalten dürfen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Entlassrezept ( code="04" oder "14" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, weil für Entlassrezepte keine Mehrfachverordnungen zulässig sind.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Ersatzverordnung ( code="10" oder "11" oder "17" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, weil für Ersatzverordnungen keine Mehrfachverordnungen zulässig sind.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) nicht angegeben ist, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_STARTDATE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, weil die Information des Beginns der Einlösefrist notwendig ist, um den Gültigkeitszeitraum zu ermitteln.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und das Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) vor dem Ausstellungsdatum (MedicationRequest.authoredOn) liegt, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_STARTDATE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet, ein Endedatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end) angegeben ist und das Endedatum vor dem Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) liegt, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_ENDDATE_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen und, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der dazugehörige value (MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value) nicht dem Schema aus [KBV_ITA_VGEX_Technische_Anlage_ERP] entspricht, die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_MVO_ID_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen.

