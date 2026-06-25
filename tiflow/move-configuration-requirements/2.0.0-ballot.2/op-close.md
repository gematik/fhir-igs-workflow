# Operation $close (Task schließen) - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $close (Task schließen)**

## Operation $close (Task schließen)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$close` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$close`](./op-close-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [AVS-Anforderungen zu `$close`](./op-close-req-avs.md): Anforderungen an das Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu `$close`](./op-close-req-ktr.md): Anforderungen an das Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.

### Hinweise

* `$close` beendet den Workflow verbindlich; danach ist keine weitere inhaltliche Änderung der Dispensierdaten möglich.
* Falls ohne MedicationDispense aufgerufen wird, muss bereits eine gültige `$dispense`-Information gespeichert sein.
* Bei Stapelverarbeitung sind Lastverteilungsregeln einzuhalten.
* Die maximale Dateigröße für die Kommunikation am TI-Flow-Fachdienst beträgt derzeit 1MB. Dies meint den kompletten Request, daher muss der innere ASL-Request etwas kleiner als 1MB sein. Für Verordnungen, die mehrere Abgaben erfordern ist darauf zu achten, dass für mehrere Abgaben einer Charge nur eine MedicationDispense erstellt wird.

