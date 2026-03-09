
Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Device-Query-Endpunkt.

<!-- A_20744 -->
<requirement conformance="SHALL" key="IG-TIFLOW-CORE-302" title="E-Rezept-Fachdienst - Selbstauskunft Device-Informationen" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    	<testProcedure id="Produkttest"/>
  	</actor>
  Der E-Rezept-Fachdienst MUSS über die http-Operation GET /Device dem aufrufenden Clientsystem eine statische Auskunft gemäß der Profilierung der Device-Ressource bereitstellen.
</requirement>
