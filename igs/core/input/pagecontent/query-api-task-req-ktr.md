Diese Seite beschreibt Anforderungen an das Clientsystem Kostenträger zur Nutzung der `Task`-Query-Endpunkte.

### Recovery Secret

<requirement conformance="SHALL" key="IG-TIFLOW-CORE-196" title="CS Kostenträger: Recovery Secret - Statusrequest" version="0">
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-197" title="CS Kostenträger: Quittung erneut abrufen - Statusrequest" version="0">
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

<!-- A_20654-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-415" title="CS: Registrierung des Clientsystems des E-Rezept-Fachdienstes" version="0">
    <meta lockversion="false"/>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Produkttest"/>
    </actor>
     Der Hersteller des Clientsystem des E-Rezept-Fachdienstes MUSS sich über einen organisatorischen Prozess beim Anbieter des IDP-Dienstes für die Dienste, für welche Token abgerufen werden sollen, registrieren. Der IDP-Dienst vergibt dabei eine "client_id". Diese "client_id" MUSS vom Clientsystem bei Nutzung des IDP-Dienstes übertragen werden.
</requirement>
<!-- A_20655-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-416" title="CS: Regelmäßiges Einlesen des Discovery Document" version="0">
    <meta lockversion="false"/>
    <actor name="CS_E-Rezept_KTR">
        <testProcedure id="Produkttest"/>
    </actor>
     Das Clientsystem MUSS das Discovery Document (DD) [RFC8414] regelmäßig alle 24 Stunden einlesen und auswerten, und danach die darin aufgeführten URI zu den benötigten öffentlichen Schlüsseln (PUKs) und Diensten verwenden. Der Downloadpunkt wird als Teil der organisatorischen Registrierung des Clientsystems beim IDP-Dienst übergeben. Das Clientsystem MUSS den Downloadpunkt des Discovery Document als konfigurierbaren Parameter speichern.
</requirement>
