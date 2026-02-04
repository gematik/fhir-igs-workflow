
**Titel:** E-T-Rezept Structure Map for CarbonCopy

**Beschreibung:** Diese Ressource beschreibt das Mapping und führt die Mappings aller Teilressourcen zusammen. Weitere Informationen und Beschreibungen zum Mapping können auf der Seite [Mapping des digitalen Durchschlag E-T-Rezept](./trezept.html#mapping-des-digitalen-durchschlags-e-t-rezept) eingesehen werden.

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
|  | `erpTCarbonCopy.meta` | Setzt die Metadaten für den digitalen Durchschlag |
|  | `CarbonCopy.meta.profile` | Setzt das meta.profile des digitalen Durchschlags T-Rezept<br>→ setzt URL 'https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-carbon-copy|1.1' |
|  | `CarbonCopy.parameter` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen |
|  | `part` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen |
|  | `part` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen |
|  | `part` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen |
|  | `parameter.name` | Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen<br>→ setzt Wert 'rxPrescription' |
| `bundle.entry` | *(wird bestimmt durch Kontext)* | Verarbeitet alle Einträge des Quell-Bundles für Verschreibungsinformationen |
| `bundle.entry.resource` | *(wird bestimmt durch Kontext)* | Extrahiert relevante Ressourcen für die Verschreibung |
| `bundle.entry.resource [Typ: Task]` | `parameter.name` | Extrahiert die E-Rezept-ID aus dem Task und erstellt den prescriptionId Parameter<br>→ setzt Wert 'prescriptionId' |
| `bundle.entry.resource [Typ: Task]` | `value` | Extrahiert die E-Rezept-ID aus dem Task und erstellt den prescriptionId Parameter<br>→ erstellt neues Identifier |
| `bundle.entry.resource [Typ: Task]` | *(wird bestimmt durch Kontext)* | Mappt Task-Informationen auf Identifier für die Rezept-ID<br>Verwendet Mapping: [Task](./StructureMap-ERPTPrescriptionStructureMapTask.html) |
| `bundle.entry.resource [Typ: MedicationRequest]` | `parameter.name` | Erstellt den medicationRequest Parameter für Verschreibungsdetails<br>→ setzt Wert 'medicationRequest' |
| `bundle.entry.resource [Typ: MedicationRequest]` | `parameter.resource` | Transformiert KBV-MedicationRequest in BfArM MedicationRequest Format<br>→ erstellt neues MedicationRequest |
| `bundle.entry.resource [Typ: MedicationRequest]` | *(wird bestimmt durch Kontext)* | Führt die detaillierte MedicationRequest-Transformation durch<br>Verwendet Mapping: [MedicationRequest](./StructureMap-ERPTPrescriptionStructureMapMedicationRequest.html) |
| `bundle.entry.resource [Typ: MedicationRequest]` | `parameter.name` | Erstellt den medication Parameter für das verschriebene Arzneimittel<br>→ setzt Wert 'medication' |
| `bundle.entry` | *(wird bestimmt durch Kontext)* | Bereitet die Suche nach der referenzierten Medication vor |
| `bundle.entry [Typ: Medication]` | `parameter.resource` | Findet die vom MedicationRequest referenzierte Medication und transformiert sie in BfArM Format<br>→ erstellt neues Medication |
| `bundle.entry [Typ: Medication].resource` | *(wird bestimmt durch Kontext)* | Führt die detaillierte Medication-Transformation für das verschriebene Arzneimittel durch<br>Verwendet Mapping: [Medication](./StructureMap-ERPTPrescriptionStructureMapMedication.html) |
|  | `CarbonCopy.parameter` | Erstellt den rxDispensation Parameter mit allen Abgabeinformationen |
|  | `part` | Erstellt den rxDispensation Parameter mit allen Abgabeinformationen |
|  | `parameter.name` | Erstellt den rxDispensation Parameter mit allen Abgabeinformationen<br>→ setzt Wert 'rxDispensation' |
| `bundle.entry` | *(wird bestimmt durch Kontext)* | Verarbeitet alle Einträge des Quell-Bundles für Abgabeinformationen |
| `bundle.entry.resource` | *(wird bestimmt durch Kontext)* | Extrahiert relevante Ressourcen für die Abgabe |
| `bundle.entry.resource [Typ: Bundle]` | `parameter.name` | Identifiziert VZD SearchSet Bundle für Apothekeninformationen<br>→ setzt Wert 'dispenseOrganization' |
| `bundle.entry.resource [Typ: Bundle]` | `parameter.resource` | Transformiert VZD SearchSet in BfArM Organization Format für die abgebende Apotheke<br>→ erstellt neues Organization |
| `bundle.entry.resource [Typ: Bundle]` | *(wird bestimmt durch Kontext)* | Führt die detaillierte Organization-Transformation durch<br>Verwendet Mapping: [Organization](./StructureMap-ERPTPrescriptionStructureMapOrganization.html) |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part` | Erstellt eine dispenseInformation Part pro abgegebener MedicationDispense |
| `bundle.entry.resource [Typ: MedicationDispense]` | `parameter.part.name` | Bündelt MedicationDispense und zugehörige Medication unter dispenseInformation<br>→ setzt Wert 'dispenseInformation' |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.part` | Bündelt MedicationDispense und zugehörige Medication unter dispenseInformation |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.part` | Bündelt MedicationDispense und zugehörige Medication unter dispenseInformation |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.name.name` | Transformiert gematik MedicationDispense in BfArM MedicationDispense Format<br>→ setzt Wert 'medicationDispense' |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.name.resource` | Transformiert gematik MedicationDispense in BfArM MedicationDispense Format<br>→ erstellt neues MedicationDispense |
| `bundle.entry.resource [Typ: MedicationDispense]` | *(wird bestimmt durch Kontext)* | Führt die detaillierte MedicationDispense-Transformation durch<br>Verwendet Mapping: [MedicationDispense](./StructureMap-ERPTPrescriptionStructureMapMedicationDispense.html) |
| `bundle.entry.resource [Typ: MedicationDispense]` | `part.name.name` | Findet die vom MedicationDispense referenzierte Medication und transformiert sie in BfArM Format<br>→ setzt Wert 'medication' |
| `bundle.entry` | *(wird bestimmt durch Kontext)* | Bereitet die Suche nach der referenzierten Medication im Bundle vor |
| `bundle.entry [Typ: Medication]` | `parameter.resource` | → erstellt neues Medication |
| `bundle.entry [Typ: Medication].resource` | *(wird bestimmt durch Kontext)* | Führt die detaillierte Medication-Transformation für das abgegebene Arzneimittel durch<br>Verwendet Mapping: [Medication](./StructureMap-ERPTPrescriptionStructureMapMedication.html) |
