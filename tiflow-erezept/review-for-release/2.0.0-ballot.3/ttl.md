# Löschfristen - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* **Löschfristen**

## Löschfristen

Dieser IG beschreibt die Löschfristen für E-Rezept-Verordnungen und zugehörige Ressourcen. Diese sind spezifisch für das E-Rezept-Modul definiert, da unterschiedliche Fachdienste unterschiedliche Anforderungen bezüglich Löschfristen, Aufbewahrungsfristen und Ablaufregeln besitzen.

### Löschfristen für E-Rezepte

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter E-Rezept-Ressourcen. Dieses Kapitel beschreibt die Löschfristen und die zugehörigen Anforderungen für das E-Rezept-Modul.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS einen Task mit Flowtype 160, 166, 169, 200 oder 209 nach Ablauf der Löschfrist gemäß der folgenden Festlegung automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.

* Task.status nach Statuswechsel: draft
  * Löschfrist: 10 Tage nach Statuswechsel
* Task.status nach Statuswechsel: ready
  * Löschfrist: 10 Tage nach Datum in Task.expiryDate
* Task.status nach Statuswechsel: in-progress
  * Löschfrist: 100 Tage nach Statuswechsel
* Task.status nach Statuswechsel: completed
  * Löschfrist: 100 Tage nach Statuswechsel
* Task.status nach Statuswechsel: cancelled
  * Löschfrist: 10 Tage nach Statuswechsel

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Löschen eines Task mit Flowtype 160, 166, 169, 200 oder 209 nach Ablauf der Löschfrist, wenn Task.status = "ready" oder Task.status = "in-progress", die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei jedem Löschen eines Tasks mit Flowtype 160, 166, 169, 200 oder 209 alle referenzierten Bundles (QES-Datensatz, Quittungs-Bundle, Dispensierinformationen) ebenfalls löschen.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS eine gespeicherte Ressource MedicationDispense nach 100 Tagen ab ihrem Erzeugungsdatum MedicationDispense.whenHandedOver automatisch löschen.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS eine gespeicherte Ressource Communication automatisch löschen:
* ohne eine Referenz auf einen Task in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent,
* mit einer Referenz auf einen Task mit Flowtype 160, 166, 169, 200 oder 209 in Communication.basedOn gemäß der Löschfrist beim Löschen des Tasks,
* mit einer Referenz auf einen ChargeItem in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent.

