# FD-Anforderungen: Query API Task

<requirement conformance="SHALL" key="IG-TIFlow-RX-336" title="E-Rezept-Fachdienst - Task abrufen - Rollenprüfung Versicherter oder Apotheke liest Rezepte" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task sicherstellen, dass ausschließlich Versicherte und Leistungserbringer in der Rolle oid_versicherter oid_oeffentliche_apotheke oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
    </Beschreibung>
    <!-- A_21558-02 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-337" title="E-Rezept-Fachdienst - Task abrufen - Filter Tasks auf KVNR des Versicherten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task die dem Versicherten zugeordneten Task-Ressourcen anhand der KVNR des Versicherten aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in Task.for die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen E-Rezepte einsehen können.
    </Beschreibung>
    <!-- A_19115-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-338" title="E-Rezept-Fachdienst - Rückgabe Tasks im Bundle Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task die gültige Ergebnisliste der Task-Ressourcen ohne die referenzierten, signierten E-Rezept-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine Übersicht aller Tasks erhält.
    </Beschreibung>
    <!-- A_19129-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-339" title="E-Rezept-Fachdienst - Task abrufen - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen konkreten über &lt;id&gt; adressierten /Task/&lt;id&gt; (ohne die Referenz einer FHIR-Operation) sicherstellen, dass ausschließlich Clientsysteme in einer der Rollen oid_versicherter oid_oeffentliche_apotheke oid_krankenhausapotheke oid_kostentraeger die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
    </Beschreibung>
    <!-- A_19113-02 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-340" title="E-Rezept-Fachdienst - Task abrufen - Prüfung AccessCode bei KVNR-Missmatch" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; und Ungleichheit der KVNR des Aufrufenden (KVNR des ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests UNGLEICH KVNR in Task.for ) prüfen, ob der im HTTP-Request-Header "X-AccessCode" oder URL-Parameter "?ac=..." übergebene AccessCode gleich dem AccessCode in Task.identifier ist, damit auch Vertreter in Kenntnis des AccessCodes ein einzelnes E-Rezept einsehen können.
    </Beschreibung>
    <!-- A_19116-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-341" title="E-Rezept-Fachdienst - Task abrufen - Flowtype 169/209 - Nicht verfügbar bei KVNR-Mismatch" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; durch einen Versicherten, wenn Task.extension:flowType = 169 oder 209 und die KVNR des Aufrufenden (KVNR des ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests) ungleich der KVNR in Task.for ist, mit dem Fehler 403 abbrechen.
    </Beschreibung>
    <!-- A_26148 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-342" title="E-Rezept-Fachdienst - Task abrufen - Rückgabe Task inkl. Bundles Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen /Task/&lt;id&gt; durch einen Versicherten die einzelne Task-Ressource um das referenzierte, serverseitig signierte E-Rezept-Bundle aus Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 2 als search.include im Ergebnis-Bundle an den Aufrufer zurückgeben, damit der Versicherte eine vollständige Einsicht in den Task und den signierten Verordnungsdatensatz für eigene Dokumentationszwecke erhält.
    </Beschreibung>
    <!-- A_21375-02 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-343" title="E-Rezept-Fachdienst - Task abrufen - Kein Secret für Versicherte" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /Task und GET /Task/&lt;id&gt; durch einen Versicherten oid_versicherter ein optional vorhandenes Task.identifier:Secret als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret aus dem zurückgegebenen Task entfernen, sodass Versicherte nicht in Kenntnis des Secrets gelangen, welches die Prozesshoheit des Apothekers darstellt.
    </Beschreibung>
    <!-- A_21532-02 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-344" title="E-Rezept-Fachdienst - Task abrufen - Keine Einlöseinformationen in unbekannten Clients" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Task/&lt;id&gt; ausschließlich solchen Clients die AccessCode Information (Task.identifier mit system="https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" ) in den Task-Ressourcen zurückgeben, welche anhand der mitgeteilten, gültigen Produktidentifikation als hierfür zulässige Clients erkannt werden.
    </Beschreibung>
    <!-- A_20702-03 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-345" title="E-Rezept-Fachdienst - Task abrufen - Flowtype 169 / 209 - keine Einlöseinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst DARF den AccessCode beim Zugriff durch den Versicherten NICHT an das E-Rezept-Frontend des Versicherten herausgeben, wenn der Flowtype des Tasks den Wert für die Workflowsteuerung durch Leistungserbringer enthält (169, 209).
    </Beschreibung>
    <!-- A_21360-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-346" title="E-Rezept-Fachdienst - Task abrufen - Apotheke - Verordnung abrufen - Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?ac=..." durch eine abgebende LEI die zum referenzierten Task in Task.owner gespeicherte Telematik-ID der abgebenden LEI mit der Telematik-ID aus dem ACCESS_TOKEN vergleichen und bei Ungleichheit die Operation mit dem HTTP-Fehlercode 412 abbrechen, damit der Zugriff auf diesen Datensatz nur durch Berechtigte erfolgt.
    </Beschreibung>
    <!-- A_24176 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-347" title="E-Rezept-Fachdienst - Task abrufen - Apotheke - Verordnung abrufen - Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?ac=..." durch eine abgebende LEI den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten Task gespeicherten AccessCode Task.identifier:AccessCode als https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCode erfolgen.
    </Beschreibung>
    <!-- A_24177 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-348" title="E-Rezept-Fachdienst - Task abrufen - Apotheke - Verordnung abrufen - Prüfung Status in-progress" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?ac=..." durch eine abgebende LEI den im referenzierten Task gespeicherten Status Task.status prüfen und mit dem Fehler 412 abbrechen, wenn Task.status ungleich "in-progress", damit der Datensatz nur abgerufen werden, kann, wenn sich die Verordnung in Belieferung befindet.
    </Beschreibung>
    <!-- A_24178 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-349" title="E-Rezept-Fachdienst - Task abrufen - Apotheke - Verordnung abrufen - erneuter Abruf Verordnung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?ac=..." durch eine abgebende LEI den Task mit dem Geheimnis Task.identifier:Secret sowie im Bundle mit dem in Task.input mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 1 referenzierten QES-Datensatz als Binary-Ressource https://www.hl7.org/fhir/binary.html an den Aufrufer zurückgeben.
    </Beschreibung>
    <!-- A_24179 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-350" title="E-Rezept-Fachdienst - Task abrufen - Rückgabe Task inkl. Bundle im Bundle Apotheker" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf einen einzelnen Task mittels "/Task/&lt;id&gt;?secret=..." durch einen Apotheker den Task, sofern er den Status "completed" hat, um das referenzierte, serverseitig signierte Quittungs-Bundle aus Task.output mit Codingsystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType = 3 als search.include im Ergebnis-Bundle ergänzen und die Ergebnismenge Task + Quittungs-Bundle an den Apotheker zurückgeben, damit ein Apotheker, der ein konkretes E-Rezept beliefert hat, bei Bedarf genau dieses belieferte E-Rezept inkl. der Quittung erneut abrufen kann.
    </Beschreibung>
    <!-- A_19226-01 -->
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-351" title="E-Rezept-Fachdienst - Task abrufen - Vertreter - Push Notification Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
    <Beschreibung>
        Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /Task/&lt;id&gt; durch einen Versicherten mit der Rolle oid_versicherter, sofern die KVNR des Aufrufenden ungleich der KVNR in Task.for ist, den Push Notification Prozess für den Trigger mit der ChannelId "erp.task.vertreter" und den Versicherten mit der KVNR = Task.for initiieren.
    </Beschreibung>
    <!-- A_28125 -->
</requirement>
