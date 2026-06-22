Tritt ein Fehler bei der Verarbeitung von Operationsaufrufen an einem Dienst der TI (bspw. TI-Flow-Fachdienst) auf, dann antwortet der Dienst mit einer Fehlermeldung. Das Format und die verwendeten Fehlercodes sind in [Fehlercodes](./error-codes.html) beschrieben. Die API-Beschreibungen der Schnittstellen in den Anwendungsmodul- sowie Funktions-IGs enthalten die Fehlercodes für die Endpunkte.

Weiterhin können Fehler in der lokalen Verarbeitung auftreten.

<!-- A_20152 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-263" title="CS: Verständliche Fehlermeldung" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
        Das Clientsystem des TI-Flow-Fachdienstes MUSS im Falle von Fehlern Fehlermeldungen bereitstellen, die es den Mitarbeitern der Leistungserbringerinstitution ermöglichen, die Ursache des Fehlers zu identifizieren und mögliche Gegenmaßnahmen zu ergreifen.
</requirement>

Während der Auslösung von Anfragen durch einen Client können diverse Fehler auftreten. Bei einigen dieser Fehler ist eine erneute Anfrage (Retry) sinnvoll, für alle anderen Fälle soll kein Retry versucht werden. Um eine klare Leitlinie für die Fehlerbehandlung zu etablieren, sind unten auf dieser Seite weitere Informationen zu finden. 

Dort sind sämtliche Fehlercodes aufgeführt und für jeden einzelnen Code wird bewertet, ob ein erneuter Versuch der Anfrage (Retry) sowie ein Client-Failover empfohlen sind. Diese Bewertungen dienen als Orientierungshilfe für die Implementierung einer effektiven Fehlerbehandlungsstrategie, um die Robustheit und Zuverlässigkeit des Systems zu gewährleisten.

<!-- A_25460 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-264" title="CS: Fehlerbehandlung - Retry von Anfragen an TI-Flow-Fachdienst" version="1">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
        Das Clientsystem des TI-Flow-Fachdienstes MUSS im Falle von Fehlern bei einer Anfrage am TI-Flow-Fachdienst einen Retry und/oder Client-Failover nur gemäß der Fehlerbehandlung in [E-Rezept API Dokumentation](https://github.com/gematik/api-erp) durchführen.
</requirement>


#### Retry und Failover

Folgende Fehler können in allen Operationen ausgegeben werden. Im Folgenden sind Vorgaben beschrieben, wie sich Clients im diesen Fehlerfällen verhalten sollen. Die Fehlercodes können im äußeren HTTP- sowie inneren ASL-Request enthalten sein.

| Mögliche http Status Codes | Bedeutung/Fehlerdetails | Verhalten im Fehlerfall |
|---|---|---|
| 4XX (außer 408 und 429) | Fehlerhafte Anfrage | **Client-Failover angeraten: Nein.** Ein Retry ist nicht zulässig. |
| 408 | Timeout | Client-Failover angeraten: Ja. Ein Retry gemäß Exponential Backoff ist zulässig. (Max 10 Wiederholungen) |
| 429 | Zu viele Anfragen pro Zeiteinheit durch Nutzer | Client-Failover angeraten: Ja. Ein Retry ist stündlich zulässig. (Max 10 Wiederholungen) |
| 500 | Internal Server Error | Client-Failover angeraten: Ja. Ein Retry gemäß Exponential Backoff ist zulässig. (Max 10 Wiederholungen) |
| 501 | Not Implemented | Client-Failover angeraten: Nein. Ein Retry ist nicht zulässig. |
| 502 | Bad Gateway | Client-Failover angeraten: Ja. Ein Retry nur mit Client-Failover (Max. 10 Wiederholungen) |
| 503 | Service Unavailable | Client-Failover angeraten: Ja. Ein Retry gemäß Exponential Backoff ist zulässig. (Max 10 Wiederholungen) |
| 504 | Gateway Timeout | Client-Failover angeraten: Ja. Ein Retry gemäß Exponential Backoff ist zulässig. (Max 10 Wiederholungen) |
| 505 | HTTP Version not supported | Client-Failover angeraten: Nein. Ein Retry ist nicht zulässig. |
| 506 | Variant Also Negotiates | Client-Failover angeraten: Ja. Ein Retry nur mit Client-Failover (Max. 10 Wiederholungen) |
| 507 | Insufficient Storage | Client-Failover angeraten: Ja. Ein Retry gemäß Exponential Backoff ist zulässig. (Max 10 Wiederholungen) |
| 508 | Loop Detected | Client-Failover angeraten: Nein. Ein Retry ist nicht zulässig. |
| 509 | Bandwidth Limit Exceeded | Client-Failover angeraten: Ja. Ein Retry gemäß Exponential Backoff ist zulässig. (Max 10 Wiederholungen) |
| 510 | Not Extended | Client-Failover angeraten: Nein. Ein Retry ist nicht zulässig. |
| 511 | Network Authentication Required | Client-Failover angeraten: Nein. Ein Retry ist nicht zulässig. |
| 512 | OCSP Backend Error | Client-Failover angeraten: Ja. Ein Retry gemäß Exponential Backoff ist zulässig. (Max 10 Wiederholungen) |


### Logging und Meldungen

<!-- A_20088 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-CORE-265" title="CS: Schreiben eines Fehlerprotokolls" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes SOLL alle in der Kommunikation mit den Diensten der TI auftretenden Fehler und Warnungen in ein dediziertes Fehlerprotokoll schreiben und diese Protokollinformationen für Supportmaßnahmen über eine Zeitraum von mindestens 14 Tagen zur Verfügung halten.
</requirement>

<!-- A_20089 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-CORE-266" title="CS: Anzeige von Meldungen" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes SOLL alle in der Kommunikation mit den Diensten der TI auftretenden Probleme für den Benutzer verständlich anzeigen und dabei erkennen lassen, ob durch den Anwender oder den verantwortlichen Leistungserbringer Maßnahmen zur Behebung eingeleitet werden müssen.
</requirement>

<!-- A_20884 -->
<requirement conformance="SHOULD" key="IG-TIFLOW-CORE-267" title="CS: Exponential Backoff bei Verbindungsfehlern" version="0">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_verordnend" description="E-Rezept-Schnittstelle eines verordnenden PS (Leistungserbringer)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="PS_E-Rezept_abgebend" description="E-Rezept-Schnittstelle eines abgebenden PS (Apotheke)">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    <actor name="CS_E-Rezept_KTR" description="CS-Schnittstelle für E-Rezept/Kostenträger">
        <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
    </actor>
    Das Clientsystem des TI-Flow-Fachdienstes SOLL bei serverseitigen Fehlermeldungen, die auf eine Überlastung des Zielsystems schließen lassen (z.B. http-status 5xx, 429 - too many requests, etc.), erneute Verbindungsversuche nach dem Prinzips des Exponential Backoffs [ExpBack] durchführen.
</requirement>
