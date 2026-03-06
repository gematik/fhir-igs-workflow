# Verarbeitungsregeln für den E-Rezept-Fachdienst - E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte v1.1.0-draft

E-Rezepte apothekenpflichtiger Arzneimittel für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Systemüberblick**](menu-technische-umsetzung-systemueberblick.md)
* **Verarbeitungsregeln für den E-Rezept-Fachdienst**

## Verarbeitungsregeln für den E-Rezept-Fachdienst

### Löschfristen

Für die Löschfristen des E-Rezepts gelten für Flowtype 200 und 209 die Vorgaben von Flowtype 160.

Der E-Rezept-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren, damit nicht mehr benötigte Informationen gelöscht sind. Der E-Rezept-Fachdienst MUSS bei jedem Löschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls löschen, damit die Informationen rund um ein gelöschtes ChargeItem ebenfalls entfernt werden.

