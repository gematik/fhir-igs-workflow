# E-T-Rezept Structure Map for Organization - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for Organization**

## StructureMap: E-T-Rezept Structure Map for Organization 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapOrganization | *Version*:1.0.0-draft |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapOrganization |

 
Mapping-Anweisungen zur Erstellung einer BfArM Organization aus dem VZD SearchSet 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapOrganization",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapOrganization",
  "version" : "1.0.0-draft",
  "name" : "ERPTPrescriptionStructureMapOrganization",
  "title" : "E-T-Rezept Structure Map for Organization",
  "status" : "active",
  "experimental" : false,
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
  "description" : "Mapping-Anweisungen zur Erstellung einer BfArM Organization aus dem VZD SearchSet",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-vzd-searchset",
    "mode" : "source",
    "alias" : "vzdSearchSet"
  },
  {
    "url" : "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-organization",
    "mode" : "target",
    "alias" : "bfarmOrganization"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapOrganization",
    "typeMode" : "none",
    "documentation" : "Mapping-Anweisungen zur Erstellung einer BfArM Organization aus dem VZD SearchSet",
    "input" : [{
      "name" : "vzdSearchSet",
      "type" : "vzdSearchSet",
      "mode" : "source"
    },
    {
      "name" : "bfarmOrganization",
      "type" : "bfarmOrganization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "mapOrganization",
      "source" : [{
        "context" : "vzdSearchSet",
        "element" : "entry",
        "variable" : "srcEntryOrgVar"
      }],
      "rule" : [{
        "name" : "entry",
        "source" : [{
          "context" : "srcEntryOrgVar",
          "element" : "resource",
          "variable" : "srcEntryOrganizationVar",
          "condition" : "ofType(Organization)"
        }],
        "rule" : [{
          "name" : "name",
          "source" : [{
            "context" : "srcEntryOrganizationVar",
            "element" : "name",
            "variable" : "srcOrgNameVar"
          }],
          "target" : [{
            "context" : "bfarmOrganization",
            "contextType" : "variable",
            "element" : "name",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcOrgNameVar"
            }]
          }],
          "documentation" : "Übernimmt den Namen der Organisation aus dem VZD in die BfArM Organization"
        },
        {
          "name" : "tid",
          "source" : [{
            "context" : "srcEntryOrganizationVar",
            "element" : "identifier",
            "variable" : "srcOrgIdentifierVar",
            "condition" : "$this.system='https://gematik.de/fhir/sid/telematik-id'"
          }],
          "target" : [{
            "context" : "bfarmOrganization",
            "contextType" : "variable",
            "element" : "identifier",
            "variable" : "bfarmOrganizationIdentifierVar"
          }],
          "rule" : [{
            "name" : "tidValue",
            "source" : [{
              "context" : "srcOrgIdentifierVar",
              "element" : "value",
              "variable" : "srcOrgIdentifierValueVar",
              "logMessage" : "tgtTidIdentifier"
            }],
            "target" : [{
              "context" : "bfarmOrganizationIdentifierVar",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "https://gematik.de/fhir/sid/telematik-id"
              }]
            },
            {
              "context" : "bfarmOrganizationIdentifierVar",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "srcOrgIdentifierValueVar"
              }]
            },
            {
              "context" : "bfarmOrganization",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "srcOrgIdentifierValueVar"
              }]
            }],
            "documentation" : "Kopiert die Telematik-ID mit korrektem System-Identifier in die Ziel-Organisation"
          }],
          "documentation" : "Mappt die Telematik-ID der Organisation"
        }],
        "documentation" : "Verarbeitet jeden Eintrag im SearchSet"
      }],
      "documentation" : "Mappt Organization-Einträge aus dem VZD SearchSet"
    },
    {
      "name" : "mapHealthcareService",
      "source" : [{
        "context" : "vzdSearchSet",
        "element" : "entry",
        "variable" : "srcEntryHCSVar"
      }],
      "rule" : [{
        "name" : "entry",
        "source" : [{
          "context" : "srcEntryHCSVar",
          "element" : "resource",
          "variable" : "srcEntryHealthcareServiceVar",
          "condition" : "ofType(HealthcareService)"
        }],
        "rule" : [{
          "name" : "telecom",
          "source" : [{
            "context" : "srcEntryHealthcareServiceVar",
            "element" : "telecom",
            "variable" : "srcHcsTelecomVar"
          }],
          "target" : [{
            "context" : "bfarmOrganization",
            "contextType" : "variable",
            "element" : "telecom",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcHcsTelecomVar"
            }]
          }],
          "documentation" : "Übernimmt Kontaktinformationen (Telefon, E-Mail) aus dem HealthcareService in die Organisation"
        }],
        "documentation" : "Verarbeitet HealthcareService-Einträge aus dem SearchSet"
      }],
      "documentation" : "Mappt HealthcareService-Informationen für Kontaktdaten"
    },
    {
      "name" : "mapLocation",
      "source" : [{
        "context" : "vzdSearchSet",
        "element" : "entry",
        "variable" : "srcEntryHCSVar"
      }],
      "rule" : [{
        "name" : "entry",
        "source" : [{
          "context" : "srcEntryHCSVar",
          "element" : "resource",
          "variable" : "srcEntryLocationVar",
          "condition" : "ofType(Location)"
        }],
        "rule" : [{
          "name" : "address",
          "source" : [{
            "context" : "srcEntryLocationVar",
            "element" : "address",
            "variable" : "srcLocationAddressVar"
          }],
          "target" : [{
            "context" : "bfarmOrganization",
            "contextType" : "variable",
            "element" : "address",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcLocationAddressVar"
            }]
          }],
          "documentation" : "Übernimmt die Adressinformationen aus der Location in die Organisation"
        }],
        "documentation" : "Verarbeitet Location-Einträge aus dem SearchSet"
      }],
      "documentation" : "Mappt Location-Informationen für Adressdaten"
    }]
  }]
}

```
