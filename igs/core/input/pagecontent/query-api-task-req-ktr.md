Diese Seite beschreibt Anforderungen an das Clientsystem Kostenträger zur Nutzung der `Task`-Query-Endpunkte.

### Recovery Secret

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A215" title="CS Kostenträger: Recovery Secret - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="CS_TI-Flow_KTR" description="CS-Schnittstelle für TI-Flow/Kostenträger">
    <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Recovery Secret" für die Verordnung die HTTP-Operation GET /Task/&lt;id&gt;/ mit 
  <ul>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>AccessCode in URL-Parameter ?ac=</li>
  </ul>
  ausführen.
</requirement>

### Quittung erneut abrufen

Mit diesem Anwendungsfall kann ein Clientsystem eines Kostenträgers die Quittung erneut abrufen, falls bei der Übermittlung vom TI-Flow-Fachdienst ein Fehler aufgetreten ist.

Der Anwendungsfall kann bei Bedarf wiederholt werden.

<!-- A_19292 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A216" title="CS Kostenträger: Quittung erneut abrufen - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="CS_TI-Flow_KTR" description="CS-Schnittstelle für TI-Flow/Kostenträger">
    <testProcedure id="Herstellererklärung">funkt. Eignung: Herstellererklärung</testProcedure>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Quittung erneut abrufen" für die Verordnung die HTTP-Operation GET /Task/&lt;id&gt;/ mit 
  <ul>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>Geheimnis in URL-Parameter ?secret=</li>
  </ul>
  ausführen.
</requirement>


