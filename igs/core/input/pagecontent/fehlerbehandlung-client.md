Tritt ein Fehler bei der Verarbeitung von Operationsaufrufen an einem Dienst der TI (bspw. E-Rezept-Fachdienst) auf, dann antwortet der Dienst mit einer Fehlermeldung. Das Format und die verwendeten Fehlercodes sind in den Spezifikationen der Interfaces (bspw. [gemSpec_FD_eRp]) beschrieben. Weiterhin können Fehler in der lokalen Verarbeitung auftreten.

<!-- A_20152 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-381" title="CS: Verständliche Fehlermeldung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
        Das Clientsystem des E-Rezept-Fachdienstes MUSS im Falle von Fehlern Fehlermeldungen bereitstellen, die es den Mitarbeitern der Leistungserbringerinstitution ermöglichen, die Ursache des Fehlers zu identifizieren und mögliche Gegenmaßnahmen zu ergreifen.
</requirement>

Während der Auslösung von Anfragen durch einen Client können diverse Fehler auftreten. Bei einigen dieser Fehler ist eine erneute Anfrage (Retry) sinnvoll, für alle anderen Fälle soll kein Retry versucht werden. Um eine klare Leitlinie für die Fehlerbehandlung zu etablieren, wird auf die Webseite https://github.com/gematik/api-erp/blob/master/docs/erp_statuscodes.adoc verwiesen. Dort sind sämtliche Fehlercodes aufgeführt und für jeden einzelnen Code wird bewertet, ob ein erneuter Versuch der Anfrage (Retry) sowie ein Client-Failover empfohlen sind. Diese Bewertungen dienen als Orientierungshilfe für die Implementierung einer effektiven Fehlerbehandlungsstrategie, um die Robustheit und Zuverlässigkeit des Systems zu gewährleisten.

<!-- A_25460 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-382" title="CS: Fehlerbehandlung - Retry von Anfragen an E-Rezept-Fachdienst" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
        Das Clientsystem des E-Rezept-Fachdienstes MUSS im Falle von Fehlern bei einer Anfrage am E-Rezept-Fachdienst einen Retry und/oder Client-Failover nur gemäß der Fehlerbehandlung in [E-Rezept API Dokumentation] durchführen.
</requirement>

<!-- ToDo: Link auflösen -->

### Logging und Meldungen

<!-- A_20088 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-CORE-383" title="CS: Schreiben eines Fehlerprotokolls" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes SOLL alle in der Kommunikation mit den Diensten der TI auftretenden Fehler und Warnungen in ein dediziertes Fehlerprotokoll schreiben und diese Protokollinformationen für Supportmaßnahmen über eine Zeitraum von mindestens 14 Tagen zur Verfügung halten.
</requirement>

<!-- A_20089 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-CORE-384" title="CS: Anzeige von Meldungen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes SOLL alle in der Kommunikation mit den Diensten der TI auftretenden Probleme für den Benutzer verständlich anzeigen und dabei erkennen lassen, ob durch den Anwender oder den verantwortlichen Leistungserbringer Maßnahmen zur Behebung eingeleitet werden müssen.
</requirement>

<!-- A_20884 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-CORE-385" title="CS: Exponential Backoff bei Verbindungsfehlern" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das Clientsystem des E-Rezept-Fachdienstes SOLL bei serverseitigen Fehlermeldungen, die auf eine Überlastung des Zielsystems schließen lassen (z.B. http-status 5xx, 429 - too many requests, etc.), erneute Verbindungsversuche nach dem Prinzips des Exponential Backoffs [ExpBack] durchführen.
</requirement>

