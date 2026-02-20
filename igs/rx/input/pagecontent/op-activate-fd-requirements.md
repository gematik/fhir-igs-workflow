# FD-Anforderungen: Operation `$activate`

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-100" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - QES durch berechtigte Berufsgruppe (A_19225-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 160, 169, 200 oder 209 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt, oid_zahnarzt, damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von Medikamenten ermächtigt sind.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-101" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - QES durch berechtigte Berufsgruppe (A_27812)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 166 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt, damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von T-Rezepten ermächtigt sind.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-102" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - Prüfung Arzneimittelverordnung (A_25642)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtypen 160, 169, 200 oder 209 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 00 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur Arzneimittelverordnungen zulässig" ausgeben.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-103" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - Prüfung Arzneimittelverordnung (A_27813)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtyp 166 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 02 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur T-Rezept Verordnungen zulässig" ausgeben.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-104" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/162/169 - Prüfung Coverage Type (A_23443-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 160, 162 oder 169 mittels HTTP-POST-Operation über /Task/{id}/$activate prüfen, ob Coverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-105" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 200/209 - Prüfung Coverage Type (A_22347-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/{id}/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-106" title="E-Rezept-Fachdienst - Task aktivieren - Ausschluss Betäubungsmittel (A_22231-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf den Ausschluss von Betäubungsmittel ("BTM nicht zulässig" im OperationOutcome) abbrechen, wenn der übergebene QES-Datensatz als Betäubungsmittel-Verordnung (Bundle.Medication.extension:KBV_EX_ERP_Medication_Category:code gleich "01") gekennzeichnet ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-107" title="E-Rezept-Fachdienst - Ergänzung PerformerTyp für Einlöseinstitutstyp (A_19999)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks aus dem Feld Task.performerType die Prozessparameter des Tasks gemäß [gemSpec_DM_eRp#19445] ableiten und befuellen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-108" title="E-Rezept-Fachdienst - Task aktivieren - Übernahme der KVNR des Patienten (A_19127-03)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS im Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/{id}/$activate die KVNR des Patienten dem Identifier http://fhir.de/sid/gkv/kvid-10 der Patient-Ressource im E-Rezept-Bundle entnehmen und diesen als Identifier in Task.for mit system http://fhir.de/sid/gkv/kvid-10 hinzufuegen, damit ausschließlich eine gültige, vom Arzt signierte Patientenreferenz im Workflow verwendet wird.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-109" title="E-Rezept-Fachdienst - Task aktivieren - Bestimmung der Einlösbarkeit im EU-Ausland (A_27768)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks den Wert für Task.extension:eu-isRedeemableByProperties auf "true" setzen, wenn Task.extension:flowType = 160 oder 200 und MedicationRequests.medication vom Typ KBV_PR_ERP_Medication_PZN. Andernfalls ist der Wert der Extension auf "false" zu setzen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-110" title="E-Rezept-Fachdienst - Task aktivieren - Daten ePA Medication Service bereitstellen (Verordnungsdatensatz) (A_25925)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /Task/{id}/$activate bei erfolgreichem Abschluss der Operation die Daten des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-111" title="E-Rezept-Fachdienst - Task aktivieren - Push Notification Versicherter (A_28126)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/{id}/$activate bei erfolgreichem Abschluss der Operation den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.activate" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-112" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - zulässige Flowtype (A_22627-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Flowtype ungleich 160, 169, 200 oder 209 ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-113" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator-Denominator kleiner 5 (A_22628)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet und der Numerator oder Denominator groesser als 4 ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-114" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator groesser 0 (A_22704)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet und der Numerator kleiner als 1 ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-115" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Denominator groesser 1 (A_22629)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet und der Denominator kleiner als 2 ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-116" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator kleiner / gleich Denominator (A_22630)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet und der Numerator groesser als der Denominator ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-117" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Unzulässige Angaben (A_22631)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung nicht als Mehrfachverordnung gekennzeichnet ist, aber eine Extension Nummerierung oder Zeitraum enthält.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-118" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - kein Entlassrezept (A_22632)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung und als Entlassrezept gekennzeichnet ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-119" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - keine Ersatzverordnung (A_22633)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung und als Ersatzverordnung gekennzeichnet ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-120" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Beginn Einlösefrist-Pflicht (A_22634)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet ist und der Beginn der Einlösefrist nicht angegeben ist.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-121" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Startdatum nicht vor Ausstellungsdatum (A_23537)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet ist und das Startdatum vor dem Ausstellungsdatum (MedicationRequest.authoredOn) liegt.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-122" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Endedatum nicht vor Startdatum (A_23164)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet ist, ein Endedatum angegeben ist und das Endedatum vor dem Startdatum liegt.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-123" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Schema ID (A_24901)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/{id}/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung gekennzeichnet ist und der dazugehoerige Identifier-Wert nicht dem Schema aus [KBV_ITA_VGEX_Technische_Anlage_ERP] entspricht.
</requirement>

