Generelle Prinzipien

## Authentisierung
Die Authentisierung am E-Rezept-Fachdienst erfolgt ueber ACCESS_TOKEN. Fuer
Kostentraeger wird das Token ueber den zentralen IDP-Dienst ausgestellt. Das
IK des Kostentraegers wird im Token bereitgestellt und dient der Zuweisung.

## FHIR-VZD
Zur Aufloesung der Telematik-ID auf IKNR nutzt der E-Rezept-Fachdienst das
FHIR-VZD. Der Zugriff erfolgt ueber die FHIRDirectorySearchAPI.

## Kommunikation
Die Zuweisung einer DiGA-Verordnung erfolgt per Communication. Fuer DiGA kann
Communication.payload entfallen (Kardinalitaet 0..1).
