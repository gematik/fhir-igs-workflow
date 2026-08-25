# Löschfristen - Implementation Guide TIFlow - Abrechnungsinformationen v2.0.0-ballot.3

Implementation Guide

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Löschfristen**

## Löschfristen

Dieser IG beschreibt die Löschfristen für PKV-Abgabedaten (ChargeItem und zugehörige Ressourcen). Diese sind spezifisch für das PKV-Abrechnungsmodul definiert, da unterschiedliche Fachdienste unterschiedliche Anforderungen bezüglich Löschfristen, Aufbewahrungsfristen und Ablaufregeln besitzen.

### Löschfristen für PKV-Abgabedaten

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter PKV-Abrechnungsressourcen. Dieses Kapitel beschreibt die Löschfristen und die zugehörigen Anforderungen für das PKV-Abrechnungsmodul.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS bei jedem Löschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls löschen, damit die Informationen rund um ein gelöschtes ChargeItem ebenfalls entfernt werden.

