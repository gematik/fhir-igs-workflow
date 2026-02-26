# Technische Umsetzung - Systemueberblick - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* **Technische Umsetzung - Systemueberblick**

## Technische Umsetzung - Systemueberblick

Die Einführung der Verordnung von E-T-Rezepten setzt auf die bestehende Infrastruktur der Anwendung E-Rezept auf.

Am Ende des Versorgungsprozesses muss der digitale Durchschlag E-T-Rezept an das BfArM übermittelt werden.

Hierfür stellt das BfArM einen Webdienst bereit, der die Daten entgegennimmt. Der BfArM Webdienst ist keine Komponente der TI. Der E-Rezept-Fachdienst agiert als Client und ruft die benötigten Schnittstellen über das Transportnetz “Internet” auf.

**Abbildung: **Übersicht E-Rezept Komponenten für das E-T-Rezept


