
**Titel:** E-T-Rezept Structure Map for Medication

**Beschreibung:** Router-Mapping zur Auswahl der korrekten Medication-Transformation basierend auf dem KBV/gematik Profil

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |
|------------------------|---------------------|-------------------------------|
| ` [Bedingung: meta.profile.contains('KBV_PR_ERP_Medication_PZN')]` | *(wird bestimmt durch Kontext)* | Erkennt PZN-basierte Medikamente und leitet an spezialisiertes PZN-Mapping weiter |
| ` [Bedingung: meta.profile.contains('KBV_PR_ERP_Medication_PZN')]` | *(wird bestimmt durch Kontext)* | Führt die Transformation für PZN-Medikamente durch (Fertigarzneimittel mit Pharmazentralnummer)<br>Verwendet Mapping: [KBVPZNMedication](./StructureMap-ERPTPrescriptionStructureMapKBVPZNMedication.html) |
| ` [Bedingung: meta.profile.contains('KBV_PR_ERP_Medication_FreeText')]` | *(wird bestimmt durch Kontext)* | Erkennt Freitext-Medikamente und leitet an spezialisiertes FreeText-Mapping weiter |
| ` [Bedingung: meta.profile.contains('KBV_PR_ERP_Medication_FreeText')]` | *(wird bestimmt durch Kontext)* | Führt die Transformation für Freitext-Medikamente durch (nicht standardisierte Arzneimittelangaben)<br>Verwendet Mapping: [KBVFreeTextMedication](./StructureMap-ERPTPrescriptionStructureMapKBVFreeTextMedication.html) |
| ` [Bedingung: meta.profile.contains('KBV_PR_ERP_Medication_Ingredient')]` | *(wird bestimmt durch Kontext)* | Erkennt wirkstoffbasierte Medikamente und leitet an spezialisiertes Ingredient-Mapping weiter |
| ` [Bedingung: meta.profile.contains('KBV_PR_ERP_Medication_Ingredient')]` | *(wird bestimmt durch Kontext)* | Führt die Transformation für wirkstoffbasierte Medikamente durch (Rezeptur nach Wirkstoffen)<br>Verwendet Mapping: [KBVIngredientMedication](./StructureMap-ERPTPrescriptionStructureMapKBVIngredientMedication.html) |
| ` [Bedingung: meta.profile.contains('KBV_PR_ERP_Medication_Compounding')]` | *(wird bestimmt durch Kontext)* | Erkennt Rezeptur-Medikamente und leitet an spezialisiertes Compounding-Mapping weiter |
| ` [Bedingung: meta.profile.contains('KBV_PR_ERP_Medication_Compounding')]` | *(wird bestimmt durch Kontext)* | Führt die Transformation für Rezeptur-Medikamente durch (individuell hergestellte Arzneimittel)<br>Verwendet Mapping: [KBVCompoundingMedication](./StructureMap-ERPTPrescriptionStructureMapKBVCompoundingMedication.html) |
| ` [Bedingung: meta.profile.contains('GEM_ERP_PR_Medication')]` | *(wird bestimmt durch Kontext)* | Erkennt gematik-Medikamente und leitet an spezialisiertes gematik-Mapping weiter |
| ` [Bedingung: meta.profile.contains('GEM_ERP_PR_Medication')]` | *(wird bestimmt durch Kontext)* | Führt die Transformation für gematik-Medikamente durch (abgegebene Arzneimittel aus der Apotheke)<br>Verwendet Mapping: [GEMMedication](./StructureMap-ERPTPrescriptionStructureMapGEMMedication.html) |
