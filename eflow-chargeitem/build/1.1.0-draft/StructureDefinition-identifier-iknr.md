# Identifier IKNR - Abrechnungsinformationen für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Identifier IKNR**

## Data Type Profile: Identifier IKNR 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/StructureDefinition/identifier-iknr | *Version*:1.1.0-draft |
| Draft as of 2026-03-04 | *Computable Name*:IdentifierIknr |

 
Identifier profil für die Institutionskennzeichen-Nummer (IKNR) 

**Usages:**

* Use this DataType Profile: [GEM_ERPCHRG_PR_Consent](StructureDefinition-GEM-ERPCHRG-PR-Consent.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-chargeitem|current/StructureDefinition/identifier-iknr)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-identifier-iknr.csv), [Excel](StructureDefinition-identifier-iknr.xlsx), [Schematron](StructureDefinition-identifier-iknr.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "identifier-iknr",
  "url" : "https://gematik.de/fhir/erpchrg/StructureDefinition/identifier-iknr",
  "version" : "1.1.0-draft",
  "name" : "IdentifierIknr",
  "title" : "Identifier IKNR",
  "status" : "draft",
  "date" : "2026-03-04T10:52:48+00:00",
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
  "description" : "Identifier profil für die Institutionskennzeichen-Nummer (IKNR)",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Identifier",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Identifier",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Identifier.system",
      "path" : "Identifier.system",
      "fixedUri" : "http://fhir.de/sid/arge-ik/iknr"
    }]
  }
}

```
