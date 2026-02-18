Wenn die Telematik-ID des KTR des Versicherten nicht im Programmcode hinterlegt wird,
muss diese zur Laufzeit bestimmt werden. Hierfür nutzt das E-Rezept-FdV das IKNR des
KTR, wodurch es dann in der Lage ist nach der Telematik-ID im FHIRVZD zu suchen.

<!-- Quelle: A_26009 -E-Rezept-FdV: optional: Kostenträger suchen -->
<requirement conformance="MAY" key="IG-TIFlow-DiGA-NEU" title="E-Rezept-FdV: optional: Kostenträger suchen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-FdV">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das E-Rezept-FdV KANN den Anwendungsfall "Kostenträger suchen" umsetzen.
</requirement>

<!-- Quelle: A_26010 - E-Rezept-FdV: Kostenträger suchen - IKNR aus ACCESS_TOKEN beziehen -->
<requirement conformance="MAY" key="IG-TIFlow-DiGA-NEU" title="E-Rezept-FdV: Kostenträger suchen - IKNR aus ACCESS_TOKEN beziehen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-FdV">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das E-Rezept-FdV SOLL im Anwendungsfall "Kostenträger suchen" die IKNR des Kostenträgers des Nutzers aus dem ACCESS_TOKEN claim "organizationIK" ermitteln.
</requirement>

<!-- Quelle: A_26011 -E-Rezept-FdV: Kostenträger suchen - Telematik-ID im
Verzeichnisdienst suchen -->
<requirement conformance="SHOULD" key="IG-TIFlow-DiGA-NEU" title="E-Rezept-FdV: Kostenträger suchen - Telematik-ID im Verzeichnisdienst suchen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-FdV">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das E-Rezept-FdV SOLL im Anwendungsfall "Kostenträger suchen", wenn die IKNR des Kostenträgers des Nutzers verfügbar ist, zur Ermittlung der Telematik-ID des Kostenträgers des Nutzers folgende Suchabfrage am FHIRVZD durchführen:
  - Abfrage der Ressource "HealthcareService"
  - HealthcareServices, deren Organisation aktiv sind
  - HealthcareServices, deren Organisation den Typ-oid "1.2.276.0.76.4.59" haben
  - HealthcareServices, deren Organisation einen Identifier vom Typ "IKNR" haben
  - HealthcareServices, deren Organisation eine IKNR mit IKNR aus dem ACCESS_TOKEN enthält
  - HealthcareServices, deren Organisation einen Identifier vom Typ "Telematik-ID" haben
  - Einbeziehen der Organisation in das Rückgabeergebnis
</requirement>

Als Antwort erhält das E-Rezept-FdV ein Suchset mit mindestens 2 Ressourcen: eine oder mehrere HealthcareServices und genau eine Organization Ressource. Die Organization Ressource enthält dann einen identifier mit identifier.type == "PRN". Dieser identifier enthält die Telematik-ID unter identifier.value.

Falls das E-Rezept-FdV nicht in der Lage ist die IKNR oder die Telematik-ID des
Kostenträgers des Nutzers zu ermitteln, soll der Nutzer die Möglichkeit haben den
Kostenträger manuell zu bestimmen.

Der Nutzer soll eine Liste aller Kostenträger, denen eine DiGA zugewiesen werden kann, zur Auswahl angezeigt bekommen.

<!-- Quelle: A_26012 - E-Rezept-FdV: Kostenträger Suchen - Liste verfügbarer Kostenträger ermitteln -->
<requirement conformance="SHOULD" key="IG-TIFlow-DiGA-NEU" title="E-Rezept-FdV: Kostenträger Suchen - Liste verfügbarer Kostenträger ermitteln" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-FdV">
    <testProcedure id="Herstellererklärung"/>
  </actor>
  Das E-Rezept-FdV SOLL im Anwendungsfall "Kostenträger suchen", wenn die IKNR oder Telematik-ID des Kostenträgers des Nutzers nicht verfügbar ist, die Liste aller Kostenträger aus dem Verzeichnisdienst ermitteln, indem an den Verzeichnisdienst folgende Abfrage gestellt wird:
  - Abfrage der Ressource "HealthcareService"
  - HealthcareServices, deren Organisation aktiv sind
  - HealthcareServices, deren Organisation den Typ-oid "1.2.276.0.76.4.59" haben
  - HealthcareServices, deren Organisation einen Identifier vom Typ "IKNR" haben
  - HealthcareServices, deren Organisation einen Identifier vom Typ "Telematik-ID" haben
  - Einbeziehen der Organisation in das Rückgabeergebnis
</requirement>

Als Antwort erhält das E-Rezept-FdV ein Suchset mit mehreren HealthcareServices und mehreren Organizations. Dem Nutzer ist dann eine Liste der Organizations anzuzeigen
und zu verarbeiten:
- Organization.name enthält den Namen der Krankenkasse
- Organzation.identifier:Telematik-ID enthält die Telematik-ID an die die Communication gesendet werden muss
