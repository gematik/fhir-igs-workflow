# Löschfristen - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* **Löschfristen**

## Löschfristen

Dieser IG beschreibt die Löschfristen für DiGA-Verordnungen und zugehörige Ressourcen. Diese sind spezifisch für das DiGA-Modul definiert, da unterschiedliche Fachdienste unterschiedliche Anforderungen bezüglich Löschfristen, Aufbewahrungsfristen und Ablaufregeln besitzen.

### Löschfristen für DiGA-Verordnungen

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter DiGA-Ressourcen. Dieses Kapitel beschreibt die Löschfristen und die zugehörigen Anforderungen für das DiGA-Modul.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS einen Task mit Flowtype 162 nach Ablauf der Löschfrist gemäß der folgenden Festlegung automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.

* Task.status nach Statuswechsel: draft
  * Löschfrist: 10 Tage nach Statuswechsel
* Task.status nach Statuswechsel: ready
  * Löschfrist: 10 Tage nach Datum in Task.expiryDate
* Task.status nach Statuswechsel: in-progress
  * Löschfrist: 30 Tage nach Statuswechsel
* Task.status nach Statuswechsel: completed
  * Löschfrist: 30 Tage nach Statuswechsel
* Task.status nach Statuswechsel: cancelled
  * Löschfrist: 10 Tage nach Statuswechsel

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei jedem Löschen eines Tasks mit Flowtype 162 alle referenzierten Bundles ebenfalls löschen.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS eine gespeicherte Ressource Communication automatisch löschen:
* ohne eine Referenz auf einen Task in Communication.basedOn nach 30 Tagen ab ihrem Sendedatum Communication.sent,
* mit einer Referenz auf einen Task mit Flowtype 162 in Communication.basedOn gemäß der Löschfrist beim Löschen des Tasks.

