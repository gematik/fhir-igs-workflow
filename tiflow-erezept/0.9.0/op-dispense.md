# Operation $dispense (Dispensierinformationen bereitstellen) - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Operation API**](menu-schnittstellen-operation-api.md)
* **Operation $dispense (Dispensierinformationen bereitstellen)**

## Operation $dispense (Dispensierinformationen bereitstellen)

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$dispense` gesendet.

### Anforderungen an Schnittstelle

* [FD-Anforderungen zu `$dispense`](./op-dispense-req-fd.md): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
* [AVS-Anforderungen zu `$dispense`](./op-dispense-req-avs.md): Anforderungen an das AVS zur Nutzung der Schnittstelle.

### API Beschreibung

Die API-Beschreibung für den Aufruf der Operation findet sich auf:

* [API-ERP: E-Rezept Abgabe zeitnah dokumentieren](https://github.com/gematik/api-erp/blob/master/docs/erp_abrufen.adoc#e-rezept-abgabe-vollziehen)

### Hinweis

* Wiederholte Aufrufe von `$dispense` überschreiben die bisher gespeicherten Dispensierinformationen.
* Deshalb muss immer die vollständige, aktuelle MedicationDispense übermittelt werden.

