# E-T-Rezept Medication - TIFlow - Datenaustausch BfArM Webdienst v0.9.0

TIFlow - Datenaustausch BfArM Webdienst

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Medication**

## Resource Profile: E-T-Rezept Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-medication | *Version*:0.9.0 |
| Active as of 2025-12-19 | *Computable Name*:ERP_TPrescription_Medication |

 
Medikationsprofil, welches Informationen zum verordneten oder abgegebenen Arzneimittel enthält. 

## Mapping

Folgende Tabellen geben eine grobe Darstellung der Mappings für dieses Profil:

### Mapping von Gematik Medication

**Titel:** E-T-Rezept Structure Map for Medication

**Beschreibung:** Maps GEM ERP Medication to BfArM T-Prescription Medication format

| | | |
| :--- | :--- | :--- |
| `gematikMedication.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert→ übernimmt Wert aus Quellvariable |
| `gematikMedication.contained` | `bfarmMedication.contained` | Kopiert eingebettete Ressourcen (z.B. referenzierte Medications oder Organizations)→ übernimmt Wert aus Quellvariable |
| `gematikMedication.extension` | `bfarmMedication.extension` | Mappt gematik-spezifische Medication-Extensions zu BfArM-Format |
| `gematikMedication.extension [normgroesse]` | `bfarmMedication.extension.url` | Übernimmt die Normgröße-Extension unverändert (deutsche Packungsgrößenangabe N1, N2, N3)→ setzt URL ‘http://fhir.de/StructureDefinition/normgroesse’ |
| `gematikMedication.extension [normgroesse].value` | `bfarmMedication.extension.url.value` | Kopiert den Wert der Normgröße-Extension→ übernimmt Wert aus Quellvariable |
| `gematikMedication.extension [medication-formulation-packaging-extension]` | `bfarmMedication.extension.url` | Übernimmt die gematik-Verpackungs-Extension für Formulierungen→ setzt URL ‘https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension’ |
| `gematikMedication.extension [medication-formulation-packaging-extension].value` | `bfarmMedication.extension.url.value` | Kopiert den Wert der Verpackungs-Extension→ übernimmt Wert aus Quellvariable |
| `gematikMedication.code` | `bfarmMedication.code` | Kopiert den Medikamentencode (PZN oder andere Identifikation) des abgegebenen Arzneimittels→ übernimmt Wert aus Quellvariable |
| `gematikMedication.form` | `bfarmMedication.form` | Übernimmt die Darreichungsform des tatsächlich abgegebenen Arzneimittels→ übernimmt Wert aus Quellvariable |
| `gematikMedication.amount` | `bfarmMedication.amount` | Kopiert die Mengenangaben des abgegebenen Arzneimittels (tatsächlich ausgehändigte Menge)→ übernimmt Wert aus Quellvariable |
| `gematikMedication.ingredient` | `bfarmMedication.ingredient` | Übernimmt Wirkstoffinformationen des abgegebenen Arzneimittels (falls vorhanden)→ übernimmt Wert aus Quellvariable |

### Mapping von KBV PZN Medication

**Titel:** E-T-Rezept Structure Map for KBV PZN Medication

**Beschreibung:** Mapping-Anweisungen zur Transformation von KBV PZN-Medikamenten zu BfArM T-Prescription Format

| | | |
| :--- | :--- | :--- |
| `kbvMedicationPZN.extension` | `bfarmMedication.extension` | Mappt Medication-Extensions von KBV- zu BfArM-Format |
| `kbvMedicationPZN.extension [normgroesse]` | `bfarmMedication.extension.url` | Übernimmt die Normgröße-Extension unverändert (deutsche Packungsgrößenangabe)→ setzt URL ‘http://fhir.de/StructureDefinition/normgroesse’ |
| `kbvMedicationPZN.extension [normgroesse].value` | `bfarmMedication.extension.url.value` | Kopiert den Wert der Normgröße-Extension (N1, N2, N3)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.code` | `bfarmMedication.code` | Kopiert den Medikamentencode (PZN - Pharmazentralnummer) für die eindeutige Identifikation→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.form` | `bfarmMedication.form` | Übernimmt die Darreichungsform (Tabletten, Kapseln, Tropfen, etc.)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount` | `bfarmMedication.amount` | Mappt die Mengenangaben des Fertigarzneimittels (Packungsgröße und Inhalt) |
| `kbvMedicationPZN.amount.denominator` | `bfarmMedication.amount.denominator` | Kopiert den Nenner der Mengenangabe (z.B. ‘1’ für ‘pro Packung’)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator` | `bfarmMedication.amount.numerator` | Mappt den Zähler der Mengenangabe mit allen Details (Wert, Einheit, Extensions) |
| `kbvMedicationPZN.amount.numerator.extension` | `bfarmMedication.amount.numerator.extension` | Transformiert Packungsgrößen-Extensions von KBV- zu gematik-Format |
| `kbvMedicationPZN.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize]` | `bfarmMedication.amount.numerator.extension.url` | Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um→ setzt URL ‘https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension’ |
| `kbvMedicationPZN.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize].value` | `bfarmMedication.amount.numerator.extension.url.value` | Übernimmt den Packungsgrößenwert unverändert→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator.value` | `bfarmMedication.amount.numerator.value` | Kopiert den numerischen Wert der Menge (z.B. ‘20’ für 20 Tabletten)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator.unit` | `bfarmMedication.amount.numerator.unit` | Übernimmt die Mengeneinheit (Stück, ml, g, etc.)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator.system` | `bfarmMedication.amount.numerator.system` | Kopiert das Codesystem für die Mengeneinheit (meist UCUM)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.amount.numerator.code` | `bfarmMedication.amount.numerator.code` | Übernimmt den standardisierten Code für die Mengeneinheit→ übernimmt Wert aus Quellvariable |
| `kbvMedicationPZN.ingredient` | `bfarmMedication.ingredient` | Kopiert Wirkstoffinformationen (bei PZN-Medikamenten meist nicht detailliert angegeben)→ übernimmt Wert aus Quellvariable |

### Mapping von KBV Ingredient Medication

**Titel:** E-T-Rezept Structure Map for KBV Ingredient Medication

**Beschreibung:** Maps KBV-Ingredient ERP Medication to BfArM T-Prescription Medication format

| | | |
| :--- | :--- | :--- |
| `kbvMedicationIngredient.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.form` | `bfarmMedication.form` | Kopiert die gewünschte Darreichungsform für die Wirkstoff-Verordnung (Kapseln, Salbe, Lösung, etc.)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount` | `bfarmMedication.amount` | Mappt die Gesamtmenge der herzustellenden Wirkstoff-Verordnung |
| `kbvMedicationIngredient.amount.denominator` | `bfarmMedication.amount.denominator` | Kopiert den Nenner der Mengenangabe (z.B. ‘1’ für ‘pro Herstellung’)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator` | `bfarmMedication.amount.numerator` | Mappt die detaillierte Mengenangabe |
| `kbvMedicationIngredient.amount.numerator.extension` | `bfarmMedication.amount.numerator.extension` | Transformiert Packungsgrößen-Extensions von KBV- zu gematik-Format für Wirkstoff Verordnung |
| `kbvMedicationIngredient.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize]` | `bfarmMedication.amount.numerator.extension.url` | Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um→ setzt URL ‘https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension’ |
| `kbvMedicationIngredient.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize].value` | `bfarmMedication.amount.numerator.extension.url.value` | Übernimmt den Packungsgrößenwert→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator.value` | `bfarmMedication.amount.numerator.value` | Kopiert den numerischen Wert der Gesamtmenge (z.B. ‘100’ für 100g Salbe)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator.unit` | `bfarmMedication.amount.numerator.unit` | Übernimmt die Mengeneinheit (g, ml, Stück, etc.)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator.system` | `bfarmMedication.amount.numerator.system` | Kopiert das Codesystem für die Mengeneinheit (meist UCUM)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.amount.numerator.code` | `bfarmMedication.amount.numerator.code` | Übernimmt den standardisierten Code für die Mengeneinheit→ übernimmt Wert aus Quellvariable |
| `kbvMedicationIngredient.ingredient` | `bfarmMedication.ingredient` | Kopiert die detaillierten Wirkstoffinformationen mit Konzentrationen und Mengenangaben→ übernimmt Wert aus Quellvariable |

### Mapping von KBV FreeText Medication

**Titel:** E-T-Rezept Structure Map for KBV FreeText Medication

**Beschreibung:** Maps KBV FreeText Medication to BfArM T-Prescription Medication format

| | | |
| :--- | :--- | :--- |
| `kbvMedicationFreeText.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert→ übernimmt Wert aus Quellvariable |
| `kbvMedicationFreeText.code` | `bfarmMedication.code` | Mappt den Medikamentencode mit Freitext-Beschreibung |
| `kbvMedicationFreeText.code.text` | `bfarmMedication.code.text` | Kopiert die Freitext-Bezeichnung des Medikaments (z.B. ‘Aspirin 500mg Tabletten’)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationFreeText.form` | `bfarmMedication.form` | Mappt die Darreichungsform als Freitext |
| `kbvMedicationFreeText.form.text` | `bfarmMedication.form.text` | Übernimmt die Freitext-Darreichungsform (z.B. ‘Tabletten’, ‘Tropfen zum Einnehmen’)→ übernimmt Wert aus Quellvariable |

### Mapping von KBV Compounding Medication

**Titel:** E-T-Rezept Structure Map for KBV Compounding Medication

**Beschreibung:** Mapping-Anweisungen zur Transformation von KBV Rezeptur-Medikamenten zu BfArM T-Prescription Format

| | | |
| :--- | :--- | :--- |
| `kbvMedicationCompounding.extension` | `bfarmMedication.extension` | Mappt Rezeptur-spezifische Extensions von KBV- zu BfArM-Format |
| `kbvMedicationCompounding.extension [KBV_EX_ERP_Medication_Packaging]` | `bfarmMedication.extension.url` | Transformiert KBV-Verpackungs-Extension in gematik-Formulierungs-Verpackungs-Extension→ setzt URL ‘https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension’ |
| `kbvMedicationCompounding.extension [KBV_EX_ERP_Medication_Packaging].value` | `bfarmMedication.extension.url.value` | Übernimmt den Verpackungswert für die Rezeptur→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.id` | `bfarmMedication.id` | Übernimmt die eindeutige Medication-ID unverändert→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.code` | `bfarmMedication.code` | Mappt den Rezeptur-Code mit Bezeichnung |
| `kbvMedicationCompounding.code.text` | `bfarmMedication.code.text` | Kopiert die Bezeichnung der Rezeptur (z.B. ‘Hydrocortison-Salbe 1%’)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.form` | `bfarmMedication.form` | Übernimmt die Darreichungsform der Rezeptur (Salbe, Creme, Kapseln, etc.)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount` | `bfarmMedication.amount` | Mappt die Gesamtmenge der herzustellenden Rezeptur |
| `kbvMedicationCompounding.amount.denominator` | `bfarmMedication.amount.denominator` | Kopiert den Nenner der Mengenangabe (z.B. ‘1’ für ‘pro Rezeptur’)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator` | `bfarmMedication.amount.numerator` | Mappt die detaillierte Mengenangabe der Rezeptur |
| `kbvMedicationCompounding.amount.numerator.extension` | `bfarmMedication.amount.numerator.extension` | Transformiert Packungsgrößen-Extensions für Rezepturen |
| `kbvMedicationCompounding.amount.numerator.extension [KBV_EX_ERP_Medication_PackagingSize]` | `bfarmMedication.amount.numerator.extension.url` | Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um→ setzt URL ‘https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension’ |
| `kbvMedicationCompounding.amount.numerator.extension.value` | `bfarmMedication.amount.numerator.extension.value` | Übernimmt den Packungsgrößenwert für die Rezeptur→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator.value` | `bfarmMedication.amount.numerator.value` | Kopiert den numerischen Wert der Gesamtmenge (z.B. ‘50’ für 50g Salbe)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator.unit` | `bfarmMedication.amount.numerator.unit` | Übernimmt die Mengeneinheit für die Rezeptur (g, ml, Stück, etc.)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator.system` | `bfarmMedication.amount.numerator.system` | Kopiert das Codesystem für die Mengeneinheit (meist UCUM)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.amount.numerator.code` | `bfarmMedication.amount.numerator.code` | Übernimmt den standardisierten Code für die Mengeneinheit→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient` | `bfarmMedication.ingredient` | Mappt die Bestandteile der Rezeptur mit detaillierten Mengen- und Stärkeangaben |
| `kbvMedicationCompounding.ingredient.item` | `bfarmMedication.ingredient.item` | Kopiert die Referenz oder den Code des Rezeptur-Bestandteils→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient.extension` | `bfarmMedication.ingredient.extension` | Transformiert Bestandteil-spezifische Extensions |
| `kbvMedicationCompounding.ingredient.extension [KBV_EX_ERP_Medication_Ingredient_Form]` | `bfarmMedication.ingredient.extension.url` | Wandelt KBV-Bestandteil-Darreichungsform-Extension in gematik-Format um→ setzt URL ‘https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-darreichungsform-extension’ |
| `kbvMedicationCompounding.ingredient.extension [KBV_EX_ERP_Medication_Ingredient_Form].value` | `bfarmMedication.ingredient.extension.url.value` | Übernimmt die Darreichungsform des Bestandteils→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient.strength` | `bfarmMedication.ingredient.strength` | Mappt die Stärke/Konzentration des Bestandteils in der Rezeptur |
| `kbvMedicationCompounding.ingredient.strength.denominator` | `bfarmMedication.ingredient.strength.denominator` | Kopiert den Nenner für die Stärkeangabe (Bezugsmenge)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient.strength.numerator` | `bfarmMedication.ingredient.strength.numerator` | Kopiert den Zähler für die Stärkeangabe (Wirkstoffmenge)→ übernimmt Wert aus Quellvariable |
| `kbvMedicationCompounding.ingredient.strength.extension` | `bfarmMedication.ingredient.strength.extension` | Transformiert Bestandteil-Mengen-Extensions |
| `kbvMedicationCompounding.ingredient.strength.extension [KBV_EX_ERP_Medication_Ingredient_Amount]` | `bfarmMedication.ingredient.strength.extension.url` | Wandelt KBV-Bestandteil-Mengen-Extension in gematik-Format um→ setzt URL ‘https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-amount-extension’ |
| `kbvMedicationCompounding.ingredient.strength.extension [KBV_EX_ERP_Medication_Ingredient_Amount].value` | `bfarmMedication.ingredient.strength.extension.url.value` | Übernimmt die Mengenangabe des Bestandteils→ übernimmt Wert aus Quellvariable |

**Usages:**

* Use this Profile: [Digitaler Durchschlag T-Rezept](StructureDefinition-erp-tprescription-carbon-copy.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.bfarm|current/StructureDefinition/erp-tprescription-medication)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-erp-tprescription-medication.csv), [Excel](StructureDefinition-erp-tprescription-medication.xlsx), [Schematron](StructureDefinition-erp-tprescription-medication.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "erp-tprescription-medication",
  "url" : "https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-medication",
  "version" : "0.9.0",
  "name" : "ERP_TPrescription_Medication",
  "title" : "E-T-Rezept Medication",
  "status" : "active",
  "date" : "2025-12-19",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    },
    {
      "system" : "email",
      "value" : "erp-umsetzung@gematik.de"
    }]
  }],
  "description" : "Medikationsprofil, welches Informationen zum verordneten oder abgegebenen Arzneimittel enthält.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "script10.6",
    "uri" : "http://ncpdp.org/SCRIPT10_6",
    "name" : "Mapping to NCPDP SCRIPT 10.6"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Medication",
  "baseDefinition" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Medication.meta",
      "path" : "Medication.meta",
      "max" : "0"
    },
    {
      "id" : "Medication.implicitRules",
      "path" : "Medication.implicitRules",
      "max" : "0"
    },
    {
      "id" : "Medication.language",
      "path" : "Medication.language",
      "max" : "0"
    },
    {
      "id" : "Medication.text",
      "path" : "Medication.text",
      "max" : "0"
    },
    {
      "id" : "Medication.contained",
      "path" : "Medication.contained",
      "short" : "Enthaltene Medikationen",
      "comment" : "Im Falle einer Rezeptur oder Kombipackung sind die Bestandteile der Rezeptur, bzw. Kombipackung hier als Medications gelistet."
    },
    {
      "id" : "Medication.extension:rxPrescriptionProcessIdentifier",
      "path" : "Medication.extension",
      "sliceName" : "rxPrescriptionProcessIdentifier",
      "max" : "0"
    },
    {
      "id" : "Medication.extension:isVaccine",
      "path" : "Medication.extension",
      "sliceName" : "isVaccine",
      "max" : "0"
    },
    {
      "id" : "Medication.extension:drugCategory",
      "path" : "Medication.extension",
      "sliceName" : "drugCategory",
      "max" : "0"
    },
    {
      "id" : "Medication.extension:manufacturingInstructions",
      "path" : "Medication.extension",
      "sliceName" : "manufacturingInstructions",
      "max" : "0"
    },
    {
      "id" : "Medication.extension:type",
      "path" : "Medication.extension",
      "sliceName" : "type",
      "max" : "0"
    },
    {
      "id" : "Medication.identifier",
      "path" : "Medication.identifier",
      "max" : "0"
    },
    {
      "id" : "Medication.identifier:EPAMedicationUniqueIdentifier",
      "path" : "Medication.identifier",
      "sliceName" : "EPAMedicationUniqueIdentifier",
      "max" : "0"
    },
    {
      "id" : "Medication.identifier:RxOriginatorProcessIdentifier",
      "path" : "Medication.identifier",
      "sliceName" : "RxOriginatorProcessIdentifier",
      "max" : "0"
    },
    {
      "id" : "Medication.status",
      "path" : "Medication.status",
      "max" : "0"
    },
    {
      "id" : "Medication.manufacturer",
      "path" : "Medication.manufacturer",
      "max" : "0"
    },
    {
      "id" : "Medication.batch",
      "path" : "Medication.batch",
      "max" : "0"
    }]
  }
}

```
