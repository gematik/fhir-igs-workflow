# Anforderungen an den TI-Flow-Fachdienst für die $activate-Operation - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $activate**](op-activate.md)
* **Anforderungen an den TI-Flow-Fachdienst für die $activate-Operation**

## Anforderungen an den TI-Flow-Fachdienst für die $activate-Operation

Diese Seite enthält die normativen Anforderungen an den Fachdienst für die Operation `$activate`.

### Anforderungen aus der Core Spezifikation

Für diese Schnittstelle gelten die Anforderungen aus der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/tiflow/2.0.0-ballot.3/menu-schnittstellen-operation-api.html)

### Modulspezifische Anforderungen

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 162 mittels HTTP-POST-Operation über /Task/<id>/$activate, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die einer der folgenden professionOID entspricht:
* oid_arzt
* oid_zahnarzt
* oid_psychotherapeut
* oid_ps_psychotherapeut
* oid_kuj_psychotherapeut
die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, damit nur solche Leistungserbringer eine signierte Verordnung einstellen, die zur Verordnung von DiGAs ermächtigt sind.


funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 162 mittels HTTP-POST-Operation über /Task/<id>/$activate den im FHIR Profil KBV_PR_EVDGA_HealthAppRequest gespeicherten Wert für .code[x]:codeCodeableConcept.coding.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren und bei einer fehlerhaften Prüfung die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_EREZEPT_PZN_INVALID
* HTTP-Code: Details Text
  * 400 - Bad Request: Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln.

abbrechen.


funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 162 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, dass Coverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_COVERAGE_TYPE_MISMATCH
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, um sicherzustellen, dass diese Workflows nicht für Verordnungen für PKV-Versicherte genutzt werden.

 

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Zugriff auf einen Task mit Flowtype 162 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob die Extension Coverage.payor.identifier.extension:alternativeID vorhanden ist und in diesem Fall die Operation mit dem folgenden Fehler:

* HTTP-Code: Severity
  * 400 - Bad Request: error
* HTTP-Code: Code
  * 400 - Bad Request: invalid
* HTTP-Code: Details Code
  * 400 - Bad Request: TIFLOW_ALTERNATIVE_IK_FORBIDDEN
* HTTP-Code: Details Text
  * 400 - Bad Request: -

abbrechen, um sicherzustellen, dass dieser Workflow nicht für Verordnungen genutzt wird, die zu Lasten von Unfallkassen oder Berufsgenossenschaften gehen.
Dieser Ausschluss erfolgt temporär. In einer späteren Version können Unfallkassen das Verordnen von DiGAs explizit unterstützen. Die konkreten Festlegungen dazu werden in einem Folgerelease getroffen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei einem Task mit Task.flowType = 162 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte Verordnungs-Bundle gemäß TAB_eRpDM_005 belegen.

* Feld in Task: Task.performerType.coding.system
  * Feldbelegung: "https://gematik.de/fhir/erp/CodeSystemGEM_ERP_CS_OrganizationType"
* Feld in Task: Task.performerType.coding.code
  * Feldbelegung: "1.2.276.0.76.4.59"
* Feld in Task: Task.performerType.coding.diplay
  * Feldbelegung: "Kostenträger"
* Feld in Task: Task.PrescriptionType.valueCoding.display
  * Feldbelegung: "Flowtype für Digitale Gesundheitsanwendungen"
* Feld in Task: Task.ExpiryDate
  * Feldbelegung: <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonate
* Feld in Task: Task.AcceptDate
  * Feldbelegung: <Datum der QES.Erstellung im Signaturobjekt> + 3 Kalendermonate

**Tabelle: **TAB_eRpDM_005 Prozessparameter Flowtype 162

