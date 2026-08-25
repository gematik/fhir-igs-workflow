# Operation API - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* **Operation API**

## Operation API

Die folgenden Operation APIs stellt der TI-Flow-Fachdienst dem **Primärsystem eRP** sowie dem **TI-Flow-Fachdienst** zur Verfügung.

### E-Rezepte bereitstellen

* Primärsystem: [Operation API: E-Rezept erstellen](./op-create.md)
* Primärsystem: [Operation API: E-Rezept aktivieren](./op-activate.md)
* Primärsystem / E-Rezept-FdV: [Operation API: E-Rezept löschen](./op-abort.md)

### E-Rezepte beliefern

* Primärsystem: [Operation API: Task abrufen](./op-accept.md)
* Primärsystem: [Operation API: Task zurückweisen](./op-reject.md)
* Primärsystem: [Operation API: Dispensierinformationen bereitstellen](./op-dispense.md)
* Primärsystem: [Operation API: Task schließen](./op-close.md)

### Verwaltung der Zugriffsberechtigung durch den Versicherten (EU)

* E-Rezept-FdV: [Operation API: Zugriffsberechtigung erstellen](./op-grant-eu-access-permission.md)
* E-Rezept-FdV: [Operation API: Zugriffsberechtigung abfragen](./op-read-eu-access-permission.md)
* E-Rezept-FdV: [Operation API: Zugriffsberechtigung löschen](./op-revoke-eu-access-permission.md)

### Belieferung durch eine Apotheke im europäischen Ausland

* NCPeH: [Operation API: Interaktion NCPeH - Abrufen](./op-get-eu-prescriptions.md)
* NCPeH: [Operation API: Interaktion NCPeH - Abgeben](./op-eu-close.md)

