Generelle Prinzipien

## Authentisierung
Die Authentisierung am Workflow-Fachdienst erfolgt über ACCESS_TOKEN. Für
Kostenträger wird das Token über den zentralen IDP-Dienst ausgestellt. Das
IK des Kostenträgers wird im Token bereitgestellt und dient der Zuweisung.

## FHIR-VZD
Zur Auflösung der Telematik-ID auf IKNR nutzt der Workflow-Fachdienst den
FHIR-VZD. Der Zugriff erfolgt über die FHIRDirectorySearchAPI.

## Kommunikation
Die Zuweisung einer DiGA-Verordnung durc einen Versicherten an den Kostenträger erfolgt per Communication im E-Rezept-FdV. Beim Zuweisen von DiGA-Verordnungen kann
Communication.payload entfallen (Kardinalitaet 0..1).
