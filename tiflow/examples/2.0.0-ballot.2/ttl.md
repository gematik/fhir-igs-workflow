# Löschfristen - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* **Löschfristen**

## Löschfristen

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter Ressourcen. Dieses Kapitel beschreibt die Löschfristen und die zugehörigen Anforderungen.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS einen Task nach Ablauf der Löschfrist gemäß der folgenden Festlegung automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.

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

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS beim Löschen eines Task nach Ablauf der Löschfrist, wenn Task.status = "ready" oder Task.status = "in-progress", die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.

funkt. Eignung: Test Produkt/FADer TI-Flow-Fachdienst MUSS bei jedem Löschen eines Tasks alle referenzierten Bundles (QES-Datensatz, Quittungs-Bundle, Dispensierinformationen) ebenfalls löschen.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS eine gespeicherte Ressource MedicationDispense nach 100 Tagen ab ihrem Erzeugungsdatum MedicationDispense.whenHandedOver automatisch löschen.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.

Der TI-Flow-Fachdienst MUSS bei jedem Löschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls löschen, damit die Informationen rund um ein gelöschtes ChargeItem ebenfalls entfernt werden.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS eine gespeicherte Ressource Communication automatisch löschen:
* ohne eine Referenz auf einen Task in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent,
* mit einer Referenz auf einen Task in Communication.basedOn gemäß der Löschfrist beim Löschen des Tasks,
* mit einer Referenz auf einen ChargeItem in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent.

Sich.techn. Eignung: ProduktgutachtenDer TI-Flow-Fachdienst MUSS eine gespeicherte Ressource AuditEvent nach 3 Jahren ab dem Erzeugungsdatum AuditEvent.recorded innerhalb von einem Monat löschen.

