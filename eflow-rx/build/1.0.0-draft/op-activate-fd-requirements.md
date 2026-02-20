# Server-Anforderungen $activate - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $activate (Task aktivieren)**](op-activate.md)
* **Server-Anforderungen $activate**

## Server-Anforderungen $activate

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.

Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 160, 169, 200 oder 209 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt oid_zahnarzt damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von Medikamenten ermächtigt sind.

Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 166 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von T-Rezepten ermächtigt sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtypen 160,169,200 oder 209 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 00 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur Arzneimittelverordnungen zulässig" ausgeben.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtyp 166 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 02 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur T-Rezept Verordnungen zulässig" ausgeben.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 160 oder 169 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob Coverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf den Ausschluss von Betäubungsmittel ("BTM nicht zulässig" im OperationOutcome) abbrechen, wenn der übergebene QES-Datensatz als Betäubungsmittel-Verordnung (Bundle.Medication.extension:KBV_EX_ERP_Medication_Category:code gleich "01") gekennzeichnet ist.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /Task/<id>/$activate bei erfolgreichem Abschluss der Operation, die Daten des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Flowtype ungleich 160, 169, 200 oder 209 ist, weil Mehrfachverordnungen nur für die Verordnungen von apothekenpflichtigen Arzneimittel (kein BtM, kein T-Rezept) zulässig sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator oder Denominator größer als 4 ist, weil eine Mehrfachverordnungen aus maximal 4 Teilverordnungen bestehen darf.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator kleiner als 1 ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Denominator kleiner als 2 ist, weil eine Mehrfachverordnungen aus mindestens 2 Teilverordnungen bestehen muss.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator größer als der Denominator ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung nicht als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false) gekennzeichnet ist, aber eine Extension Nummerierung oder Zeitraum enthält, weil normale Verordnungen keine MVO-Angaben enthalten dürfen.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Entlassrezept ( code="04" oder "14" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, weil für Entlassrezepte keine Mehrfachverordnungen zulässig sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Ersatzverordnung ( code="10" oder "11" oder "17" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, weil für Ersatzverordnungen keine Mehrfachverordnungen zulässig sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) nicht angegeben ist, weil die Information des Beginns der Einlösefrist notwendig ist, um den Gültigkeitszeitraum zu ermitteln.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und das Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) vor dem Ausstellungsdatum (MedicationRequest.authoredOn) liegt.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet, ein Endedatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end) angegeben ist und das Endedatum vor dem Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) liegt.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/<id>/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der dazugehörige value (MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value) nicht dem Schema aus [KBV_ITA_VGEX_Technische_Anlage_ERP] entspricht.

