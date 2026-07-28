Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Subscription-Endpunkt.

### POST /Subscription – Subscription registrieren

<!-- A_22362-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A346" title="TI-Flow-Fachdienst - Subscription registrieren - Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource die zeta-user-info.professionOID des Nutzers bestimmen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
     <ul>
     <li>oid_oeffentliche_apotheke</li> 
     <li>oid_krankenhausapotheke</li>
     <li>oid_kostentraeger</li>
     </ul>
     die Operation am TI-Flow-Fachdienst aufrufen und bei Abweichungen die Operation mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>TIFLOW_AUTH_ROLE_NOT_ALLOWED</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit eine Subscription nicht durch Unberechtigte registriert werden kann.
</requirement>

<!-- A_22363 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A351" title="TI-Flow-Fachdienst - Subscription registrieren - Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource durch eine abgebende Institution, diese anhand des zeta-user-info.identifier des Nutzers (Telematik-ID) identifizieren, diese gegen die in der Ressource im Element criteria Attribut receipient hinterlegte Telematik-ID prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:
    <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>SVC_IDENTITY_MISMATCH</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Identity mismatch: Access token does not match FHIR data (Telematik-ID)</td>
        </tr>
    </table> 
    abbrechen, damit eine abgebende Institution ausschließlich für sich selbst eine Subscription registrieren kann.
</requirement>

<!-- A_22364 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A347" title="TI-Flow-Fachdienst - Subscription registrieren - Response" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource mit einem Response antworten, welcher eine Subscription Ressource mit 
    <ul>
    <li>Pseudonym der Telematik-ID in id</li>
    <li>aktueller Timestamp + 12 h in end</li> 
    <li>Bearer Token in Authorization</li>
    </ul>
    enthält.
</requirement>

<!-- A_22365 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A348" title="TI-Flow-Fachdienst - Subscription registrieren - Pseudonym der Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS das Pseudonym mittels eines 128-Bit-AES-CMAC-Schlüssels erstellen und hexadezimal kodieren (32 Byte lang).
</requirement>

*Hinweis*: Vergleichend kann [gemSpec_Krypt]#A_20163 betrachtet werden.

<!-- A_22383-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A349" title="TI-Flow-Fachdienst - Generierungsschlüssel - Pseudonym der Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS den AES-CMAC-Schlüssel zur Pseudonymgenerierung regelmäßig mindestens alle 3 Monate ändern.
</requirement>

<!-- A_22366 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A350" title="TI-Flow-Fachdienst - Subscription registrieren - Barrier-Token" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS für die Registrierung der Subscription einen Bearer-Token mit den Claims 
     <ul>
     <li>subscriptionid: Pseudonym der Telematik-ID</li>
     <li>iAt: Timestamp wann Subscription erstellt wurde</li>
     <li>exp: Timestamp Ablauf der Subscription</li>
     </ul>
     erstellen und mit einer Identität des TI-Flow-Fachdienstes signieren (Signature Algortihm: ES256).
</requirement>

### Subscription-Endpunkt (WebSocket)

<!-- A_22368 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A163" title="TI-Flow-Fachdienst - Subscription Service - Webschnittstelle" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS eine Webschnittstelle anbieten, welche Websocket-Verbindungen mit einer Dauer von bis zu 12 h unterstützt.
</requirement>

<!-- A_22370 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A165" title="TI-Flow-Fachdienst - Subscription Service - Upgrade" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service auf einen WebSocket-Upgrade-Request eines berechtigten Clients mit dem HTTP-Statuscode 101 Switching Protocols antworten.
</requirement>

<!-- A_22369 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A164" title="TI-Flow-Fachdienst - Subscription Service - Prüfung Bearer-Token" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produktgutachten">Sich.techn. Eignung: Produktgutachten</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service beim Verbindungsaufbau prüfen, dass der Client einen zeitlich und kryptographisch gültigen Bearer-Token der Schnittstelle POST /Subscription übermittelt und bei nicht-erfolgreicher Prüfung die Verbindung mit dem folgenden Fehler:
      <table id="error-code" style="border: 1px solid black; border-collapse: collapse;">
        <tr>
            <th>HTTP-Code</th>
            <td>403 - Forbidden</td>
        </tr>
        <tr>
            <th>Severity</th>
            <td>error</td>
        </tr>
        <tr>
            <th>Code</th>
            <td>invalid</td>
        </tr>
        <tr>
            <th>Details Code</th>
            <td>SVC_INVALID_ACCESS_TOKEN</td>
        </tr>
        <tr>
            <th>Details Text</th>
            <td>Invalid access token provided</td>
        </tr>
    </table>
    ablehnen.
</requirement>

<!-- A_22371 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A166" title="TI-Flow-Fachdienst - Subscription Service - abgelaufene Verbindungen schließen" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst MUSS an der Webschnittstelle des Subscription Service sicherstellen, dass Verbindungen nach Überschreiten des Timestamp Ablauf der Subscription geschlossen werden.
</requirement>

<!-- A_22378 -->
<requirement conformance="SHALL NOT" key="IG-TIFLOW-CORE-A167" title="TI-Flow-Fachdienst - Subscription Service - Verbot Profilbildung" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD" description="TI-Flow-Fachdienst">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Der TI-Flow-Fachdienst DARF in der Verbindung zum Subscription Service anfallende Metadaten (Client-IP-Adresse, etc.) NICHT für eine unbefugte Profilbildung der verbundenen Clients verwenden.
</requirement>

Hinweis: Eine Verwendung zur Sicherung der Schnittstelle (DDoS-Schutz, Fehleranalyse in sehr eingeschränktem Maß) ist zulässig (im Sinne einer befugten Profilbildung).
