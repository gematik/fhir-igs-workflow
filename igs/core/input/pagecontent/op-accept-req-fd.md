Diese Seite enthält die workflowtyp-übergreifenden normativen Anforderungen an den E-Rezept-Fachdienst für die Operation `$accept`.

Die Rollenprüfung der zugreifenden Institution erfolgt workflowtyp-spezifisch.

<!-- A_19149-02 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-247" title="E-Rezept-Fachdienst - Task akzeptieren - Prüfung Datensatz zwischenzeitlich gelöscht" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept die Operation mit dem HTTP-Fehlercode 410 abbrechen, wenn der referenzierte /Task/&lt;id&gt; existiert, jedoch kein AccessCode im Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode vorhanden ist oder der Status Task.status = cancelled ist, damit die abgebende Institution den Versicherten über die zwischenzeitliche Löschung des Datensatzes in Kenntnis setzen kann.
</requirement>

<!-- A_19167-04 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-248" title="E-Rezept-Fachdienst - Task akzeptieren - Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept den im HTTP-Header "X-AccessCode" oder URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCodeTask.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<!-- ToDo: lässt sich feststellen, wie die AVS den Aufruf nutzen? Wäre es legitim den HTTP-Header abzukündigen? -->

<!-- A_19168-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-249" title="E-Rezept-Fachdienst - Task akzeptieren - Rezept bereits in Abgabe oder Bearbeitung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept die Operation mit dem HTTP-Fehlercode 409 abbrechen, wenn der StatusTask.status = "completed", Task.status = "in-progress" oder Task.status = "draft" ist, damit ein bereits in Abgabe befindliches oder beliefertes E-Rezept nicht durch eine zweite Apotheke bearbeitet werden kann. Im OperationOutcome werden weitere Informationen gegeben: "Task has invalid status completed", "Task has invalid status in-progress" bzw. "Task has invalid status draft". <br>
    Der E-Rezept-Fachdienst MUSS in OperationOutcome zusätzlich die Information "Task is processed by requesting institution" ergänzen, wenn Task.status = "in-progress" und die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI mit der Telematik-ID aus dem ACCESS_TOKEN übereinstimmt.
</requirement>

Hinweis: Die Informationen in OperationOutcome werden ggf. als mehrere Strings in einem Array übermittelt.

<!-- A_23539-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-250" title="E-Rezept-Fachdienst - Task akzeptieren - Ende Einlösefrist prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept die Operation mit dem Fehlercode 403 abbrechen, wenn das Ende der Einlösefrist (Task.ExpiryDate) zu einem früherem Zeitpunkt als das aktuelle Datum liegt, da Verordnungen nur bis Ende der Einlösefrist abgerufen werden dürfen. Im Falle dieses Fehlers ist im OperationOutcome des Response das Ende der Einlösefrist wie folgt anzugeben: "Verordnung bis &lt;Datum&gt; einlösbar.", wobei &lt;Datum&gt; der Wert Task.ExpiryDate im Format "dd.mm.yyyy" ist.
</requirement>

<!-- A_19169-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-251" title="E-Rezept-Fachdienst - Task akzeptieren - Generierung Secret, Statuswechsel in Abgabe und Rückgabewert" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept den Status des Tasks auf Task.status = "in-progress" setzen, eine 256 Bit Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden Task als externe ID in Task.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret hinzufügen und den Task im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurückgeben, damit das E-Rezept für die nachfolgende Bearbeitung durch den abrufenden Apotheker reserviert ist.
</requirement>

<!-- A_24174-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-252" title="E-Rezept-Fachdienst - Task akzeptieren - Telematik-ID der abgebenden Institution speichern" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept für den referenzierten Task die Telematik-ID aus dem ACCESS_TOKEN in Task.owner speichern, damit sichergestellt werden kann, dass nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte erfolgen kann.
</requirement>

Die Telematik-ID ist im Task wie folgt zu hinterlegen:
- Task.owner.identifier.system= "https://gematik.de/fhir/sid/telematik-id"
- Task.owner.identifier.value= $Telematik-ID der Apotheke gemäß https://simplifier.net/basisprofil-de-r4/identifiertelematikid

<!-- A_28127 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-253" title="E-Rezept-Fachdienst - Task akzeptieren - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task mittels HTTP-POST-Operation über /Task/&lt;id&gt;/$accept bei erfolgreichem Abschluss der Operation den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.accept" und den Versicherten mit der KVNR = Task.for initiieren.
</requirement>