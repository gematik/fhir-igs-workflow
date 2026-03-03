
**Titel:** E-T-Rezept Structure Map for KBV FreeText Medication

**Beschreibung:** Maps KBV FreeText Medication to BfArM T-Prescription Medication format

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| `kbvMedicationFreeText.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationFreeText.code` | `bfarmMedication.code` | Mappt den Medikamentencode mit Freitext-Beschreibung |
| `kbvMedicationFreeText.code.text` | `bfarmMedication.code.text` | Kopiert die Freitext-Bezeichnung des Medikaments (z.B. 'Aspirin 500mg Tabletten')<br>→ übernimmt Wert aus Quellvariable |
| `kbvMedicationFreeText.form` | `bfarmMedication.form` | Mappt die Darreichungsform als Freitext |
| `kbvMedicationFreeText.form.text` | `bfarmMedication.form.text` | Übernimmt die Freitext-Darreichungsform (z.B. 'Tabletten', 'Tropfen zum Einnehmen')<br>→ übernimmt Wert aus Quellvariable |
