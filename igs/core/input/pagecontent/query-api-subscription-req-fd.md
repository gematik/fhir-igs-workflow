Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Subscription-Query-Endpunkt.

<!-- A_22362-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-284" title="E-Rezept-Fachdienst – Subscription registrieren – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_oeffentliche_apotheke oid_krankenhausapotheke oid_kostentraeger die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Subscription nicht durch Unberechtigte registriert werden kann.
</requirement>

<!-- A_22362-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-285" title="E-Rezept-Fachdienst – Subscription registrieren – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_oeffentliche_apotheke oid_krankenhausapotheke oid_kostentraeger die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Subscription nicht durch Unberechtigte registriert werden kann.
</requirement>

<!-- A_22364 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-286" title="E-Rezept-Fachdienst – Subscription registrieren – Response" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf die /Subscription Ressource mit einem Response antworten, welcher eine Subscription Ressource mit Pseudonym der Telematik-ID in id aktueller Timestamp + 12 h in end Bearer Token in Authorization enthält.
</requirement>

<!-- A_22365 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-287" title="E-Rezept-Fachdienst – Subscription registrieren – Pseudonym der Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS das Pseudonym innerhalb der VAU mittels eines 128-Bit-AES-CMAC-Schlüssels erstellen und hexadezimal kodieren (32 Byte lang) (vgl gemSpec_Krypt#A_20163).
</requirement>

<!-- A_22383-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-288" title="E-Rezept-Fachdienst – Generierungsschlüssel – Pseudonym der Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS den AES-CMAC-Schlüssel zur Pseudonymgenerierung regelmäßig mindestens alle 3 Monate ändern.
</requirement>

<!-- A_22366 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-289" title="E-Rezept-Fachdienst – Subscription registrieren – Barrier-Token" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FD">
        <testProcedure id="Produkttest"/>
    </actor>
     Der E-Rezept-Fachdienst MUSS für die Registrierung der Subscription einen Bearer-Token mit den Claims subscriptionid: Pseudonym der Telematik-ID iAt: Timestamp wann Subscription erstellt wurde exp: Timestamp Ablauf der Subscription erstellen und mit einer Identität des E-Rezept-Fachdienstes signieren (Signature Algortihm: ES256).
</requirement>
