# GEM ERP PR Medication - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Medication**

## Resource Profile: GEM ERP PR Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medication | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxMedication |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Medikament zur Ausgabe des Rezepts 

**Usages:**

* Use this Profile: [GEM ERP PR CloseOperation Input](StructureDefinition-eflow-rx-close-operation-input-parameters.md) and [GEM ERP PR DispenseOperation Input](StructureDefinition-eflow-rx-dispense-operation-input-parameters.md)
* Refer to this Profile: [GEM ERP PR MedicationDispense](StructureDefinition-eflow-rx-medicationdispense.md)
* Examples for this Profile: [Medication/ExampleUnitMedication](Medication-ExampleUnitMedication.md), [Medication/Medication-Kombipackung](Medication-Medication-Kombipackung.md), [Medication/Medication-Rezeptur-FD](Medication-Medication-Rezeptur-FD.md), [Medication/Medication-Rezeptur](Medication-Medication-Rezeptur.md)... Show 4 more, [Medication/Medication-Without-Strength-Code](Medication-Medication-Without-Strength-Code.md), [Medication/Medication-Without-Strength-Numerator](Medication-Medication-Without-Strength-Numerator.md), [Medication/SimpleMedication](Medication-SimpleMedication.md) and [Medication/SumatripanMedication](Medication-SumatripanMedication.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-medication)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-medication.csv), [Excel](StructureDefinition-eflow-rx-medication.xlsx), [Schematron](StructureDefinition-eflow-rx-medication.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-medication",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medication",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxMedication",
  "title" : "GEM ERP PR Medication",
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
  "description" : "Medikament zur Ausgabe des Rezepts",
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Medication",
  "baseDefinition" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Medication.contained",
        "path" : "Medication.contained",
        "short" : "Enthaltene Medications",
        "definition" : "Dieses Feld kann weitere Medication Ressourcen enthalten, die hier gelistet werden. Dies tritt z.B. bei Rezepturen auf."
      },
      {
        "id" : "Medication.extension:isVaccine",
        "path" : "Medication.extension",
        "sliceName" : "isVaccine",
        "mustSupport" : true
      },
      {
        "id" : "Medication.extension:drugCategory",
        "path" : "Medication.extension",
        "sliceName" : "drugCategory",
        "mustSupport" : true
      },
      {
        "id" : "Medication.extension:normSizeCode",
        "path" : "Medication.extension",
        "sliceName" : "normSizeCode",
        "mustSupport" : true
      },
      {
        "id" : "Medication.extension:packaging",
        "path" : "Medication.extension",
        "sliceName" : "packaging",
        "mustSupport" : true
      },
      {
        "id" : "Medication.extension:manufacturingInstructions",
        "path" : "Medication.extension",
        "sliceName" : "manufacturingInstructions",
        "mustSupport" : true
      },
      {
        "id" : "Medication.identifier",
        "path" : "Medication.identifier",
        "short" : "Business-Identifier der Medication",
        "definition" : "Dieses Feld bietet die Möglichkeit, für eine Medikation Business Identifier zu belegen.",
        "comment" : "Gegenüber dem E-Rezept-Fachdienst wird dieser Wert nicht ausgewertet."
      },
      {
        "id" : "Medication.code",
        "path" : "Medication.code",
        "short" : "Code der Medikation",
        "definition" : "Ein Code (oder eine Gruppe von Codes), der dieses Medikament identifiziert, oder eine textuelle Beschreibung, falls kein Code verfügbar ist."
      },
      {
        "id" : "Medication.form",
        "path" : "Medication.form",
        "short" : "Darreichungsform",
        "definition" : "Beschreibt die Darreichungsform des Arzneimittels."
      },
      {
        "id" : "Medication.amount",
        "path" : "Medication.amount",
        "short" : "Menge des Arzneimittels in einer Packung",
        "definition" : "Angabe der Packungsgröße, bzw. der Gesamtmenge der Packung"
      },
      {
        "id" : "Medication.amount.numerator.extension:packagingSize",
        "path" : "Medication.amount.numerator.extension",
        "sliceName" : "packagingSize",
        "mustSupport" : true
      },
      {
        "id" : "Medication.amount.numerator.extension:totalQuantity",
        "path" : "Medication.amount.numerator.extension",
        "sliceName" : "totalQuantity",
        "mustSupport" : true
      },
      {
        "id" : "Medication.ingredient",
        "path" : "Medication.ingredient",
        "short" : "Wirkstoffe",
        "definition" : "Hier können Bestandteile, die Wirkstoffe oder keine Wirkstoffe sind, erfasst werden."
      },
      {
        "id" : "Medication.ingredient.extension:darreichungsform",
        "path" : "Medication.ingredient.extension",
        "sliceName" : "darreichungsform",
        "short" : "Darreichungsform",
        "definition" : "Angabe der Darreichungsform eines Wirkstoffes als string",
        "mustSupport" : true
      },
      {
        "id" : "Medication.ingredient.item[x]:itemCodeableConcept",
        "path" : "Medication.ingredient.item[x]",
        "sliceName" : "itemCodeableConcept",
        "short" : "Wirkstoff kodiert",
        "definition" : "An dieser Stelle können die Informationen des Wirkstoffs in einer kodierten Art und weise angegeben werden.",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Medication.ingredient.item[x]:itemReference",
        "path" : "Medication.ingredient.item[x]",
        "sliceName" : "itemReference",
        "short" : "Wirkstoff Referenz",
        "definition" : "An dieser Stelle können Referenzen zu verlinkten Medikationen angegeben werden.",
        "comment" : "Wird in diesem Profil ausschließlich dafür genutzt, um für Rezepturen und Kombipackungen die Einzelbestandteile unter `.contained` anzugeben",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-pharmaceutical-product",
              "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-pzn-ingredient"
            ],
            "aggregation" : ["contained"]
          }
        ]
      },
      {
        "id" : "Medication.ingredient.strength",
        "path" : "Medication.ingredient.strength",
        "short" : "Wirkstärke",
        "definition" : "Angabe zur Wirkstärke des Wirkstoffs"
      },
      {
        "id" : "Medication.ingredient.strength.extension:amountText",
        "path" : "Medication.ingredient.strength.extension",
        "sliceName" : "amountText",
        "short" : "Angabe der Menge",
        "definition" : "Freitextmenge des Wirkstoffs für klassische lateinische Notationen wie 'ad 100,0' oder 'quantum satis', einschließlich der Einheit.",
        "mustSupport" : true
      },
      {
        "id" : "Medication.batch",
        "path" : "Medication.batch",
        "short" : "Chargeninformationen",
        "definition" : "Informationen, die nur für Packungen gelten (nicht für Produkte)."
      },
      {
        "id" : "Medication.batch.lotNumber",
        "path" : "Medication.batch.lotNumber",
        "short" : "Chargennummer",
        "definition" : "Die zugewiesene Chargennummer einer Charge des angegebenen Produkts."
      },
      {
        "id" : "Medication.batch.expirationDate",
        "path" : "Medication.batch.expirationDate",
        "short" : "Verfallsdatum",
        "definition" : "Wann diese spezielle Charge des Produkts abläuft"
      }
    ]
  }
}

```
