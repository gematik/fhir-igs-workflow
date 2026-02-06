
**Titel:** E-T-Rezept Structure Map for MedicationDispense

**Beschreibung:** Mapping-Anweisungen zur Transformation von gematik ERP MedicationDispense zu BfArM T-Prescription MedicationDispense

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `gematikMedicationDispense.extension [GeneratedDosageInstructionsMeta]` | `bfarmMedicationDispense.extension` | Kopiert Dosage Metadata Extension<br>→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.extension [extension-MedicationDispense.renderedDosageInstruction]` | `bfarmMedicationDispense.extension` | Kopiert RenderedDosageText<br>→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.dosageInstruction` | `bfarmMedicationDispense.dosageInstruction` | Übernimmt die Dosierungsanweisungen aus der ursprünglichen Abgabe für den digitalen Durchschlag<br>→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.whenHandedOver` | `bfarmMedicationDispense.whenHandedOver` | Kopiert das Abgabedatum zur Dokumentation des Zeitpunkts der Medikamentenausgabe<br>→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.medication` | `bfarmMedicationDispense.medication` | Kopiert die Medikamentenreferenz - das referenzierte Medication wird separat gemappt<br>→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.status` | `bfarmMedicationDispense.status` | Setzt den Status auf 'completed' da die Abgabe bereits erfolgt ist (digitaler Durchschlag)<br>→ setzt Wert 'completed' |
| `gematikMedicationDispense.quantity` | `bfarmMedicationDispense.quantity` | Übernimmt die abgegebene Menge zur Dokumentation der tatsächlich ausgehändigten Medikamentenmenge<br>→ übernimmt Wert aus Quellvariable |
| `gematikMedicationDispense.performer` | `bfarmMedicationDispense.performer` | Transformiert Apotheken-Identifier zu Organization-Referenz für eindeutige Zuordnung der abgebenden Apotheke |
| `gematikMedicationDispense.performer.actor` | `bfarmMedicationDispense.performer.actor` | Verarbeitet den Actor (abgebende Apotheke) des Performers |
| `gematikMedicationDispense.performer.actor.identifier` | *(wird bestimmt durch Kontext)* | Extrahiert den Identifier der abgebenden Apotheke |
| `gematikMedicationDispense.performer.actor.identifier.value` | `reference` | Wandelt Apotheken-Identifier in Organization-Referenz um (Organization/<telematik-id>) |
