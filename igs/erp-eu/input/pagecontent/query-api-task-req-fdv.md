### Anforderungen der Schnittstelle aus diesem Modul

#### PATCH

Der Zugriff mittels der HTTP-Operation PATCH steht ausschließlich dem Versicherten zur Verfügung. Die PATCH-Operation führt zu keiner Statusänderung des Tasks.

<!-- A_27488 -->
<requirement conformance="MAY" key="IG-TIFLOW-XBORDER-26" title="E-Rezept-FdV: E-Rezept zum Einlösen im EU-Ausland markieren" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV KANN es dem Nutzer ermöglichen, die Markierung eines E-Rezeptes zum Einlösen im EU-Ausland zu verwalten.
</requirement>

<!-- A_27617 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-27" title="E-Rezept-FdV: E-Rezept zum Einlösen im EU-Ausland markieren - Hinweis Belieferungsmöglichkeit" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" dem Nutzer vor der Möglichkeit zum Markieren der E-Rezepte zum Einlösen im EU-Ausland einen Hinweis anzeigen, dass die Belieferungsmöglichkeit für die E-Rezepte mit der Apotheke vorab geklärt werden soll.
</requirement>

<!-- A_27489 -->
<requirement conformance="MAY" key="IG-TIFLOW-XBORDER-28" title="E-Rezept-FdV: optional: E-Rezept markieren" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV KANN den Anwendungsfall "E-Rezept markieren" umsetzen.
</requirement>

<!-- A_27618 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-29" title="E-Rezept-FdV: E-Rezept markieren - E-Rezepte auswählen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" dem Nutzer ermöglichen, ein oder mehrere E-Rezepte auszuwählen.
</requirement>

<!-- A_27490 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-30" title="E-Rezept-FdV: E-Rezept markieren" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV MUSS, wenn es den Anwendungsfall umsetzt, den Anwendungsfall "E-Rezept durch den Versicherten markieren" gemäß TAB_FdVERP_029 umsetzen. Tabelle #: TAB_FdVERP_029 – E-Rezept markieren Name E-Rezept markieren Auslöser Aufruf des Anwendungsfalls in der Graphical User Interface (GUI) Akteur Versicherter Vorbedingung Der Nutzer hat eine oder mehrere Markierungen aus- oder abgewählt. Der Nutzer hat sich gegenüber der TI authentisiert. Nachbedingung Die Markierungen sind im TI-Flow-Fachdienst gespeichert. Standardablauf Task-ID bestimmen FHIR Ressource erstellen Daten im TI-Flow-Fachdienst speichern
</requirement>

<!-- A_27545 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-31" title="E-Rezept-FdV: E-Rezept markieren - FHIR Ressource erstellen" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" eine Parameters Ressource des Profils [GEM ERPEU PR PAR PATCH Task Input] erstellen.
</requirement>

<!-- A_27491 -->
<requirement conformance="SHALL" key="IG-TIFLOW-XBORDER-32" title="E-Rezept-FdV: E-Rezept markieren - Speicherrequest" version="0">
    <meta lockversion="false"/>
    <actor name="eRp_FdV">
        <testProcedure id="Herstellererklärung"/>
    </actor>
     Das E-Rezept-FdV MUSS im Anwendungsfall "E-Rezept markieren" zum Speichern der Information im TI-Flow-Fachdienst die HTTP-Operation PATCH /Task/&lt;id&gt; mit: ACCESS_TOKEN im Authorization-Header, Prescription-ID in URL &lt;id&gt;, FHIR-Ressource im HTTP-Request-Body, ausführen.
</requirement>
