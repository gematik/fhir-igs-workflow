# FD-Anforderungen: Query API Device

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst fuer den Device-Query-Endpunkt.

<!-- A_20744 -->
<requirement conformance="SHALL" key="IG-WF-CORE-87" title="E-Rezept-Fachdienst - Selbstauskunft Device-Informationen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    	<testProcedure id="Produkttest"/>
  	</actor>
  Der E-Rezept-Fachdienst MUSS über die http-Operation GET /Device dem aufrufenden Clientsystem eine statische Auskunft gemäß der Profilierung der Device-Ressource bereitstellen.
</requirement>
