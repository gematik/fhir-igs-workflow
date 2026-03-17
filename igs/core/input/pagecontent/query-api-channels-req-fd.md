Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den channels-Endpunkt.

<!-- A_28121 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-48" title="E-Rezept-Fachdienst - unzulässige Operationen Channels" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Channels mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE unterbinden, damit keine unzulässigen Operationen auf den Daten ausgeführt werden können.
</requirement>

<!-- A_28117 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-49" title="E-Rezept-Fachdienst - Push Notifications - Channels- OpenApi_Notification_Fachdienst" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS die API mit den Endpunkten GET /channels, GET /channels/{pushkey} und POST /channels/{pushkey} gemäß [OpenAPI_FD] bereitstellen.
</requirement>

<!-- ToDo: [OpenAPI_FD] auflösen -->

### GET /channels
Mit der Operation GET /channels können die verfügbaren Channels abgefragt werden.

<!-- A_28118 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-50" title="E-Rezept-Fachdienst - Push Notifications - Channels abrufen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /channels die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>

Mit der Operation GET /channels/{pushkey} können die Channels und deren Konfiguration für eine spezifische FdV-Instanz abgefragt werden.

<!-- A_28119 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-51" title="E-Rezept-Fachdienst - Push Notifications - Channels einer Instanz abrufen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>

### POST /channels

<!-- A_28120 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-52" title="E-Rezept-Fachdienst - Push Notifications - Channels konfigurieren - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation POST /channels/{pushkey} die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation aufrufen, damit die Operation nicht durch unberechtigte Dritte ausgeführt wird.
</requirement>
