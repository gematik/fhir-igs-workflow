Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$close`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-386" title="E-Rezept-Fachdienst - Task schließen - Flowtype 160/166/169/200/209 - Profilprüfung MedicationDispense" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks für ein E-Rezept mittels HTTP-POST/$close-Operation auf den in der URL referenzierten /Task/&lt;id&gt; mit Flowtype 160, 166, 169, 200, oder 209 sicherstellen, dass das in GEM_ERP_PR_PAR_CloseOperation_Input enthaltene MedicationDispense-Objekt dem Profil GEM_ERP_PR_MedicationDispense entspricht. Andernfalls ist die Operation mit einem Fehler abzubrechen, und im OperationOutcome muss der Text "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für Arzneimittel zulässig." zurückgegeben werden.
    </Beschreibung>
    <!-- A_26002-02 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-387" title="E-Rezept-Fachdienst - Task schließen - T-Rezept Daten an BfArM Webdienst bereitstellen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels /Task/&lt;id&gt;/$close mit Flowtype 166, wenn die Operation erfolgreich abgeschlossen werden kann, die Daten des digitalen Durchschlags E-T-Rezept dem BfArM Webdienst bereitstellen.
    </Beschreibung>
    <!-- A_27814 -->
</requirement>
