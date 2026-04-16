Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den Subscription-Query-Endpunkt.

<!-- A_22362-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-346" title="TI-Flow-Fachdienst – Subscription registrieren – Rollenprüfung" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Nutzer in der Rolle 
     <ul>
     <li>oid_oeffentliche_apotheke</li> 
     <li>oid_krankenhausapotheke</li>
     <li>oid_kostentraeger</li>
     </ul>
     die Operation am TI-Flow-Fachdienst aufrufen dürfen, und bei Abweichungen die Operation mit dem folgenden Fehler:
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
            <td>Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern</td>
        </tr>
    </table> 
    abbrechen, damit eine Subscription nicht durch Unberechtigte registriert werden kann.
</requirement>

<!-- A_22364 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-347" title="TI-Flow-Fachdienst – Subscription registrieren – Response" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-348" title="TI-Flow-Fachdienst – Subscription registrieren – Pseudonym der Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS das Pseudonym innerhalb der VAU mittels eines 128-Bit-AES-CMAC-Schlüssels erstellen und hexadezimal kodieren (32 Byte lang) (vgl gemSpec_Krypt#A_20163).
</requirement>

<!-- A_22383-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-349" title="TI-Flow-Fachdienst – Generierungsschlüssel – Pseudonym der Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS den AES-CMAC-Schlüssel zur Pseudonymgenerierung regelmäßig mindestens alle 3 Monate ändern.
</requirement>

<!-- A_22366 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-350" title="TI-Flow-Fachdienst – Subscription registrieren – Barrier-Token" version="0">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produktgutachten"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS für die Registrierung der Subscription einen Bearer-Token mit den Claims 
     <ul>
     <li>subscriptionid: Pseudonym der Telematik-ID</li>
     <li>iAt: Timestamp wann Subscription erstellt wurde</li>
     <li>exp: Timestamp Ablauf der Subscription</li>
     </ul>
     erstellen und mit einer Identität des TI-Flow-Fachdienstes signieren (Signature Algortihm: ES256).
</requirement>

<!-- A_22363 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-351" title="TI-Flow-Fachdienst – Subscription registrieren – Prüfung Telematik-ID" version="1">
    <meta lockversion="false"/>
    <actor name="TI-Flow_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der TI-Flow-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource durch eine abgebende Institution, diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in der Ressource im Element criteria Attribut receipient hinterlegte Telematik-ID prüfen und bei Ungleichheit die Operation mit dem folgenden Fehler:
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
