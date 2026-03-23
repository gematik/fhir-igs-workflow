Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

<!-- A_19347-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-197" title="E-Rezept-FdV: E-Rezepte abrufen - Liste E-Rezepte abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen alle E-Rezepte des Nutzers die HTTP-Operation GET /Task mit 
     <ul>
        <li>ACCESS_TOKEN im Authorization-Header</li>
     </ul>
     ausführen.
</requirement>

<!-- A_19348-01 -->
<requirement conformance="MAY" key="IG-PRE-TIFLOW-CORE-198" title="E-Rezept-FdV: E-Rezept abrufen - E-Rezepte lokal speichern" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
     Das E-Rezept-FdV KANN es dem Versicherten ermöglichen, die vom E-Rezept-Fachdienst heruntergeladenen E-Rezepte im lokalen Speicher persistent abzulegen.
</requirement>

### Alternativer Ablauf 1: Ein spezifisches E-Rezept durch Nutzer abrufen

Die Alternative 1 wird genutzt, wenn nur die Informationen zu einem E-Rezept vom E-Rezept-Fachdienst heruntergeladen werden sollen, bspw. um zu prüfen, ob sich der Status geändert hat. Dafür muss die Task-ID dieses Rezepts im E-Rezept-FdV bekannt sein.

<!-- A_19350-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-199" title="E-Rezept-FdV: E-Rezepte abrufen -Spezifisches E-Rezept herunterladen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen eines spezifischen E-Rezepts des Nutzers die HTTP-Operation GET /Task/&lt;id&gt; mit 
    <ul>
    <li>ACCESS_TOKEN im Authorization-Header</li>
    <li>Task-ID in URL &lt;id&gt; </li>
    </ul>
    ausführen.
</requirement>

Für weitere Informationen siehe Operation "Ein einzelnes E-Rezept abrufen" aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.

### Alternativer Ablauf 2: Ein spezifisches E-Rezept mit AccessCode abrufen

Die Alternative 2 wird genutzt, wenn der Nutzer als Vertreter eines Versicherten ein E-Rezept vom E-Rezept-Fachdienst herunterladen möchte. Dafür müssen die Task-ID und der AccessCode dieses Rezepts im E-Rezept-FdV bekannt sein. Die Informationen Task-ID und AccessCode werden im E-Rezept-Token übermittelt.

<!-- A_19351-01 -->
<requirement conformance="MAY" key="IG-PRE-TIFLOW-CORE-200" title="E-Rezept-FdV: E-Rezepte abrufen - E-Rezept mit AccessCode herunterladen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das E-Rezept-FdV KANN im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen eines E-Rezepts als Vertreter die HTTP-Operation GET /Task/&lt;id&gt; mit 
    <ul>
        <li>ACCESS_TOKEN im http-Header</li>
        <li>Task-ID in URL &lt;id&gt; </li>
        <li>AccessCode im http-Header </li>
    </ul>
    ausführen.
</requirement>

Für weitere Informationen siehe Operation "Ein einzelnes E-Rezept abrufen" aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.