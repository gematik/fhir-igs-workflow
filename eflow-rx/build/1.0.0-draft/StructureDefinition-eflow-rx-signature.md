# EFlowRxSignature - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **EFlowRxSignature**

## Data Type Profile: EFlowRxSignature 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-signature | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxSignature |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Profil für die Signatur von Bundles im E-Rezept-Kontext 

**Usages:**

* Use this DataType Profile: [GEM ERP PR Bundle](StructureDefinition-eflow-rx-bundle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-signature)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-signature.csv), [Excel](StructureDefinition-eflow-rx-signature.xlsx), [Schematron](StructureDefinition-eflow-rx-signature.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-signature",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-signature",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxSignature",
  "title" : "EFlowRxSignature",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
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
  "description" : "Profil für die Signatur von Bundles im E-Rezept-Kontext",
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
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Signature",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Signature",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Signature.type",
        "path" : "Signature.type",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        },
        "max" : "1",
        "mustSupport" : true,
        "binding" : {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName",
              "valueString" : "SignatureType"
            }
          ],
          "strength" : "required",
          "description" : "An indication of the reason that an entity signed the object.",
          "valueSet" : "http://hl7.org/fhir/ValueSet/signature-type"
        }
      },
      {
        "id" : "Signature.type:AuthorsSignature",
        "path" : "Signature.type",
        "sliceName" : "AuthorsSignature",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Signature.type:AuthorsSignature.system",
        "path" : "Signature.type.system",
        "fixedUri" : "urn:iso-astm:E1762-95:2013"
      },
      {
        "id" : "Signature.type:AuthorsSignature.code",
        "path" : "Signature.type.code",
        "min" : 1,
        "fixedCode" : "1.2.840.10065.1.12.1.1"
      },
      {
        "id" : "Signature.type:VerificationSignature",
        "path" : "Signature.type",
        "sliceName" : "VerificationSignature",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Signature.type:VerificationSignature.system",
        "path" : "Signature.type.system",
        "fixedUri" : "urn:iso-astm:E1762-95:2013"
      },
      {
        "id" : "Signature.type:VerificationSignature.code",
        "path" : "Signature.type.code",
        "min" : 1,
        "fixedCode" : "1.2.840.10065.1.12.1.5"
      },
      {
        "id" : "Signature.when",
        "path" : "Signature.when",
        "mustSupport" : true
      },
      {
        "id" : "Signature.who",
        "path" : "Signature.who",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-device"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Signature.who.reference",
        "path" : "Signature.who.reference",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Signature.sigFormat",
        "path" : "Signature.sigFormat",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Signature.data",
        "path" : "Signature.data",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
