Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$close`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

<!-- A_19231-02 -->
<requirement conformance="SHALL" key="IG-TIFlow-RX-29" title="E-Rezept-Fachdienst - Task schließen - Prüfung Secret" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Beenden eines Tasks mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$close das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = "in-progress" prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>


