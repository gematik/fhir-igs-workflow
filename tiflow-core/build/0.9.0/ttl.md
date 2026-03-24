# Löschfristen - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* **Löschfristen**

## Löschfristen

Der TI-Flow-Fachdienst realisiert Datensparsamkeit durch automatisches Löschen abgelaufener oder nicht mehr benötigter Ressourcen. Dieses Kapitel beschreibt die Loöchfristen und die zugehörigen Anforderungen.

Der TI-Flow-Fachdienst MUSS einen Task nach Ablauf der Löschfrist gemäß der folgenden Festlegung automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.

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

Der TI-Flow-Fachdienst MUSS beim Löschen eines Task nach Ablauf der Löschfrist, wenn Task.status = "ready" oder Task.status = "in-progress", die Daten für die Löschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.

Der TI-Flow-Fachdienst MUSS bei jedem Löschen eines Tasks alle referenzierten Bundles (QES-Datensatz, Quittungs-Bundle, Dispensierinformationen) ebenfalls löschen.

Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource MedicationDispense nach 100 Tagen ab ihrem Erzeugungsdatum MedicationDispense.whenHandedOver automatisch löschen.

Der TI-Flow-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren.

Der TI-Flow-Fachdienst MUSS bei jedem Löschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls löschen, damit die Informationen rund um ein gelöschtes ChargeItem ebenfalls entfernt werden.

Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource Communication automatisch löschen:
* ohne eine Referenz auf einen Task in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent,
* mit einer Referenz auf einen Task in Communication.basedOn gemäß der Löschfrist beim Löschen des Tasks,
* mit einer Referenz auf einen ChargeItem in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent.

Der TI-Flow-Fachdienst MUSS eine gespeicherte Ressource AuditEvent nach 3 Jahren ab dem Erzeugungsdatum AuditEvent.recorded innerhalb von einem Monat löschen.

