Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `AuditEvent`-Query-Endpunkte.

<!-- A_19210 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-301" title="E-Rezept-FdV: Protokolldaten anzeigen - Protokolleinträge abrufen" version="0">
    <meta lockversion="true"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Protokolldaten anzeigen" zum Abrufen der Protokolleinträge vom TI-Flow-Fachdienst die HTTP-Operation GET /AuditEvent mit
    <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li> 
    </ul>
    ausführen.
</requirement>

Der Response beinhaltet ein Bundle mit einem searchset von AuditEvent Ressourcen. Eine AuditEvent Ressource beinhaltet die folgenden Informationen (Siehe auch [gemSpec_DM_eRp#A_19296-* - TI-Flow-Fachdienst - Inhalt Protokolleintrag ]):

<ul>
<li>ID des Datenobjektes, auf das zugegriffen wurde (AuditEvent.entity.what) Das entspricht der Task-ID oder MedicationDispense-ID</li>
<li>Rezept-ID (AuditEvent.entity.description)</li>
<li>lesbarer Beschreibung in einfacher Sprache (AuditEvent.text)</li>
<li>Name des Zugreifenden (AuditEvent.agent.who)</li>
<li>Zeitpunkt des Zugriffs (AuditEvent.recorded)</li>
<li>Ergebnis der aufgerufenen Operation (AuditEvent.outcome)</li>
</ul>

Das E-Rezept-FdV kann es dem Nutzer über einen Link in der Anzeige ermöglichen, die Details zum referenzierten E-Rezept anzuzeigen.

Die Protokolldaten sollen für den Nutzer sortierbar und filterbar über die Angabe von Filterkriterien wie z.B. Zeitraum, dargestellt werden.
