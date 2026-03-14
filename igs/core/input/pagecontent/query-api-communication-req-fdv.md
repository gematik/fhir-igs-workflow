Diese Seite beschreibt Anforderungen ein E-Rezept-FdV zur Nutzung der `Communication`-Query-Endpunkte.

### Nachrichten abrufen


<!-- A_19205 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-46" title="Nachrichten abrufen - Nachrichten von Fachdienst herunterladen" version="0">
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

#### Zuweisen

<!-- A_26318 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - E-Rezept zuweisen - Status prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" den aktuellen Status des E-Rezepts ermitteln, prüfen ob Task.status = ready ist und anderenfalls den Anwendungsfall abbrechen.
</requirement>

<!-- A_26319 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - E-Rezept zuweisen - Ende Gültigkeit prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen"  prüfen, ob das Ende der Einlösefrist (Task.ExpiryDate) zu einem früherem Zeitpunkt als das aktuelle Datum liegt und in diesem Fall den Anwendungsfall abbrechen.
</requirement>

Die für die Nachricht zu verwendende Communication-Ressource wird modul- und anwendungsfall-spezifisch festgelegt.

<!-- A_28543 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - E-Rezept zuweisen - Zuweisen - TransactionID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels für den payload_contentstring eine TransactionID erzeugen, um Nachrichten zu dem Vorgang zuordnen zu können.
</requirement>

<!-- A_28545 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - E-Rezept zuweisen - Auf Nachricht antworten - TransactionID" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im  Anwendungsfall "E-Rezept einer Apotheke zuweisen" im Rahmen der Belieferung eines Arzneimittels, wenn der Nutzer auf eine empfangene Nachricht einer Apotheke antwortet, die TransactionID aus der empfangenen Nachricht der Apotheke unverändert im payload contentString der Textnachricht an die Apotheke zurückgeben.
</requirement>

<!-- A_19203 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-47" title="Nachricht senden - Nachricht auf Fachdienst einstellen" version="0">
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

#### Vertreterkommunikation

Das E-Rezept-FdV MUSS im Anwendungsfall "Vertreterkommunikation" es dem Nutzer ermöglichen, die KVNR des Empfängers der Nachricht zu erfassen.

Das Erfassen der KVNR eines Vertreters kann über eine Texterkennung durch Abscannen dessen eGK, manuelle Eingabe, durch Übernahme aus einer lokalen Vertreterliste oder auch durch die Übernahme aus einer vorherigen Kommunikation erfolgen.

Die Textnachricht ist optional. Der Textnachricht muss der Präfix "&lt;Absendername&gt; schreibt: " vorangestellt werden.

<!-- A_20237-01 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - Vertreterkommunikation - Nachricht erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Vertreterkommunikation" eine FHIR Ressource Communication des Profils https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative mit
    <ul>
        <li>KVNR des Vertreters in recipient</li>
        <li>optional: Textnachricht in payload contentString</li>
        <li>E-Rezept-Token in basedOn reference auf Task inkl. AccessCode als "/Task/&lt;id&gt;?ac=..."</li>
    </ul>
    erstellen.
</requirement>

<!-- A_20238-01 -->
<requirement conformance="SHALL" key="" title="Nachricht senden - Vertreterkommunikation - Nachricht auf E-Rezept-Fachdienst einstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "Vertreterkommunikation" zur Übergabe des Tokens an den Vertreter die HTTP-Operation POST /Communication mit
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
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-48" title="E-Rezept-FdV: Nachricht löschen - Löschrequest" version="0">
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
