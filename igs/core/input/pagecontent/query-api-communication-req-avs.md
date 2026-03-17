Diese Seite beschreibt Anforderungen an Clients zur Nutzung der `Communication`-Query-Endpunkte.

### Nachrichten abrufen

<!-- A_21556 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-129" title="PS abgebende LEI: Nachrichten abrufen - Häufigkeit" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" zwischen den Aufrufen der Operation GET /Communication mindestens 5 Minuten warten. Der Zeitraum zwischen den Aufrufen muss um eine zufällige Zeitspanne zwischen 0 und 10.000 Millisekunden verlängert werden, um eine Gleichverteilung der Anfragen am E-Rezept-Fachdienst über alle Apotheken zu erreichen.
</requirement>

<!-- A_19329-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-130" title="PS abgebende LEI: Nachrichten abrufen - Abfrage" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachrichten von Versicherten empfangen" die HTTP-Operation GET /Communication mit
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-131" title="PS abgebende LEI: Nachricht versenden - Nachricht auf Fachdienst einstellen" version="0">
  <meta lockversion="false"/>
  <actor name="PS_E-Rezept_abgebend">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das PS der abgebenden LEI MUSS im Anwendungsfall "Nachricht an Versicherten versenden" die HTTP-Operation POST /Communication mit
  <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Communication Ressource im HTTP-Request-Body</li>
  </ul>
  ausführen.
</requirement>



### Nachricht löschen

Mit diesem Anwendungsfall kann die abgebende LEI von ihr versendete Nachrichten an einen Versicherten auf dem Fachdienst löschen.

Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, eine Nachricht zum
Löschen auf dem Fachdienst auszuwählen.

Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass die
ausgewählte Nachricht gelöscht werden soll, und die Möglichkeit geben, das
Löschen abzubrechen.

<!-- A_21489 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-132" title="PS abgebende LEI: Nachricht löschen - Löschrequest" version="0">
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

<!-- A_19328 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Nachrichten von Versicherten empfangen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.6 - Nachrichten durch Abgebenden empfangen" aus [gemSysL_eRp] gemäß TAB_ILFERP_010 umsetzen. Tabelle # : TAB_ILFERP_010 – Nachrichten von Versicherten empfangen Name Nachrichten von Versicherten empfangen Auslöser Aufruf des Anwendungsfalls in der GUI periodische Abfrage durch das PS Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Die auf dem E-Rezept-Fachdienst für die abgebende LEI hinterlegten Communication Ressourcen wurden übertragen. Die E-Rezept-Nachrichten stehen im PS bereit. Standardablauf E-Rezept-Nachrichten am Fachdienst abrufen Mitteilung und E-Rezept-Token extrahieren
</requirement>
<!-- A_19330 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Nachricht versenden - E-Rezept auswählen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, eine E-Rezept-Nachricht auszuwählen, um eine Antwort zu senden.
</requirement>
<!-- A_19331 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Nachricht versenden - Mitteilung erfassen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, für eine E-Rezept-Nachricht an einen Versicherten eine Textnachricht zu erfassen.
</requirement>
<!-- A_19332 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Nachricht an Versicherten versenden">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.7 - Nachricht durch Abgebenden übermitteln" aus [gemSysL_eRp] gemäß TAB_ILFERP_011 umsetzen. Tabelle # : TAB_ILFERP_011 – Nachricht an Versicherten versenden Name Nachricht an Versicherten versenden Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Die LEI hat eine E-Rezept-Nachricht vom E-Rezept-Fachdienst heruntergeladen. Der Nutzer hat eine Mitteilung als Antwort auf die Nachricht erfasst. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Auf dem E-Rezept-Fachdienst steht eine E-Rezept-Nachricht für den Versicherten bereit. Standardablauf Versicherten-ID aus der Nachricht des Versicherten bestimmen Communication Ressource erstellen E-Rezept-Nachricht auf Fachdienst einstellen
</requirement>
<!-- A_21486 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Nachricht löschen - Nachricht auswählen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS es dem Nutzer ermöglichen, eine Nachricht zum Löschen auf dem Fachdienst auszuwählen.
</requirement>
<!-- A_21487 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Nachricht löschen - Bestätigung">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS vom Nutzer eine Bestätigung einholen, dass die ausgewählte Nachricht gelöscht werden soll, und die Möglichkeit geben, das Löschen abzubrechen.
</requirement>
<!-- A_21488 -->
<requirement conformance="SHALL" title="PS abgebende LEI: Nachricht durch Abgebenden löschen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI MUSS den Anwendungsfall "UC 4.9 - Nachricht durch Abgebenden löschen" aus [gemSysL_eRp] gemäß TAB_ILFERP_013 umsetzen. Tabelle # : TAB_ILFERP_013 – Nachricht durch Abgebenden löschen Name Nachricht durch Abgebenden löschen Auslöser Aufruf des Anwendungsfalls in der GUI Akteur Leistungserbringer, Mitarbeiter der abgebenden LEI Vorbedingung Der Nutzer hat eine Nachricht zum Löschen markiert und das Löschen bestätigt. Die LEI hat sich gegenüber der TI authentisiert. Nachbedingung Die ausgewählte Nachricht ist vom E-Rezept-Fachdienst unwiederbringlich gelöscht. Standardablauf ID der Communication Ressource bestimmen Nachricht auf Fachdienst löschen Nachricht in PS löschen (optional)
</requirement>
<!-- A_21490 -->
<requirement conformance="MAY" title="PS abgebende LEI: Nachricht löschen - Nachricht im PS löschen">
    <meta lockversion="false"/>
    <actor name="PS_E-Rezept_abgebend">
        <testProcedure id="Produkttest"/>
    </actor>
     Das PS der abgebenden LEI KANN im Anwendungsfall "Nachricht durch Abgebenden löschen" dem Nutzer ermöglichen, die Nachricht auch lokal im PS zu löschen.
</requirement>
