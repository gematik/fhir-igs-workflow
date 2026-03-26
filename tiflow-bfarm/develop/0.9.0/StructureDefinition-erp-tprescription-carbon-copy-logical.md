# Logisches Modell digitaler Durchschlag E-T-Rezept - TIFlow - Datenaustausch BfArM Webdienst v0.9.0

TIFlow - Datenaustausch BfArM Webdienst

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Logisches Modell digitaler Durchschlag E-T-Rezept**

## Logical Model: Logisches Modell digitaler Durchschlag E-T-Rezept 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-carbon-copy-logical | *Version*:0.9.0 |
| Draft as of 2026-03-26 | *Computable Name*:ERP_TPrescription_CarbonCopy_Logical |

 
Logical Model zur Abbildung der im digitalen Durchschlag E-T-Rezept erforderlichen fachlichen Informationen. 

# Logisches Fachmodell

Diese Ressource bildet die fachlichen Informationen ab, die vom TI-Flow-Fachdienst an das BfArM T-Register übertragen werden.

Diese Informationen sind auch im Feature Dokument der gemF_eRp_eThalidomid#5.7.2 abgebildet.

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.bfarm|current/StructureDefinition/erp-tprescription-carbon-copy-logical)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-erp-tprescription-carbon-copy-logical.csv), [Excel](StructureDefinition-erp-tprescription-carbon-copy-logical.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "erp-tprescription-carbon-copy-logical",
  "url" : "https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-carbon-copy-logical",
  "version" : "0.9.0",
  "name" : "ERP_TPrescription_CarbonCopy_Logical",
  "title" : "Logisches Modell digitaler Durchschlag E-T-Rezept",
  "status" : "draft",
  "date" : "2026-03-26T07:15:10+00:00",
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
  "description" : "Logical Model zur Abbildung der im digitalen Durchschlag E-T-Rezept erforderlichen fachlichen Informationen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-carbon-copy-logical",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "erp-tprescription-carbon-copy-logical",
      "path" : "erp-tprescription-carbon-copy-logical",
      "short" : "Logisches Modell digitaler Durchschlag E-T-Rezept",
      "definition" : "Logical Model zur Abbildung der im digitalen Durchschlag E-T-Rezept erforderlichen fachlichen Informationen."
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.datumSignatur",
      "path" : "erp-tprescription-carbon-copy-logical.datumSignatur",
      "short" : "Zeitpunkt der Signatur",
      "definition" : "Zeitpunkt der Signatur",
      "comment" : "Dieses Datum wird aus der QES Signatur 1.2.840.113549.1.9.5 signingTime herangezogen und muss in ein FHIR Instant Datenformat überführt werden.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rezeptID",
      "path" : "erp-tprescription-carbon-copy-logical.rezeptID",
      "short" : "E-Rezept-ID",
      "definition" : "E-Rezept-ID",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung",
      "short" : "Angaben zum verordneten Medikament",
      "definition" : "Angaben zum verordneten Medikament",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.bezeichnung",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.bezeichnung",
      "short" : "Bezeichnung Fertigarzneimittel/Wirkstoff ODER Rezeptur (verordnet). Je nach dem welcher Rezepttyp angewandt wurde liegt diese Angabe als Freitext oder strukturiert vor.",
      "definition" : "Bezeichnung Fertigarzneimittel/Wirkstoff ODER Rezeptur (verordnet). Je nach dem welcher Rezepttyp angewandt wurde liegt diese Angabe als Freitext oder strukturiert vor.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.wirkstaerke",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.wirkstaerke",
      "short" : "Wirkstärke (verordnetes Arzneimittel)",
      "definition" : "Wirkstärke (verordnetes Arzneimittel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Ratio"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.darreichungsform",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.darreichungsform",
      "short" : "Darreichungsform (verordnetes Arzneimittel)",
      "definition" : "Darreichungsform (verordnetes Arzneimittel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.menge",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.menge",
      "short" : "Menge (verordnetes Arzneimittel)",
      "definition" : "Menge (verordnetes Arzneimittel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Ratio"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.dosierung",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.dosierung",
      "short" : "Dosierung (verordnetes Arzneimittel)",
      "definition" : "Dosierung (verordnetes Arzneimittel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Dosage"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.reichdauer",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.reichdauer",
      "short" : "Reichdauer (verordnetes Arzneimittel)",
      "definition" : "Reichdauer (verordnetes Arzneimittel)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen",
      "short" : "Bestätigungen des Arztes nach §3a Abs. 2, 5 AMVV",
      "definition" : "Bestätigungen des Arztes nach §3a Abs. 2, 5 AMVV",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.bestaetigungSicherheitsmassnahmen",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.bestaetigungSicherheitsmassnahmen",
      "short" : "Bestätigung Sicherheitsmaßnahmen (T-Rezept)",
      "definition" : "Bestätigung Sicherheitsmaßnahmen (T-Rezept)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.aushaendigungInformationsmaterialien",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.aushaendigungInformationsmaterialien",
      "short" : "Aushändigung Informationsmaterialien (T-Rezept)",
      "definition" : "Aushändigung Informationsmaterialien (T-Rezept)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.offLabelUse",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.offLabelUse",
      "short" : "Behandlung außerhalb der zugelassenen Anwendungsgebiete (Off-Label)",
      "definition" : "Behandlung außerhalb der zugelassenen Anwendungsgebiete (Off-Label)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.gebaerfaehigeFrau",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.gebaerfaehigeFrau",
      "short" : "Verschreibung für gebärfähige Frau",
      "definition" : "Verschreibung für gebärfähige Frau",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.erklaerungSachkenntnis",
      "path" : "erp-tprescription-carbon-copy-logical.rxVerordnung.rxTRezeptBestaetigungen.erklaerungSachkenntnis",
      "short" : "Bestätigung der Sachkenntnis",
      "definition" : "Bestätigung der Sachkenntnis",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxAbgabe",
      "path" : "erp-tprescription-carbon-copy-logical.rxAbgabe",
      "short" : "Angaben zum abgegeben Medikament",
      "definition" : "Angaben zum abgegeben Medikament",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxAbgabe.bezeichnung",
      "path" : "erp-tprescription-carbon-copy-logical.rxAbgabe.bezeichnung",
      "short" : "Bezeichnung Fertigarzneimittel/Wirkstoff ODER Rezeptur (abgegeben). Diese Angabe kann als Freitext oder strukturiert vorliegen.",
      "definition" : "Bezeichnung Fertigarzneimittel/Wirkstoff ODER Rezeptur (abgegeben). Diese Angabe kann als Freitext oder strukturiert vorliegen.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxAbgabe.wirkstaerke",
      "path" : "erp-tprescription-carbon-copy-logical.rxAbgabe.wirkstaerke",
      "short" : "Wirkstärke (abgegebenes Arzneimittel)",
      "definition" : "Wirkstärke (abgegebenes Arzneimittel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Ratio"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxAbgabe.darreichungsform",
      "path" : "erp-tprescription-carbon-copy-logical.rxAbgabe.darreichungsform",
      "short" : "Darreichungsform (abgegebenes Arzneimittel)",
      "definition" : "Darreichungsform (abgegebenes Arzneimittel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxAbgabe.menge",
      "path" : "erp-tprescription-carbon-copy-logical.rxAbgabe.menge",
      "short" : "Menge (abgegebenes Arzneimittel)",
      "definition" : "Menge (abgegebenes Arzneimittel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Ratio"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxAbgabe.dosierung",
      "path" : "erp-tprescription-carbon-copy-logical.rxAbgabe.dosierung",
      "short" : "Dosierung (abgegebenes Arzneimittel)",
      "definition" : "Dosierung (abgegebenes Arzneimittel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Dosage"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.rxAbgabe.datumAbgabe",
      "path" : "erp-tprescription-carbon-copy-logical.rxAbgabe.datumAbgabe",
      "short" : "Datum der Abgabe im Format YYYY-MM-DD",
      "definition" : "Datum der Abgabe im Format YYYY-MM-DD",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke",
      "path" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke",
      "short" : "Angaben zur Abgebenden Apotheke",
      "definition" : "Angaben zur Abgebenden Apotheke",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke.telematikIDApotheke",
      "path" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke.telematikIDApotheke",
      "short" : "Telematik-ID der Apotheke",
      "definition" : "Telematik-ID der Apotheke",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke.nameApotheke",
      "path" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke.nameApotheke",
      "short" : "Name der Apotheke",
      "definition" : "Name der Apotheke",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke.anschriftApotheke",
      "path" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke.anschriftApotheke",
      "short" : "Anschrift der Apotheke",
      "definition" : "Anschrift der Apotheke",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Address"
      }]
    },
    {
      "id" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke.telefonnummerApotheke",
      "path" : "erp-tprescription-carbon-copy-logical.AngabeAbgebendeApotheke.telefonnummerApotheke",
      "short" : "Telefonnummer der Apotheke",
      "definition" : "Telefonnummer der Apotheke",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "ContactPoint"
      }]
    }]
  }
}

```
