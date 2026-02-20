# Operation API - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* **Operation API**

## Operation API

Die folgenden Operation APIs stellt der E-Rezept-Fachdienst im RX-Modul bereit.

## Lesereihenfolge

1. Zuerst die moduluebergreifende Basis in eFlow Core:
* [Core: Operation API](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/operation-api.html)

1. Danach die RX-spezifischen Ergaenzungen in diesem Modul.
1. Pro Operation gilt die gleiche Seitenstruktur:
* Nachricht
* Anforderungen an Schnittstelle (FD + Client als Unterseiten)
* API Beschreibung aus CapabilityStatement/OperationDefinition
* Hinweis
* Geschaeftslogik (Ablaufdiagramm)

### E-Rezepte bereitstellen

* Primaersystem: [Operation API: E-Rezept erstellen](./op-create.md)
* Primaersystem: [Operation API: E-Rezept aktivieren](./op-activate.md)
* Primaersystem / Versicherter / Apotheke: [Operation API: E-Rezept loeschen](./op-abort.md)

### E-Rezepte beliefern

* Abgebende LEI / Kostentraeger: [Operation API: Task akzeptieren](./op-accept.md)
* Abgebende LEI / Kostentraeger: [Operation API: Task zurueckweisen](./op-reject.md)
* Abgebende LEI: [Operation API: Dispensierinformationen bereitstellen](./op-dispense.md)
* Abgebende LEI / Kostentraeger: [Operation API: Task schliessen](./op-close.md)

### Mehrfachverordnung (MVO)

Die MVO-Regeln werden ueber die bestehende Operation `$activate` erzwungen und sind auf der Seite [Operation API: E-Rezept aktivieren](./op-activate.md) dokumentiert.

