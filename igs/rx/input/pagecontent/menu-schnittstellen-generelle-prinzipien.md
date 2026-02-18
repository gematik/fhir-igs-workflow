### Generelle Prinzipien

Die RX-Schnittstellen folgen den REST/FHIR-Basisregeln der Fachspezifikation.

<requirement conformance="SHALL" key="IG-TIFlow-RX-139" title="E-Rezept-Fachdienst - RESTful API MimeType fhir+xml (A_19537)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen fuer die Zugriffe durch Leistungserbringer und Leistungserbringerinstitutionen standardmaessig den MimeType application/fhir+xml akzeptieren und in Responses verwenden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-140" title="E-Rezept-Fachdienst - RESTful API MimeType fhir+json (A_19538)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen fuer die Zugriffe durch Versicherte standardmaessig den MimeType application/fhir+json akzeptieren und in Responses verwenden.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-141" title="E-Rezept-Fachdienst - RESTful API MimeType Aufrufparameter (A_19539)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen einen von der Standardfestlegung abweichenden MimeType umsetzen, wenn der jeweilige Client eine entsprechende Anforderung in der Aufrufschnittstelle ueber den URL-Parameter _format=fhir+xml bzw. _format=fhir+json oder mittels des Accept-Attributs im HTTP-Request-Header als application/fhir+xml bzw. application/fhir+json anfordert.
</requirement>

<requirement conformance="SHALL" key="IG-TIFlow-RX-142" title="E-Rezept-Fachdienst - RESTful API CapabilityStatement (A_20171)" version="0">
  <meta lockversion="false"/>
  Der E-Rezept-Fachdienst MUSS an seinen Schnittstellen eine http-GET-Operation auf den Endpunkt /metadata erlauben, in welcher er ein CapabilityStatement gemaess https://www.hl7.org/fhir/capabilitystatement.html veroeffentlicht.
</requirement>
