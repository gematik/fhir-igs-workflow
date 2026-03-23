
Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Device-Query-Endpunkt.

<!-- A_19400 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-130" title="E-Rezept-Fachdienst - MedicationDispense - unzulässige Operationen" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
   	<testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource MedicationDispense mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE sowie POST unterbinden, damit keine unzulässigen Operationen auf den Rezeptdaten ausgeführt werden können.
</requirement>

### GET /MedicationDispense

<!-- A_19405-02 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-131" title="E-Rezept-Fachdienst - MedicationDispense abrufen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    	<testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense sicherstellen, dass ausschließlich Nutzer in der Rolle 
  <ul>
    <li>oid_versicherter</li>
  </ul>
  die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit Dispensierinformationen nicht durch Unberechtigte ausgelesen werden können.
</requirement>

 <!-- A_19406-01 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-132" title="E-Rezept-Fachdienst - MedicationDispense abrufen - Filter MedicationDispense auf KVNR des Versicherten" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
   	<testProcedure id="Produktgutachten"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense die dem Versicherten zugeordneten MedicationDispense-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in MedicationDispense.subject die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen Dispensierinformationen einsehen können.
</requirement>

<!-- A_26527 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-133" title="E-Rezept-Fachdienst - MedicationDispense abrufen - Referenzierung MedicationDispense und Medication" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
   	<testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense sicherstellen, dass alle im zurückgegebenen Search-Bundle enthaltenen Ressourcen mit eindeutig identifizierbaren IDs versehen sind und Referenzen innerhalb des Bundles auf eine Ressource mit einer eindeutigen ID verweisen.
</requirement>

<!-- A_22070-03 -->
<requirement conformance="SHALL" key="IG-PRE-TIFLOW-CORE-134" title="E-Rezept-Fachdienst - MedicationDispense abrufen - Rückgabe mehrerer MedicationDispenses" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
   	<testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS im Anwendungsfall "Abgabeinformationen abrufen" die Suche aller Abgabeinformationen zu einer Verordnung mit dem Aufruf GET /MedicationDispense?identifier=https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId|&lt;PrescriptionID&gt; unterstützten und dabei eines oder mehrere MedicationDispense-Objekte in einem Bundle an den Aufrufenden zurückgeben.
</requirement>

Der E-Rezept-Fachdienst soll eine mögliche Konstellation von Bundles im Ergebnis-Bundle auflösen, sodass das Ergebnis-Bundle ausschließlich MedicationDispense-Objekte enthält, unabhängig davon, ob ein oder mehrere dieser Objekte zu je einem Task gehören.