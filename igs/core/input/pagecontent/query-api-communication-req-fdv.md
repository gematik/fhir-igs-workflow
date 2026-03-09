Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Nachrichten abrufen


<!-- A_19205 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-582" title="Nachrichten abrufen - Nachrichten von Fachdienst herunterladen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten von Apotheken anzeigen" zum Herunterladen von Nachrichten vom E-Rezept-Fachdienst die HTTP-Operation GET /Communication mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>optional: ?received=null für nur ungelesene Nachrichten</li>
        <li>optional: ?received=gtYYYY-MM-DD_sort=sent für Nachrichten jünger als Datum DD.MM.YYY</li>
    </ul>
    ausführen.
</requirement>


### Nachricht versenden

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

<!-- A_19203 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-583" title="Nachricht senden - Nachricht auf Fachdienst einstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht senden" zum Übermitteln einer Nachricht über den E-Rezept-Fachdienst die HTTP-Operation POST /Communication mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Communication Ressource in HTTP-Request-Body</li> 
    </ul>
    ausführen.
</requirement>



### Nachricht löschen

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht löschen" es dem Nutzer ermöglichen, eine Nachricht zum Löschen auf dem E-Rezept-Fachdienst auszuwählen.

Das E-Rezept-FdV MUSS im Anwendungsfall "Nachricht löschen" vom Nutzer eine Bestätigung einholen, dass die selektierte Nachricht gelöscht werden sollen und die Möglichkeit geben, das Löschen abzubrechen.

<!-- A_21526-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-584" title="E-Rezept-FdV: Nachricht löschen - Löschrequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Nachrichten löschen" für die zu löschende Nachricht die HTTP-Operation DELETE /Communication/&lt;id&gt; des E-Rezept-Fachdienstes mit
    <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
        <li>Communication-ID in URL &lt;id&gt;</li> 
    </ul>
    ausführen.
</requirement>
