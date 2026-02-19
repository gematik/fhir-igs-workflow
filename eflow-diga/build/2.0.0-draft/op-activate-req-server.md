# Anforderungen an den E-Rezept-Fachdienst für die $activate-Operation - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](operation-api.md)
* [**Operation: $activate**](op-activate.md)
* **Anforderungen an den E-Rezept-Fachdienst für die $activate-Operation**

## Anforderungen an den E-Rezept-Fachdienst für die $activate-Operation

Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 162 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht:
* oid_arzt
* oid_zahnarzt
* oid_psychotherapeut
* oid_ps_psychotherapeut
* oid_kuj_psychotherapeut
damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von DiGAs ermächtigt sind.


Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Flowtype 162 mittels $activate prüfen, dass im Bundle eine
*DeviceRequest*-Ressource und in der </i>Composition.type.coding.code=e16D</i> enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der
*OperationOutcome*den Fehlertext "Für diesen Workflowtypen sind nur Verordnungen für Digitale Gesundheitsanwendungen zulässig" ausgeben.


Der E-Rezept-Fachdienst MUSS beim Aufruf der http-POST-Operation /Task/<id>/$activate den im FHIR Profil KBV_PR_EVDGA_HealthAppRequest gespeicherten Wert für .code[x]:codeCodeableConcept.coding.code gemäß den "Technischen Hinweisen zur PZN-Codierung - Prüfziffernberechnungen der PZN, PPN und Basic UDI-DI" beschriebenen Prüfalgorithmus validieren.

Der E-Rezept-Fachdienst MUSS bei einer fehlerhaften Prüfung mit einem Http-Fehler 400 (Bad Request) abbrechen, sowie die Fehlermeldung "Ungültige PZN: Die übergebene Pharmazentralnummer entspricht nicht den vorgeschriebenen Prüfziffer-Validierungsregeln." in Form eines OperationOutcome ausliefern.


Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 162 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, obCoverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.


Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 162 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob die Extension Coverage.payor.identifier.extension:alternativeID vorhanden ist und in diesem Fall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass dieser Workflow nicht für Verordnungen genutzt wird, die zu Lasten von Unfallkassen oder Berufsgenossenschaften gehen.
Dieser Ausschluss erfolgt temporär. In einer späteren Version können Unfallkassen das Verordnen von DiGAs explizit unterstützen. Die konkreten Festlegungen dazu werden in einem Folgerelease getroffen.

Der E-Rezept-Fachdienst MUSS bei einem Task mit Task.flowType = 162 die Attribute in Task in Abhängigkeit des in der http-POST-Operation /Task/<id>/$activate übergebenen gültig signierte E-Rezept-Bundle gemäß TAB_eRpDM_005 belegen.

**TAB_eRpDM_005 Prozessparameter Flowtype 162**

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

