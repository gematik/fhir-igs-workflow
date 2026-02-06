
**Titel:** E-T-Rezept Structure Map for KBV PZN Medication

**Beschreibung:** Mapping-Anweisungen zur Transformation von KBV PZN-Medikamenten zu BfArM T-Prescription Format

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `kbvMedicationPZN.extension` | `bfarmMedication.extension` | Mappt Medication-Extensions von KBV- zu BfArM-Format |
| `kbvMedicationPZN.extension [normgroesse]` | `bfarmMedication.extension.url` | Übernimmt die Normgröße-Extension unverändert (deutsche Packungsgrößenangabe)<br>→ setzt URL 'http://fhir.de/StructureDefinition/normgroesse' |
| `kbvMedicationPZN.extension [normgroesse].value` | `bfarmMedication.extension.url.value` | Kopiert den Wert der Normgröße-Extension (N1, N2, N3)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.code` | `bfarmMedication.code` | Kopiert den Medikamentencode (PZN - Pharmazentralnummer) für die eindeutige Identifikation<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.form` | `bfarmMedication.form` | Übernimmt die Darreichungsform (Tabletten, Kapseln, Tropfen, etc.)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount` | `bfarmMedication.amount` | Mappt die Mengenangaben des Fertigarzneimittels (Packungsgröße und Inhalt) |
| `kbvMedicationPZN.amount.denominator` | `bfarmMedication.amount.denominator` | Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Packung')<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator` | `bfarmMedication.amount.numerator` | Mappt den Zähler der Mengenangabe mit allen Details (Wert, Einheit, Extensions) |
| `kbvMedicationPZN.amount.numerator.extension` | `bfarmMedication.amount.numerator.extension` | Transformiert Packungsgrößen-Extensions von KBV- zu gematik-Format |
| `kbvMedicationPZN.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize]` | `bfarmMedication.amount.numerator.extension.url` | Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension' |
| `kbvMedicationPZN.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize].value` | `bfarmMedication.amount.numerator.extension.url.value` | Übernimmt den Packungsgrößenwert unverändert<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator.value` | `bfarmMedication.amount.numerator.value` | Kopiert den numerischen Wert der Menge (z.B. '20' für 20 Tabletten)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator.unit` | `bfarmMedication.amount.numerator.unit` | Übernimmt die Mengeneinheit (Stück, ml, g, etc.)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator.system` | `bfarmMedication.amount.numerator.system` | Kopiert das Codesystem für die Mengeneinheit (meist UCUM)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator.code` | `bfarmMedication.amount.numerator.code` | Übernimmt den standardisierten Code für die Mengeneinheit<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.ingredient` | `bfarmMedication.ingredient` | Kopiert Wirkstoffinformationen (bei PZN-Medikamenten meist nicht detailliert angegeben)<br>→ übernimmt Wert aus Quellvariable |
