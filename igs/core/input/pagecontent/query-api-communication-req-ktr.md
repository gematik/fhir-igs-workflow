Diese Seite beschreibt Anforderungen ein Clientsystem des Kostenrägers zur Nutzung der `Communication`-Query-Endpunkte.


### Nachrichten abrufen

<!-- A_21556 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-44" title="CS Kostenträger: Nachrichten abrufen - Häufigkeit" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" zwischen den Aufrufen der Operation GET /Communication mindestens 5 Minuten warten. Der Zeitraum zwischen den Aufrufen muss um eine zufällige Zeitspanne zwischen 0 und 10.000 Millisekunden verlängert werden, um eine Gleichverteilung der Anfragen am E-Rezept-Fachdienst über alle Apotheken zu erreichen.
</requirement>

<!-- A_19329-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-45" title="CS Kostenträger: Nachrichten abrufen - Abfrage" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" die HTTP-Operation GET /Communication mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>optional: ?received=null für nur ungelesene Nachrichten</li>
    <li>optional: ?received=gtYYYY-MM-DD für Nachrichten nach Datum DD.MM.YYYY</li>
  </ul>
  ausführen.
</requirement>

Falls eine oder mehrere E-Rezept-Nachrichten für die abgebende LEI auf dem E-Rezept-Fachdienst bereitstehen, übermittelt der E-Rezept-Fachdienst ein Bundle von Communication Ressourcen. 


### Nachricht versenden

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

<!-- A_19334 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-46" title="CS Kostenträger: Nachricht versenden - Nachricht auf Fachdienst einstellen" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Nachricht an Versicherten versenden" die HTTP-Operation POST /Communication mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Communication Ressource im HTTP-Request-Body</li>
  </ul>
  ausführen.
</requirement>

### Nachricht löschen

Mit diesem Anwendungsfall kann die abgebende LEI von ihr versendete Nachrichten an einen Versicherten auf dem Fachdienst löschen.

Das CS Kostenträger MUSS es dem Nutzer ermöglichen, eine Nachricht zum
Löschen auf dem Fachdienst auszuwählen.

Das CS Kostenträger MUSS vom Nutzer eine Bestätigung einholen, dass die
ausgewählte Nachricht gelöscht werden soll, und die Möglichkeit geben, das
Löschen abzubrechen.

<!-- A_21489 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-47" title="CS Kostenträger: Nachricht löschen - Löschrequest" version="0">
  <meta lockversion="false"/>
  <actor name="CS_E-Rezept_KTR">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das Clientsystem Kostenträger MUSS im Anwendungsfall "Nachricht durch Abgebenden löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/&lt;id&gt; mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Communication-ID in URL &lt;id&gt; </li>
  </ul>
  ausführen.
</requirement>

Der Fachdienst prüft anhand der Telematik-ID im ACCESS_TOKEN, ob die LEI der Absender der zu löschenden Nachricht ist.

Das CS Kostenträger KANN im Anwendungsfall "Nachricht durch Abgebenden
löschen" dem Nutzer ermöglichen, die Nachricht auch lokal im PS zu löschen.

Hinweis: Nachrichten an Versicherte sind immer an den Workflow des referenzierten E-Rezeptes gebunden. Wenn ein E-Rezept-Workflow, bspw. durch den Versicherten oder aufgrund von durch den Fachdienst durchgesetzte Löschfristen, auf dem Fachdienst gelöscht wird, dann werden auch alle zugehörigen Nachrichten gelöscht.