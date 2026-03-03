
**Titel:** E-T-Rezept Structure Map for KBV Compounding Medication

**Beschreibung:** Mapping-Anweisungen zur Transformation von KBV Rezeptur-Medikamenten zu BfArM T-Prescription Format

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `kbvMedicationCompounding.extension` | `bfarmMedication.extension` | Mappt Rezeptur-spezifische Extensions von KBV- zu BfArM-Format |
| `kbvMedicationCompounding.extension [KBV_EX_ERP_Medication_Packaging]` | `bfarmMedication.extension.url` | Transformiert KBV-Verpackungs-Extension in gematik-Formulierungs-Verpackungs-Extension<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension' |
| `kbvMedicationCompounding.extension [KBV_EX_ERP_Medication_Packaging].value` | `bfarmMedication.extension.url.value` | Übernimmt den Verpackungswert für die Rezeptur<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.code` | `bfarmMedication.code` | Mappt den Rezeptur-Code mit Bezeichnung |
| `kbvMedicationCompounding.code.text` | `bfarmMedication.code.text` | Kopiert die Bezeichnung der Rezeptur (z.B. 'Hydrocortison-Salbe 1%')<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.form` | `bfarmMedication.form` | Übernimmt die Darreichungsform der Rezeptur (Salbe, Creme, Kapseln, etc.)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount` | `bfarmMedication.amount` | Mappt die Gesamtmenge der herzustellenden Rezeptur |
| `kbvMedicationCompounding.amount.denominator` | `bfarmMedication.amount.denominator` | Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Rezeptur')<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator` | `bfarmMedication.amount.numerator` | Mappt die detaillierte Mengenangabe der Rezeptur |
| `kbvMedicationCompounding.amount.numerator.extension` | `bfarmMedication.amount.numerator.extension` | Transformiert Packungsgrößen-Extensions für Rezepturen |
| `kbvMedicationCompounding.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize]` | `bfarmMedication.amount.numerator.extension.url` | Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension' |
| `kbvMedicationCompounding.amount.numerator.extension.value` | `bfarmMedication.amount.numerator.extension.value` | Übernimmt den Packungsgrößenwert für die Rezeptur<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator.value` | `bfarmMedication.amount.numerator.value` | Kopiert den numerischen Wert der Gesamtmenge (z.B. '50' für 50g Salbe)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator.unit` | `bfarmMedication.amount.numerator.unit` | Übernimmt die Mengeneinheit für die Rezeptur (g, ml, Stück, etc.)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator.system` | `bfarmMedication.amount.numerator.system` | Kopiert das Codesystem für die Mengeneinheit (meist UCUM)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator.code` | `bfarmMedication.amount.numerator.code` | Übernimmt den standardisierten Code für die Mengeneinheit<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient` | `bfarmMedication.ingredient` | Mappt die Bestandteile der Rezeptur mit detaillierten Mengen- und Stärkeangaben |
| `kbvMedicationCompounding.ingredient.item` | `bfarmMedication.ingredient.item` | Kopiert die Referenz oder den Code des Rezeptur-Bestandteils<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient.extension` | `bfarmMedication.ingredient.extension` | Transformiert Bestandteil-spezifische Extensions |
| `kbvMedicationCompounding.ingredient.extension [KBV_EX_ERP_Medication_Ingredient_Form]` | `bfarmMedication.ingredient.extension.url` | Wandelt KBV-Bestandteil-Darreichungsform-Extension in gematik-Format um<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-darreichungsform-extension' |
| `kbvMedicationCompounding.ingredient.extension [KBV_EX_ERP_Medication_Ingredient_Form].value` | `bfarmMedication.ingredient.extension.url.value` | Übernimmt die Darreichungsform des Bestandteils<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient.strength` | `bfarmMedication.ingredient.strength` | Mappt die Stärke/Konzentration des Bestandteils in der Rezeptur |
| `kbvMedicationCompounding.ingredient.strength.denominator` | `bfarmMedication.ingredient.strength.denominator` | Kopiert den Nenner für die Stärkeangabe (Bezugsmenge)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient.strength.numerator` | `bfarmMedication.ingredient.strength.numerator` | Kopiert den Zähler für die Stärkeangabe (Wirkstoffmenge)<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient.strength.extension` | `bfarmMedication.ingredient.strength.extension` | Transformiert Bestandteil-Mengen-Extensions |
| `kbvMedicationCompounding.ingredient.strength.extension [KBV_EX_ERP_Medication_Ingredient_Amount]` | `bfarmMedication.ingredient.strength.extension.url` | Wandelt KBV-Bestandteil-Mengen-Extension in gematik-Format um<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-amount-extension' |
| `kbvMedicationCompounding.ingredient.strength.extension [KBV_EX_ERP_Medication_Ingredient_Amount].value` | `bfarmMedication.ingredient.strength.extension.url.value` | Übernimmt die Mengenangabe des Bestandteils<br>→ übernimmt Wert aus Quellvariable |
