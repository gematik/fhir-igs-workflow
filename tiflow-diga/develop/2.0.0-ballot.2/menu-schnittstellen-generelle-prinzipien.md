# Generelle Prinzipien - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* **Generelle Prinzipien**

## Generelle Prinzipien

### Authentisierung

Die Authentisierung von Clientsystemen am TI-Flow-Fachdienst erfolgt über den ZETA Guard.

### FHIR-VZD

Zum Ermitteln der Telematik-ID aus der IKNR des Kostenträgers nutzt der das E-Rezept-FdV den FHIR-VZD. Der Zugriff erfolgt über die FHIRDirectorySearchAPI.

### Kommunikation

Die Zuweisung einer DiGA-Verordnung durch einen Versicherten an den Kostenträger erfolgt per Communication im E-Rezept-FdV. Die Adressierung der Communication erfolgt über die Telematik-ID des Kostenträgers. Der Kostenträger kann vorausgewählt aus einer Liste auswählbar sein. Die Authentisierungsinformationen des Versicherten beinhaltet die IKNR des Kostenträgers. Auf Basis der IKNR wird die Telematik-ID ermittelt. Beim Zuweisen einer DiGA-Verordnungen kann Communication.payload entfallen (Kardinalitaet 0..1).

