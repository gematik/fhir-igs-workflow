Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.


### Nachricht versenden




### Nachricht löschen

Mit diesem Anwendungsfall kann die abgebende LEI von ihr versendete Nachrichten an einen Versicherten auf dem Fachdienst löschen.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, eine Nachricht zum
Löschen auf dem Fachdienst auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass die
ausgewählte Nachricht gelöscht werden soll, und die Möglichkeit geben, das
Löschen abzubrechen.

<!-- A_21489 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-111" title="PS abgebende LEI: Nachricht löschen - Löschrequest" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachricht durch Abgebenden löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/&lt;id&gt; mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Communication-ID in URL &lt;id&gt; </li>
  </ul>
  ausführen.
</requirement>

Der Fachdienst prüft anhand der Telematik-ID im ACCESS_TOKEN, ob die LEI der Absender der zu löschenden Nachricht ist.

Das PS der abgebenden LEI KANN im Anwendungsfall "Nachricht durch Abgebenden
löschen" dem Nutzer ermöglichen, die Nachricht auch lokal im PS zu löschen.

Hinweis: Nachrichten an Versicherte sind immer an den Workflow des referenzierten E-Rezeptes gebunden. Wenn ein E-Rezept-Workflow, bspw. durch den Versicherten oder aufgrund von durch den Fachdienst durchgesetzte Löschfristen, auf dem Fachdienst gelöscht wird, dann werden auch alle zugehörigen Nachrichten gelöscht.