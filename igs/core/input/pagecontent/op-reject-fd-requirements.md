Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$reject`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch. 

<!-- A_19171-03 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Task zurückweisen - Prüfung Secret" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject das im URL-Parameter "?secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte Secret Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret und auf Task.status = in-progress prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch den Berechtigten in Kenntnis des Secrets erfolgt.
</requirement>

<!-- A_19172-01 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Task zurückweisen - Secret löschen und Status setzen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject die externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret löschen und den Status des referenzierten Tasks auf Task.status = ready setzen, damit nachfolgende Zugriffe auf diesen Datensatz durch Berechtigte in Kenntnis des AccessCodes erfolgen können.
</requirement>

<!-- A_24175 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Task zurückweisen - Telematik-ID der abgebenden LEI löschen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI löschen.
</requirement>

<!-- A_28128 -->
<requirement conformance="SHALL" key="IG-WF-CORE-83" title="E-Rezept-Fachdienst - Task zurückweisen - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&#60;id&#62;/$reject bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.reject" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>

