Die folgenden Operation APIs stellt der E-Rezept-Fachdienst im RX-Modul bereit.

## Lesereihenfolge

1. Zuerst die modulübergreifende Basis in eFlow Core:
   - [Core: Operation API](https://gemspec.gematik.de/ig/fhir/eflow-core/latest/operation-api.html)
2. Danach die RX-spezifischen Ergänzungen in diesem Modul.
3. Pro Operation gilt die gleiche Seitenstruktur:
   - Nachricht
   - Anforderungen an Schnittstelle (FD + Client als Unterseiten)
   - API Beschreibung aus CapabilityStatement/OperationDefinition
   - Hinweis
   - Geschäftslogik (Ablaufdiagramm)

### E-Rezepte bereitstellen

- Primärsystem: [Operation API: E-Rezept erstellen](./op-create.html)
- Primärsystem: [Operation API: E-Rezept aktivieren](./op-activate.html)
- Primärsystem / Versicherter / Apotheke: [Operation API: E-Rezept löschen](./op-abort.html)

### E-Rezepte beliefern

- Abgebende LEI / Kostenträger: [Operation API: Task akzeptieren](./op-accept.html)
- Abgebende LEI / Kostenträger: [Operation API: Task zurückweisen](./op-reject.html)
- Abgebende LEI: [Operation API: Dispensierinformationen bereitstellen](./op-dispense.html)
- Abgebende LEI / Kostenträger: [Operation API: Task schließen](./op-close.html)

### Mehrfachverordnung (MVO)

Die MVO-Regeln werden über die bestehende Operation `$activate` erzwungen und sind auf der Seite [Operation API: E-Rezept aktivieren](./op-activate.html) dokumentiert.
