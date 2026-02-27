# Identifier Telematik-ID - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Identifier Telematik-ID**

## Data Type Profile: Identifier Telematik-ID 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/StructureDefinition/identifier-telematik-id | *Version*:1.1.0-draft |
| Draft as of 2026-02-27 | *Computable Name*:IdentifierTelematikId |

 
Identifier profil für die Telematik-ID 

**Usages:**

* Use this DataType Profile: [GEM_ERPCHRG_PR_ChargeItem](StructureDefinition-GEM-ERPCHRG-PR-ChargeItem.md), [Reply on change Request on ChargeItem from pharmacy to Patient](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReply.md) and [Request for Modification on ChargeItem](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReq.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-chargeitem|current/StructureDefinition/identifier-telematik-id)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-identifier-telematik-id.csv), [Excel](StructureDefinition-identifier-telematik-id.xlsx), [Schematron](StructureDefinition-identifier-telematik-id.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "identifier-telematik-id",
  "url" : "https://gematik.de/fhir/erpchrg/StructureDefinition/identifier-telematik-id",
  "version" : "1.1.0-draft",
  "name" : "IdentifierTelematikId",
  "title" : "Identifier Telematik-ID",
  "status" : "draft",
  "date" : "2026-02-27T14:50:48+00:00",
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
  "description" : "Identifier profil für die Telematik-ID",
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
      "fixedUri" : "https://gematik.de/fhir/sid/telematik-id"
    }]
  }
}

```
