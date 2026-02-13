# FD-Anforderungen: Query API MedicationDispense

Diese Seite enthaelt die normativen Anforderungen an den E-Rezept-Fachdienst fuer die MedicationDispense-Query-Endpunkte.

<requirement conformance="SHALL" key="IG-ERP-RX-Q-MD-001" title="E-Rezept-Fachdienst - unzulässige Operationen MedicationDispense (A_19400)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource MedicationDispense mittels der HTTP-Operationen PUT, PATCH, HEAD und DELETE sowie POST unterbinden, damit keine unzulässigen Operationen auf den Rezeptdaten ausgeführt werden können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-Q-MD-002" title="E-Rezept-Fachdienst - MedicationDispense abrufen - Rollenprüfung (A_19405-02)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit Dispensierinformationen nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-Q-MD-003" title="E-Rezept-Fachdienst - MedicationDispense abrufen - Filter MedicationDispense auf KVNR des Versicherten (A_19406-01)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense die dem Versicherten zugeordneten MedicationDispense-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, die in MedicationDispense.subject die entsprechende KVNR des begünstigten Patienten referenziert haben, damit ausschließlich Versicherte ihre eigenen Dispensierinformationen einsehen können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-Q-MD-004" title="E-Rezept-Fachdienst - MedicationDispense abrufen - Referenzierung MedicationDispense und Medication (A_26527)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /MedicationDispense sicherstellen, dass alle im zurückgegebenen Search-Bundle enthaltenen Ressourcen mit eindeutig identifizierbaren IDs versehen sind und Referenzen innerhalb des Bundles auf eine Ressource mit einer eindeutigen ID verweisen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-RX-Q-MD-005" title="E-Rezept-Fachdienst - MedicationDispense abrufen - Rückgabe mehrerer MedicationDispenses (A_22070-03)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS im Anwendungsfall "Abgabeinformationen abrufen" die Suche aller Abgabeinformationen zu einer Verordnung mit dem Aufruf GET /MedicationDispense?identifier=https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId|&lt;PrescriptionID&gt; unterstützen und dabei eines oder mehrere MedicationDispense-Objekte in einem Bundle an den Aufrufenden zurückgeben.
</requirement>

Der E-Rezept-Fachdienst soll eine mögliche Konstellation von Bundles im Ergebnis-Bundle auflösen, sodass das Ergebnis-Bundle ausschließlich MedicationDispense-Objekte enthält, unabhängig davon, ob ein oder mehrere dieser Objekte zu je einem Task gehören.
