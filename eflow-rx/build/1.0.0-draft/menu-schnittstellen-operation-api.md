# Operation API - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Operation API**

## Operation API

Die folgenden Operation APIs stellt der E-Rezept-Fachdienst im RX-Modul bereit.

## Lesereihenfolge

1. Zuerst die modulübergreifende Basis in eFlow Core:
* [Core: Operation API](https://gemspec.gematik.de/ig/fhir/1.0.0operation-api.html)

1. Danach die RX-spezifischen Ergänzungen in diesem Modul.
1. Pro Operation gilt die gleiche Seitenstruktur:
* Nachricht
* Anforderungen an Schnittstelle (FD + Client als Unterseiten)
* API Beschreibung aus CapabilityStatement/OperationDefinition
* Hinweis
* Geschäftslogik (Ablaufdiagramm)

### E-Rezepte bereitstellen

* Primärsystem: [Operation API: E-Rezept erstellen](./op-create.md)
* Primärsystem: [Operation API: E-Rezept aktivieren](./op-activate.md)
* Primärsystem / Versicherter / Apotheke: [Operation API: E-Rezept löschen](./op-abort.md)

### E-Rezepte beliefern

* Abgebende LEI / Kostenträger: [Operation API: Task akzeptieren](./op-accept.md)
* Abgebende LEI / Kostenträger: [Operation API: Task zurückweisen](./op-reject.md)
* Abgebende LEI: [Operation API: Dispensierinformationen bereitstellen](./op-dispense.md)
* Abgebende LEI / Kostenträger: [Operation API: Task schließen](./op-close.md)

### Mehrfachverordnung (MVO)

Die MVO-Regeln werden über die bestehende Operation `$activate` erzwungen und sind auf der Seite [Operation API: E-Rezept aktivieren](./op-activate.md) dokumentiert.

