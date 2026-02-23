# Loeschfristen - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Loeschfristen**

## Loeschfristen

TODO: Löschfristen

Der E-Rezept-Fachdienst realisiert Datensparsamkeit durch automatisches Loeschen abgelaufener oder nicht mehr benoetigter Ressourcen. Dieses Kapitel beschreibt die Loeschfristen und die zugehoerigen Anforderungen.

Der E-Rezept-Fachdienst MUSS einen Task nach Ablauf der Loeschfrist gemaess der folgenden Festlegung automatisch loeschen und das Loeschen in einem AuditEvent fuer den Versicherten nachvollziehbar protokollieren. | Task.status nach Statuswechsel | Loeschfrist | | --- | --- | | draft | 10 Tage nach Statuswechsel | | ready | 10 Tage nach Datum in Task.expiryDate | | in-progress | 100 Tage nach Statuswechsel | | completed | 100 Tage nach Statuswechsel | | cancelled | 10 Tage nach Statuswechsel |

Der E-Rezept-Fachdienst MUSS beim Loeschen eines Task nach Ablauf der Loeschfrist, wenn Task.status = ready oder Task.status = in-progress, die Daten fuer die Loeschinformation des Verordnungsdatensatzes in den ePA Medication Service bereitstellen.

Der E-Rezept-Fachdienst MUSS bei jedem Loeschen eines Tasks alle referenzierten Bundles (QES-Datensatz, Quittungs-Bundle, Dispensierinformationen) ebenfalls loeschen.

Der E-Rezept-Fachdienst MUSS eine gespeicherte Ressource MedicationDispense nach 100 Tagen ab ihrem Erzeugungsdatum MedicationDispense.whenHandedOver automatisch loeschen.

Der E-Rezept-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch loeschen und das Loeschen in einem AuditEvent fuer den Versicherten nachvollziehbar protokollieren. Der E-Rezept-Fachdienst MUSS bei jedem Loeschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls loeschen.

Der E-Rezept-Fachdienst MUSS eine gespeicherte Ressource Communication automatisch loeschen: - ohne eine Referenz auf einen Task in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent, - mit einer Referenz auf einen Task in Communication.basedOn gemaess der Loeschfrist beim Loeschen des Tasks, - mit einer Referenz auf einen ChargeItem in Communication.basedOn nach 100 Tagen ab ihrem Sendedatum Communication.sent.

Der E-Rezept-Fachdienst MUSS eine gespeicherte Ressource AuditEvent nach 3 Jahren ab dem Erzeugungsdatum AuditEvent.recorded innerhalb von einem Monat loeschen.

