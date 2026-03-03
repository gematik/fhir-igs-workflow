# Identifier KVID-10 - Abrechnungsinformationen für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Identifier KVID-10**

## Data Type Profile: Identifier KVID-10 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/StructureDefinition/identifier-kvid-10 | *Version*:1.1.0-draft |
| Draft as of 2026-03-03 | *Computable Name*:IdentifierKvid10 |

 
Identifier profil für die Krankenversichertennummer (KVID-10) 

**Usages:**

* Use this DataType Profile: [GEM_ERPCHRG_PR_ChargeItem](StructureDefinition-GEM-ERPCHRG-PR-ChargeItem.md), [Reply on change Request on ChargeItem from pharmacy to Patient](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReply.md), [Request for Modification on ChargeItem](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReq.md) and [GEM_ERPCHRG_PR_Consent](StructureDefinition-GEM-ERPCHRG-PR-Consent.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-chargeitem|current/StructureDefinition/identifier-kvid-10)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-identifier-kvid-10.csv), [Excel](StructureDefinition-identifier-kvid-10.xlsx), [Schematron](StructureDefinition-identifier-kvid-10.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "identifier-kvid-10",
  "url" : "https://gematik.de/fhir/erpchrg/StructureDefinition/identifier-kvid-10",
  "version" : "1.1.0-draft",
  "name" : "IdentifierKvid10",
  "title" : "Identifier KVID-10",
  "status" : "draft",
  "date" : "2026-03-03T23:41:56+00:00",
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
  "description" : "Identifier profil für die Krankenversichertennummer (KVID-10)",
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
      "fixedUri" : "http://fhir.de/sid/gkv/kvid-10"
    }]
  }
}

```
