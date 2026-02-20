# Generelle Prinzipien - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Generelle Prinzipien**

## Generelle Prinzipien

### Generelle Prinzipien

Die RX-Schnittstellen folgen den REST/FHIR-Basisregeln der Fachspezifikation.

Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen fuer die Zugriffe durch Leistungserbringer und Leistungserbringerinstitutionen standardmaessig den MimeType application/fhir+xml akzeptieren und in Responses verwenden.

Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen fuer die Zugriffe durch Versicherte standardmaessig den MimeType application/fhir+json akzeptieren und in Responses verwenden.

Der E-Rezept-Fachdienst MUSS in seinen Schnittstellen einen von der Standardfestlegung abweichenden MimeType umsetzen, wenn der jeweilige Client eine entsprechende Anforderung in der Aufrufschnittstelle ueber den URL-Parameter _format=fhir+xml bzw. _format=fhir+json oder mittels des Accept-Attributs im HTTP-Request-Header als application/fhir+xml bzw. application/fhir+json anfordert.

Der E-Rezept-Fachdienst MUSS an seinen Schnittstellen eine http-GET-Operation auf den Endpunkt /metadata erlauben, in welcher er ein CapabilityStatement gemaess https://www.hl7.org/fhir/capabilitystatement.html veroeffentlicht.

