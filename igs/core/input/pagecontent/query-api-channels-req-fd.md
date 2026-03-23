Diese Seite enthält die normativen Anforderungen an den TI-Flow-Fachdienst für den channels-Endpunkt.

<!-- A_28121 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-55" title="TI-Flow-Fachdienst - unzulässige Operationen Channels" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS alle Zugriffe auf die Ressource Channels mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden, damit keine unzulässigen Operationen auf den Daten ausgeführt werden können.
</requirement>

<!-- A_28117 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-56" title="TI-Flow-Fachdienst - Push Notifications - Channels- OpenApi_Notification_Fachdienst" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS die API mit den Endpunkten GET /channels, GET /channels/{pushkey} und POST /channels/{pushkey} gemäß [OpenAPI_FD] bereitstellen.
</requirement>

<!-- ToDo: [OpenAPI_FD] auflösen -->

### GET /channels
Mit der Operation GET /channels können die verfügbaren Channels abgefragt werden.

<!-- A_28118 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-57" title="TI-Flow-Fachdienst - Push Notifications - Channels abrufen - Rollenprüfung" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>

Mit der Operation GET /channels/{pushkey} können die Channels und deren Konfiguration für eine spezifische FdV-Instanz abgefragt werden.

<!-- A_28119 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-58" title="TI-Flow-Fachdienst - Push Notifications - Channels einer Instanz abrufen - Rollenprüfung" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation GET /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>

### POST /channels

<!-- A_28120 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-59" title="TI-Flow-Fachdienst - Push Notifications - Channels konfigurieren - Rollenprüfung" version="0">
  <meta lockversion="true"/>
  <actor name="TI_Flow_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der TI-Flow-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>
