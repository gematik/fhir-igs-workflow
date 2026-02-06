
**Titel:** E-T-Rezept Structure Map for KBV Ingredient Medication

**Beschreibung:** Maps KBV-Ingredient ERP Medication to BfArM T-Prescription Medication format

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `kbvMedicationIngredient.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.form` | `bfarmMedication.form` | Kopiert die gewünschte Darreichungsform für die Wirkstoff-Verordnung (Kapseln, Salbe, Lösung, etc.)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount` | `bfarmMedication.amount` | Mappt die Gesamtmenge der herzustellenden Wirkstoff-Verordnung |
| `kbvMedicationIngredient.amount.denominator` | `bfarmMedication.amount.denominator` | Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Herstellung')<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator` | `bfarmMedication.amount.numerator` | Mappt die detaillierte Mengenangabe |
| `kbvMedicationIngredient.amount.numerator.extension` | `bfarmMedication.amount.numerator.extension` | Transformiert Packungsgrößen-Extensions von KBV- zu gematik-Format für Wirkstoff Verordnung |
| `kbvMedicationIngredient.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize]` | `bfarmMedication.amount.numerator.extension.url` | Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension' |
| `kbvMedicationIngredient.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize].value` | `bfarmMedication.amount.numerator.extension.url.value` | Übernimmt den Packungsgrößenwert<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator.value` | `bfarmMedication.amount.numerator.value` | Kopiert den numerischen Wert der Gesamtmenge (z.B. '100' für 100g Salbe)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator.unit` | `bfarmMedication.amount.numerator.unit` | Übernimmt die Mengeneinheit (g, ml, Stück, etc.)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator.system` | `bfarmMedication.amount.numerator.system` | Kopiert das Codesystem für die Mengeneinheit (meist UCUM)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator.code` | `bfarmMedication.amount.numerator.code` | Übernimmt den standardisierten Code für die Mengeneinheit<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.ingredient` | `bfarmMedication.ingredient` | Kopiert die detaillierten Wirkstoffinformationen mit Konzentrationen und Mengenangaben<br>→ übernimmt Wert aus Quellvariable |
