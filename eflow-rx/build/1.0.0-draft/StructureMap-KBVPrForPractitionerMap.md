# KBVPrForPractitionerMap - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **KBVPrForPractitionerMap**

## StructureMap: KBVPrForPractitionerMap 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrForPractitionerMap | *Version*:1.0.0-draft |
| Active as of 2026-02-02 | *Computable Name*:KBVPrForPractitionerMap |

 

| | | |
| :--- | :--- | :--- |
| Auto-generated StructureMap for KBV_PR_FOR_Practitioner | 1.3.0 -> PractitionerDirectory | 1.0.0 |

 

### Feld-Mappings

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRFORPractitioner.meta` | `PractitionerDirectory.meta.profile` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory` |
| `KBVPRFORPractitioner.name` | `PractitionerDirectory.name` | Manuell | Zum Erzeugen von name.text siehe Transformationsregel F_011 | Quelle: Practitioner.name.text |
| `KBVPRFORPractitioner.qualification` | `PractitionerDirectory.qualification` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: Practitioner.qualification:ASV-Fachgruppennummer |
| `KBVPRFORPractitioner.qualification` | `PractitionerDirectory.qualification` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: Practitioner.qualification:Berufsbezeichnung |
| `KBVPRFORPractitioner.qualification` | `PractitionerDirectory.qualification` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: Practitioner.qualification:Typ |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "KBVPrForPractitionerMap",
  "url" : "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrForPractitionerMap",
  "version" : "1.0.0-draft",
  "name" : "KBVPrForPractitionerMap",
  "status" : "active",
  "date" : "2026-02-02",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Auto-generated StructureMap for KBV_PR_FOR_Practitioner|1.3.0 -> PractitionerDirectory|1.0.0",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "structure" : [
    {
      "url" : "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner",
      "mode" : "source",
      "alias" : "KBVPRFORPractitioner"
    },
    {
      "url" : "https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory",
      "mode" : "target",
      "alias" : "PractitionerDirectory"
    }
  ],
  "group" : [
    {
      "name" : "KBVPrForPractitionerMap",
      "typeMode" : "types",
      "documentation" : "Mapping generated for KBV_PR_FOR_Practitioner|1.3.0 -> PractitionerDirectory|1.0.0",
      "input" : [
        {
          "name" : "KBVPRFORPractitioner",
          "type" : "KBVPRFORPractitioner",
          "mode" : "source"
        },
        {
          "name" : "PractitionerDirectory",
          "type" : "PractitionerDirectory",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "PractitionerIdentifierdd7a4a22",
          "source" : [
            {
              "context" : "KBVPRFORPractitioner",
              "element" : "identifier",
              "variable" : "srcKBVPRFORPractitionerIdentifierd46d78b7",
              "condition" : "(use = 'official' and system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR') != true and (use = 'official' and system = 'http://fhir.de/sid/kzbv/zahnarztnummer') != true"
            }
          ],
          "target" : [
            {
              "context" : "PractitionerDirectory",
              "contextType" : "variable",
              "element" : "identifier",
              "variable" : "tgtPractitionerDirectoryIdentifierbcb1f07a",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcKBVPRFORPractitionerIdentifierd46d78b7"
                }
              ]
            }
          ],
          "documentation" : "Automatic copy"
        },
        {
          "name" : "PractitionerIdentifierAnr071fb4ee",
          "source" : [
            {
              "context" : "KBVPRFORPractitioner",
              "element" : "identifier",
              "variable" : "srcKBVPRFORPractitionerIdentifierAnr3c836155",
              "condition" : "use = 'official' and system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR'"
            }
          ],
          "target" : [
            {
              "context" : "PractitionerDirectory",
              "contextType" : "variable",
              "element" : "identifier",
              "variable" : "tgtPractitionerDirectoryIdentifierLanrc79324c3",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcKBVPRFORPractitionerIdentifierAnr3c836155"
                }
              ]
            }
          ],
          "documentation" : "Copied to 'Practitioner.identifier:LANR'"
        },
        {
          "name" : "PractitionerIdentifierTelematikId649b0852",
          "source" : [
            {
              "context" : "KBVPRFORPractitioner",
              "element" : "identifier",
              "variable" : "srcKBVPRFORPractitionerIdentifierTelematikId908b03d1",
              "condition" : "system = 'https://gematik.de/fhir/sid/telematik-id'"
            }
          ],
          "target" : [
            {
              "context" : "PractitionerDirectory",
              "contextType" : "variable",
              "element" : "identifier",
              "variable" : "tgtPractitionerDirectoryIdentifierTelematikid34e15dac",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcKBVPRFORPractitionerIdentifierTelematikId908b03d1"
                }
              ]
            }
          ],
          "documentation" : "Copied to 'Practitioner.identifier:TelematikID'"
        },
        {
          "name" : "PractitionerMeta472c1c84",
          "source" : [
            {
              "context" : "KBVPRFORPractitioner",
              "element" : "meta",
              "variable" : "srcKBVPRFORPractitionerMeta0287aadd"
            }
          ],
          "target" : [
            {
              "context" : "PractitionerDirectory",
              "contextType" : "variable",
              "element" : "meta",
              "variable" : "tgtPractitionerDirectoryMeta2975339a",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Meta"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "PractitionerMetaProfile969fe928",
              "source" : [
                {
                  "context" : "srcKBVPRFORPractitionerMeta0287aadd",
                  "variable" : "srcPractitionerMetaProfile969fe928"
                }
              ],
              "target" : [
                {
                  "context" : "tgtPractitionerDirectoryMeta2975339a",
                  "contextType" : "variable",
                  "element" : "profile",
                  "variable" : "tgtPractitionerMetaProfile969fe928",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory"
                    }
                  ]
                }
              ],
              "documentation" : "Fixed value 'https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory'"
            }
          ],
          "documentation" : "Automatic copy"
        },
        {
          "name" : "PractitionerName9470411e",
          "source" : [
            {
              "context" : "KBVPRFORPractitioner",
              "element" : "name",
              "variable" : "srcKBVPRFORPractitionerNamef7e47166"
            }
          ],
          "target" : [
            {
              "context" : "PractitionerDirectory",
              "contextType" : "variable",
              "element" : "name",
              "variable" : "tgtPractitionerDirectoryName0e536837",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcKBVPRFORPractitionerNamef7e47166"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "PractitionerNameText82d0e3bd",
              "source" : [
                {
                  "context" : "srcKBVPRFORPractitionerNamef7e47166",
                  "variable" : "manualsrcPractitionerNameText82d0e3bd"
                }
              ],
              "target" : [
                {
                  "context" : "tgtPractitionerDirectoryName0e536837",
                  "contextType" : "variable",
                  "variable" : "manualtgtPractitionerNameText82d0e3bd"
                }
              ],
              "documentation" : "Manual action required | Zum Erzeugen von name.text siehe Transformationsregel F_011 | Quelle: Practitioner.name.text"
            }
          ],
          "documentation" : "Automatic copy"
        },
        {
          "name" : "PractitionerQualificationAsvFachgruppennummer7aa26f1b",
          "source" : [
            {
              "context" : "KBVPRFORPractitioner",
              "element" : "qualification",
              "variable" : "srcKBVPRFORPractitionerQualificationAsvFachgruppennummerb1380ba4"
            }
          ],
          "target" : [
            {
              "context" : "PractitionerDirectory",
              "contextType" : "variable",
              "element" : "qualification",
              "variable" : "tgtPractitionerDirectoryQualificationAsvFachgruppennummer4a060b7"
            }
          ],
          "documentation" : "Feld wird nicht gemappt | Quelle: Practitioner.qualification:ASV-Fachgruppennummer"
        },
        {
          "name" : "PractitionerQualificationBerufsbezeichnung7f1bb5ba",
          "source" : [
            {
              "context" : "KBVPRFORPractitioner",
              "element" : "qualification",
              "variable" : "srcKBVPRFORPractitionerQualificationBerufsbezeichnung73ee1d30"
            }
          ],
          "target" : [
            {
              "context" : "PractitionerDirectory",
              "contextType" : "variable",
              "element" : "qualification",
              "variable" : "tgtPractitionerDirectoryQualificationBerufsbezeichnunge66b35f5"
            }
          ],
          "documentation" : "Feld wird nicht gemappt | Quelle: Practitioner.qualification:Berufsbezeichnung"
        },
        {
          "name" : "PractitionerQualificationTyp5a2d4c78",
          "source" : [
            {
              "context" : "KBVPRFORPractitioner",
              "element" : "qualification",
              "variable" : "srcKBVPRFORPractitionerQualificationTypb285cc3e"
            }
          ],
          "target" : [
            {
              "context" : "PractitionerDirectory",
              "contextType" : "variable",
              "element" : "qualification",
              "variable" : "tgtPractitionerDirectoryQualificationTypcf13b062"
            }
          ],
          "documentation" : "Feld wird nicht gemappt | Quelle: Practitioner.qualification:Typ"
        }
      ]
    }
  ]
}

```
