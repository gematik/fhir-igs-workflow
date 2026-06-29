# Operation $reject (Task zurückweisen) - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $reject (Task zurückweisen)**

## Operation $reject (Task zurückweisen)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$reject` gesendet.

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu `$reject`](./op-reject-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [AVS-Anforderungen zu `$reject`](./op-reject-req-avs.md): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu `$reject`](./op-reject-req-ktr.md): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### API Beschreibung

Die konkrete API, wie die Operation zu nutzen ist, ist dem jeweiligen Modul IG zu entnehmen.

### Hinweise

* `$reject`-Operation und direktes nachfolgende `$accept`-Operation sollen nicht als Übergabemechanismus zwischen Apotheken verwendet werden, da dies für Versicherte schwer nachvollziehbare Protokollierung/Notifications erzeugt.
* Im Ergebnis der `$reject`-Operation wird der referenzierte Task auf den aktiven Status ready zurückgesetzt und das `secret` gelöscht. Dementsprechend werden keine Daten an den aufrufenden Client zurückgegeben.

