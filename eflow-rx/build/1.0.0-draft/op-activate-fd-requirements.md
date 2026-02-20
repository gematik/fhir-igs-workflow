# FD-Anforderungen $activate - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* [**Operation $activate (Task aktivieren)**](op-activate.md)
* **FD-Anforderungen $activate**

## FD-Anforderungen $activate

# FD-Anforderungen: Operation $activate

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die Operation `$activate`.

Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 160, 169, 200 oder 209 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemaess der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt, oid_zahnarzt, damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von Medikamenten ermaechtigt sind.

Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 166 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemaess der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt, damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von T-Rezepten ermaechtigt sind.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtypen 160, 169, 200 oder 209 mittels $activate pruefen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 00 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Fuer diesen Workflowtypen sind nur Arzneimittelverordnungen zulaessig" ausgeben.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtyp 166 mittels $activate pruefen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 02 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Fuer diesen Workflowtypen sind nur T-Rezept Verordnungen zulaessig" ausgeben.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 160, 162 oder 169 mittels HTTP-POST-Operation ueber /Task/{id}/$activate pruefen, ob Coverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht fuer E-Rezepte fuer PKV-Versicherte genutzt werden.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation ueber /Task/{id}/$activate pruefen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur fuer E-Rezepte fuer PKV-Versicherte genutzt werden.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf den Ausschluss von Betaeubungsmittel ("BTM nicht zulaessig" im OperationOutcome) abbrechen, wenn der uebergebene QES-Datensatz als Betaeubungsmittel-Verordnung (Bundle.Medication.extension:KBV_EX_ERP_Medication_Category:code gleich "01") gekennzeichnet ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks aus dem Feld Task.performerType die Prozessparameter des Tasks gemaess [gemSpec_DM_eRp#19445] ableiten und befuellen.

Der E-Rezept-Fachdienst MUSS im Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/{id}/$activate die KVNR des Patienten dem Identifier http://fhir.de/sid/gkv/kvid-10 der Patient-Ressource im E-Rezept-Bundle entnehmen und diesen als Identifier in Task.for mit system http://fhir.de/sid/gkv/kvid-10 hinzufuegen, damit ausschliesslich eine gueltige, vom Arzt signierte Patientenreferenz im Workflow verwendet wird.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks den Wert fuer Task.extension:eu-isRedeemableByProperties auf "true" setzen, wenn Task.extension:flowType = 160 oder 200 und MedicationRequests.medication vom Typ KBV_PR_ERP_Medication_PZN. Andernfalls ist der Wert der Extension auf "false" zu setzen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /Task/{id}/$activate bei erfolgreichem Abschluss der Operation die Daten des Verordnungsdatensatzes fuer die Uebermittlung in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation ueber /Task/{id}/$activate bei erfolgreichem Abschluss der Operation den Push Notification Prozess fuer den Trigger mit der ChannelId "erp.task.activate" und den Versicherten mit der KVNR = Task.for initiieren.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Flowtype ungleich 160, 169, 200 oder 209 ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet und der Numerator oder Denominator groesser als 4 ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet und der Numerator kleiner als 1 ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet und der Denominator kleiner als 2 ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet und der Numerator groesser als der Denominator ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung nicht als Mehrfachverordnung gekennzeichnet ist, aber eine Extension Nummerierung oder Zeitraum enthaelt.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung und als Entlassrezept gekennzeichnet ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung und als Ersatzverordnung gekennzeichnet ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet ist und der Beginn der Einloesefrist nicht angegeben ist.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet ist und das Startdatum vor dem Ausstellungsdatum (MedicationRequest.authoredOn) liegt.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet ist, ein Endedatum angegeben ist und das Endedatum vor dem Startdatum liegt.

Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation ueber /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet ist und der dazugehoerige Identifier-Wert nicht dem Schema aus [KBV_ITA_VGEX_Technische_Anlage_ERP] entspricht.

