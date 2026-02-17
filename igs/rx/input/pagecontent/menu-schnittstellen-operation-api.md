Die folgenden Operation APIs stellt der E-Rezept-Fachdienst im RX-Modul bereit.

## Lesereihenfolge

1. Zuerst die moduluebergreifende Basis in eFlow Core:
   - [Core: Operation API](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/operation-api.html)
2. Danach die RX-spezifischen Ergaenzungen in diesem Modul.
3. Pro Operation gilt die gleiche Seitenstruktur:
   - Nachricht
   - Anforderungen an Schnittstelle (FD + Client als Unterseiten)
   - API Beschreibung aus CapabilityStatement/OperationDefinition
   - Hinweis
   - Geschaeftslogik (Ablaufdiagramm)

### E-Rezepte bereitstellen

- Primaersystem: [Operation API: E-Rezept erstellen](./op-create.html)
- Primaersystem: [Operation API: E-Rezept aktivieren](./op-activate.html)
- Primaersystem / Versicherter / Apotheke: [Operation API: E-Rezept loeschen](./op-abort.html)

### E-Rezepte beliefern

- Abgebende LEI / Kostentraeger: [Operation API: Task akzeptieren](./op-accept.html)
- Abgebende LEI / Kostentraeger: [Operation API: Task zurueckweisen](./op-reject.html)
- Abgebende LEI: [Operation API: Dispensierinformationen bereitstellen](./op-dispense.html)
- Abgebende LEI / Kostentraeger: [Operation API: Task schliessen](./op-close.html)

### Mehrfachverordnung (MVO)

Die MVO-Regeln werden ueber die bestehende Operation `$activate` erzwungen und sind auf der Seite [Operation API: E-Rezept aktivieren](./op-activate.html) dokumentiert.
