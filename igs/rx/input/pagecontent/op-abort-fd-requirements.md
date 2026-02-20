Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$abort`.

<requirement conformance="SHALL" key="IG-TIFlow-RX-372" title="E-Rezept-Fachdienst - E-Rezept löschen - Flowtype 169 / 209 - Versicherter - Statusprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS das Löschen eines E-Rezepts mit dem Flowtype 169 oder 209 über den mittels der &lt;id&gt; adressierten /Task/&lt;id&gt;/$abort verhindern und die Operation mit dem HTTP-Fehlercode 403 abweisen, wenn der Status des adressierten Tasks ungleich "completed" ist und die Rolle des aufrufenden Nutzers der folgenden Rollen entspricht: oid_versicherter damit kein Versicherter ein E-Rezept aus einem Workflow mit Workflowsteuerung durch Leistungserbringer (169, 209) löscht, das nicht bereits beliefert wurde.
    </Beschreibung>
    <!-- A_22102-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-373" title="E-Rezept-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Leistungserbringerinstitution" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/&lt;id&gt;/$abort durch eine verordnende oder abgebende Leistungserbringerinstitution die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.
    </Beschreibung>
    <!-- A_25930 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-374" title="E-Rezept-Fachdienst - E-Rezept löschen - Löschinformation ePA Medication Service bereitstellen (Verordnungsdatensatz) - Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Löschen eines E-Rezepts mittels POST /Task/$abort durch einen Versicherten, wenn Task.status = ready, die Daten für die Löschinformation des Verordnungsdatensatzes für die Übermittlung in den ePA Medication Service bereitstellen.
    </Beschreibung>
    <!-- A_25931 -->
</requirement>
