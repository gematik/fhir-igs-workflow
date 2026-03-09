Diese Seite beschreibt Anforderungen an das Clientsystem Kostenträger zur Nutzung der `Task`-Query-Endpunkte.

### Recovery Secret

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-171" title="CS Kostenträger: Recovery Secret - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Recovery Secret" für das E-Rezept die HTTP-Operation GET /Task/&lt;id&gt;/ mit 
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>Access_Code in URL-Parameter ?ac=</li>
  </ul>
  ausführen.
</requirement>

### Quittung erneut abrufen

Mit diesem Anwendungsfall kann eine abgebende LEI die Quittung erneut abrufen, falls bei der Übermittlung vom E-Rezept-Fachdienst ein Fehler aufgetreten ist.

Der Anwendungsfall kann bei Bedarf wiederholt werden.

<!-- A_19292 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-172" title="CS Kostenträger: Quittung erneut abrufen - Statusrequest" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Quittung erneut abrufen" für das E-Rezept die HTTP-Operation GET /Task/&lt;id&gt;/ mit 
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    <li>Geheimnis in URL-Parameter ?secret=</li>
  </ul>
  ausführen.
</requirement>


