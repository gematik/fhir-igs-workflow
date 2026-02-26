# E-T-Rezept Organization - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Organization**

## Resource Profile: E-T-Rezept Organization 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-organization | *Version*:1.0.0 |
| Active as of 2025-12-19 | *Computable Name*:ERP_TPrescription_Organization |

 
Angaben zur Apotheke, die das T-Rezept beliefert hat. 

## Mapping

Folgende Tabelle gibt eine grobe Darstellung des Mappings für dieses Profil:

**Titel:** E-T-Rezept Structure Map for Organization

**Beschreibung:** Mapping-Anweisungen zur Erstellung einer BfArM Organization aus dem VZD SearchSet

| | | |
| :--- | :--- | :--- |
| `vzdSearchSet.entry` | **(wird bestimmt durch Kontext)** | Mappt Organization-Einträge aus dem VZD SearchSet |
| `vzdSearchSet.entry.resource [Typ: Organization]` | **(wird bestimmt durch Kontext)** | Verarbeitet jeden Eintrag im SearchSet |
| `vzdSearchSet.entry.resource [Typ: Organization].name` | `bfarmOrganization.name` | Übernimmt den Namen der Organisation aus dem VZD in die BfArM Organization→ übernimmt Wert aus Quellvariable |
| `vzdSearchSet.entry.resource [Typ: Organization].identifier [Bedingung: $this.system='https://gematik.de/fhir/sid/telematik-id']` | `bfarmOrganization.identifier` | Mappt die Telematik-ID der Organisation |
| `vzdSearchSet.entry.resource [Typ: Organization].identifier [Bedingung: $this.system='https://gematik.de/fhir/sid/telematik-id'].value` | `bfarmOrganization.identifier.system` | Kopiert die Telematik-ID mit korrektem System-Identifier in die Ziel-Organisation→ setzt URL ‘https://gematik.de/fhir/sid/telematik-id’ |
| `vzdSearchSet.entry.resource [Typ: Organization].identifier [Bedingung: $this.system='https://gematik.de/fhir/sid/telematik-id'].value` | `bfarmOrganization.identifier.value` | Kopiert die Telematik-ID mit korrektem System-Identifier in die Ziel-Organisation→ übernimmt Wert aus Quellvariable |
| `vzdSearchSet.entry.resource [Typ: Organization].identifier [Bedingung: $this.system='https://gematik.de/fhir/sid/telematik-id'].value` | `bfarmOrganization.id` | Kopiert die Telematik-ID mit korrektem System-Identifier in die Ziel-Organisation→ übernimmt Wert aus Quellvariable |
| `vzdSearchSet.entry` | **(wird bestimmt durch Kontext)** | Mappt HealthcareService-Informationen für Kontaktdaten |
| `vzdSearchSet.entry.resource [Typ: HealthcareService]` | **(wird bestimmt durch Kontext)** | Verarbeitet HealthcareService-Einträge aus dem SearchSet |
| `vzdSearchSet.entry.resource [Typ: HealthcareService].telecom` | `bfarmOrganization.telecom` | Übernimmt Kontaktinformationen (Telefon, E-Mail) aus dem HealthcareService in die Organisation→ übernimmt Wert aus Quellvariable |
| `vzdSearchSet.entry` | **(wird bestimmt durch Kontext)** | Mappt Location-Informationen für Adressdaten |
| `vzdSearchSet.entry.resource [Typ: Location]` | **(wird bestimmt durch Kontext)** | Verarbeitet Location-Einträge aus dem SearchSet |
| `vzdSearchSet.entry.resource [Typ: Location].address` | `bfarmOrganization.address` | Übernimmt die Adressinformationen aus der Location in die Organisation→ übernimmt Wert aus Quellvariable |

**Usages:**

* Use this Profile: [Digitaler Durchschlag T-Rezept](StructureDefinition-erp-tprescription-carbon-copy.md)
* Examples for this Profile: [Stadt-Apotheke](Organization-ExampleOrganization-T.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.erp-t-prescription|current/StructureDefinition/erp-tprescription-organization)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-erp-tprescription-organization.csv), [Excel](StructureDefinition-erp-tprescription-organization.xlsx), [Schematron](StructureDefinition-erp-tprescription-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "erp-tprescription-organization",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-organization",
  "version" : "1.0.0",
  "name" : "ERP_TPrescription_Organization",
  "title" : "E-T-Rezept Organization",
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
  "description" : "Angaben zur Apotheke, die das T-Rezept beliefert hat.",
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
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "https://gematik.de/fhir/ti/StructureDefinition/ti-organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:IKNR",
      "path" : "Organization.identifier",
      "sliceName" : "IKNR",
      "max" : "1"
    },
    {
      "id" : "Organization.active",
      "path" : "Organization.active",
      "max" : "0"
    },
    {
      "id" : "Organization.type",
      "path" : "Organization.type",
      "max" : "0"
    },
    {
      "id" : "Organization.type:providerType",
      "path" : "Organization.type",
      "sliceName" : "providerType",
      "max" : "0"
    },
    {
      "id" : "Organization.type:profession",
      "path" : "Organization.type",
      "sliceName" : "profession",
      "max" : "0"
    },
    {
      "id" : "Organization.alias",
      "path" : "Organization.alias",
      "max" : "0"
    },
    {
      "id" : "Organization.telecom",
      "path" : "Organization.telecom",
      "mustSupport" : true
    },
    {
      "id" : "Organization.partOf",
      "path" : "Organization.partOf",
      "max" : "0"
    },
    {
      "id" : "Organization.contact",
      "path" : "Organization.contact",
      "max" : "0"
    },
    {
      "id" : "Organization.endpoint",
      "path" : "Organization.endpoint",
      "max" : "0"
    }]
  }
}

```
