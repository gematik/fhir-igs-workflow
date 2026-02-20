Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$activate`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-352" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - QES durch berechtigte Berufsgruppe" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 160, 169, 200 oder 209 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt oid_zahnarzt damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von Medikamenten ermächtigt sind.
    </Beschreibung>
    <!-- A_19225-02 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-353" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - QES durch berechtigte Berufsgruppe" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS die Aktivierung eines Tasks mit Flowtype 166 mit dem HTTP-Status-Code 400 abbrechen, wenn die QES gemäß der professionOID des Signaturzertifikats des Signierenden nicht von einer Berufsgruppe ausgestellt wurde, die der folgenden professionOID entspricht: oid_arzt damit nur solche Leistungserbringer ein signiertes E-Rezept einstellen, die zur Verordnung von T-Rezepten ermächtigt sind.
    </Beschreibung>
    <!-- A_27812 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-354" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 160/169/200/209 - Prüfung Arzneimittelverordnung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtypen 160,169,200 oder 209 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 00 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur Arzneimittelverordnungen zulässig" ausgeben.
    </Beschreibung>
    <!-- A_25642 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-355" title="E-Rezept-Fachdienst - Task aktivieren - Flowtype 166 - Prüfung Arzneimittelverordnung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mit Workflowtyp 166 mittels $activate prüfen, dass im Bundle eine MedicationRequest-Ressource und eine Medication mit Medication.extension:Arzneimittelkategorie = 02 enthalten ist. Der E-Rezept-Fachdienst MUSS andernfalls mit dem HTTP-Fehlercode 400 abbrechen und in der OperationOutcome den Fehlertext "Für diesen Workflowtypen sind nur T-Rezept Verordnungen zulässig" ausgeben.
    </Beschreibung>
    <!-- A_27813 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-356" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 160/169 - Prüfung Coverage Type" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Task des Flowtype Task.extension:flowType = 160 oder 169 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate prüfen, ob Coverage.type.coding.code nicht mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nicht für E-Rezepte für PKV-Versicherte genutzt werden.
    </Beschreibung>
    <!-- A_23443-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-357" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 200/209 - Prüfung Coverage Type" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.
    </Beschreibung>
    <!-- A_22347-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-358" title="E-Rezept-Fachdienst - Task aktivieren - Ausschluss Betäubungsmittel" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 und einem Hinweis auf den Ausschluss von Betäubungsmittel ("BTM nicht zulässig" im OperationOutcome) abbrechen, wenn der übergebene QES-Datensatz als Betäubungsmittel-Verordnung (Bundle.Medication.extension:KBV_EX_ERP_Medication_Category:code gleich "01") gekennzeichnet ist.
    </Beschreibung>
    <!-- A_22231-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-359" title="E-Rezept-Fachdienst - Task aktivieren - Daten ePA Medication Service bereitstellen (Verordnungsdatensatz)" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /Task/&lt;id&gt;/$activate bei erfolgreichem Abschluss der Operation, die Daten des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.
    </Beschreibung>
    <!-- A_25925 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-360" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - zulässige Flowtype" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Flowtype ungleich 160, 169, 200 oder 209 ist, weil Mehrfachverordnungen nur für die Verordnungen von apothekenpflichtigen Arzneimittel (kein BtM, kein T-Rezept) zulässig sind.
    </Beschreibung>
    <!-- A_22627-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-361" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator-Denominator kleiner 5" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator oder Denominator größer als 4 ist, weil eine Mehrfachverordnungen aus maximal 4 Teilverordnungen bestehen darf.
    </Beschreibung>
    <!-- A_22628 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-362" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator größer 0" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator kleiner als 1 ist.
    </Beschreibung>
    <!-- A_22704 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-363" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Denominator größer  1" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Denominator kleiner als 2 ist, weil eine Mehrfachverordnungen aus mindestens 2 Teilverordnungen bestehen muss.
    </Beschreibung>
    <!-- A_22629 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-364" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Numerator kleiner / gleich Denominator" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet und der Numerator größer als der Denominator ist.
    </Beschreibung>
    <!-- A_22630 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-365" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Unzulässige Angaben" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung nicht als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = false) gekennzeichnet ist, aber eine Extension Nummerierung oder Zeitraum enthält, weil normale Verordnungen keine MVO-Angaben enthalten dürfen.
    </Beschreibung>
    <!-- A_22631 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-366" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - kein Entlassrezept" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Entlassrezept ( code="04" oder "14" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, weil für Entlassrezepte keine Mehrfachverordnungen zulässig sind.
    </Beschreibung>
    <!-- A_22632 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-367" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - keine Ersatzverordnung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) und als Ersatzverordnung ( code="10" oder "11" oder "17" in Extension https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis in Bundle.Composition.extention:rechtsgrundlage) gekennzeichnet ist, weil für Ersatzverordnungen keine Mehrfachverordnungen zulässig sind.
    </Beschreibung>
    <!-- A_22633 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-368" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Beginn Einlösefrist-Pflicht" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) nicht angegeben ist, weil die Information des Beginns der Einlösefrist notwendig ist, um den Gültigkeitszeitraum zu ermitteln.
    </Beschreibung>
    <!-- A_22634 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-369" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Startdatum nicht vor Ausstellungsdatum" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und das Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) vor dem Ausstellungsdatum (MedicationRequest.authoredOn) liegt.
    </Beschreibung>
    <!-- A_23537 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-370" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Endedatum nicht vor Startdatum" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet, ein Endedatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.end) angegeben ist und das Endedatum vor dem Startdatum (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) liegt.
    </Beschreibung>
    <!-- A_23164 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-371" title="E-Rezept-Fachdienst - Task aktivieren - Mehrfachverordnung - Schema ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$activate die Operation mit dem Fehlercode 400 abbrechen, wenn die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist und der dazugehörige value (MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]:valueIdentifier.value) nicht dem Schema aus [KBV_ITA_VGEX_Technische_Anlage_ERP] entspricht.
    </Beschreibung>
    <!-- A_24901 -->
</requirement>
