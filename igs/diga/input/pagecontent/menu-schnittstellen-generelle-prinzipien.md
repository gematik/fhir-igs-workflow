Generelle Prinzipien

## Authentisierung
Die Authentisierung am E-Rezept-Fachdienst erfolgt über ACCESS_TOKEN. Für
Kostenträger wird das Token über den zentralen IDP-Dienst ausgestellt. 

## FHIR-VZD
Zum Ermitteln der Telematik-ID aus der IKNR des Kostenträgers nutzt der das E-Rezept-FdV den
FHIR-VZD. Der Zugriff erfolgt über die FHIRDirectorySearchAPI.

## Kommunikation
Die Zuweisung einer DiGA-Verordnung durch einen Versicherten an den Kostenträger erfolgt per Communication im E-Rezept-FdV. 
Die Adressierung der Communication erfolgt über die Telematik-ID des Kostenträgers. Der ACCESS_TOKEN des Versicherten beinhaltet die IKNR des Kostenträgers. Auf Basis der IKNR wird die Telematik-ID ermittelt. 
Beim Zuweisen einer DiGA-Verordnungen kann Communication.payload entfallen (Kardinalitaet 0..1).
