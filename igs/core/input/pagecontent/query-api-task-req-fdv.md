Diese Seite beschreibt Anforderungen an das E-Rezept-FdV zur Nutzung der `Task`-Query-Endpunkte.

### Liste der Verordnungen des Nutzers abrufen

<!-- A_19347-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A197" title="E-Rezept-FdV: E-Rezepte abrufen - Liste E-Rezepte abrufen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen alle E-Rezepte des Nutzers die HTTP-Operation GET /Task ausführen.
</requirement>

<!-- A_19348-01 -->
<requirement conformance="MAY" key="IG-TIFLOW-CORE-A198" title="E-Rezept-FdV: E-Rezept abrufen - E-Rezepte lokal speichern" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
     Das E-Rezept-FdV KANN es dem Versicherten ermöglichen, die vom TI-Flow-Fachdienst heruntergeladenen E-Rezepte im lokalen Speicher persistent abzulegen.
</requirement>

### Eine spezifische Verordnung durch Nutzer abrufen

Der Aufruf wird genutzt, wenn die Informationen zu einer spezifischen Verordnung vom TI-Flow-Fachdienst heruntergeladen werden sollen, bspw. um zu prüfen, ob sich der Status geändert hat. Dafür muss die Task-ID dieser Verordnung im E-Rezept-FdV bekannt sein.

<!-- A_19350-01 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-A199" title="E-Rezept-FdV: E-Rezepte abrufen - Spezifisches E-Rezept herunterladen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV" description="E-Rezept-Frontend des Versicherten">
        <testProcedure id="Produkttest">funkt. Eignung: Test Produkt/FA</testProcedure>
    </actor>
    Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezepte abrufen" zum Herunterladen einer spezifischen Verordnung des Nutzers die HTTP-Operation GET /Task/&lt;id&gt; mit 
    <ul>
        <li>Task-ID in URL &lt;id&gt; </li>
    </ul>
    ausführen.
</requirement>

Für weitere Informationen siehe Operation "Ein einzelnes E-Rezept abrufen" aus der API-Schnittstelle [E-Rezept API Dokumentation].

Der Response beinhaltet die Task Ressource des E-Rezepts.
