# GEM ERP PR EU CloseOperation Input - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR EU CloseOperation Input**

## Resource Profile: GEM ERP PR EU CloseOperation Input 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input | *Version*:0.9.0 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_PAR_CloseOperation_Input |

 
This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU 

**Usages:**

* Examples for this Profile: [Parameters/ExampleEUCloseInputParameters](Parameters-ExampleEUCloseInputParameters.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.xborder|current/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-PAR-Close-Operation-Input",
  "url" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input",
  "version" : "0.9.0",
  "name" : "GEM_ERPEU_PR_PAR_CloseOperation_Input",
  "title" : "GEM ERP PR EU CloseOperation Input",
  "status" : "active",
  "date" : "2026-01-08",
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
  "description" : "This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Parameters",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Parameters",
      "path" : "Parameters"
    },
    {
      "id" : "Parameters.parameter",
      "path" : "Parameters.parameter",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "name"
        }],
        "rules" : "closed"
      },
      "min" : 5,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation",
      "path" : "Parameters.parameter",
      "sliceName" : "rxDispensation",
      "min" : 1,
      "max" : "*",
      "constraint" : [{
        "key" : "erp-eu-parameters-close-dispense-medication-references",
        "severity" : "error",
        "human" : "If a reference from a MedicationDispense to a Medication exists, the reference must resolve to the Medication.",
        "expression" : "part.where(name = 'medicationDispense').resource.medication.ofType(Reference).reference.exists() implies ((part.where(name = 'medicationDispense').resource.medication.reference.split('/').last().split(':').last()) = (part.where(name = 'medication').resource.id))",
        "source" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input"
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "rxDispensation",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part",
      "path" : "Parameters.parameter.part",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "name"
        }],
        "rules" : "closed"
      },
      "min" : 2,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medicationDispense",
      "path" : "Parameters.parameter.part",
      "sliceName" : "medicationDispense",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "medicationDispense",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.resource",
      "path" : "Parameters.parameter.part.resource",
      "min" : 1,
      "type" : [{
        "code" : "MedicationDispense",
        "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-MedicationDispense"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medicationDispense.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication",
      "path" : "Parameters.parameter.part",
      "sliceName" : "medication",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "medication",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication.resource",
      "path" : "Parameters.parameter.part.resource",
      "min" : 1,
      "type" : [{
        "code" : "Medication",
        "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Medication"]
      }]
    },
    {
      "id" : "Parameters.parameter:rxDispensation.part:medication.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData",
      "path" : "Parameters.parameter",
      "sliceName" : "requestData",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:requestData.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "requestData",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part",
      "path" : "Parameters.parameter.part",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "name"
        }],
        "rules" : "closed"
      },
      "min" : 7,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:kvnr",
      "path" : "Parameters.parameter.part",
      "sliceName" : "kvnr",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:kvnr.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "kvnr",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:kvnr.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }]
    },
    {
      "id" : "Parameters.parameter:requestData.part:kvnr.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:kvnr.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:accessCode",
      "path" : "Parameters.parameter.part",
      "sliceName" : "accessCode",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:accessCode.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "accessCode",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:accessCode.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-AccessCode"]
      }]
    },
    {
      "id" : "Parameters.parameter:requestData.part:accessCode.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:accessCode.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:countryCode",
      "path" : "Parameters.parameter.part",
      "sliceName" : "countryCode",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:countryCode.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "countryCode",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:countryCode.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/iso3166-1-2"
      }
    },
    {
      "id" : "Parameters.parameter:requestData.part:countryCode.value[x].system",
      "path" : "Parameters.parameter.part.value[x].system",
      "min" : 1,
      "patternUri" : "urn:iso:std:iso:3166"
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerName",
      "path" : "Parameters.parameter.part",
      "sliceName" : "practitionerName",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerName.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "practitionerName",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerName.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerName.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerName.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerRole",
      "path" : "Parameters.parameter.part",
      "sliceName" : "practitionerRole",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerRole.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "practitionerRole",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerRole.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/terminology/ValueSet/epa-structural-role-of-healthcare-professional-vs"
      }
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerRole.value[x].system",
      "path" : "Parameters.parameter.part.value[x].system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerRole.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:practitionerRole.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:pointOfCare",
      "path" : "Parameters.parameter.part",
      "sliceName" : "pointOfCare",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:pointOfCare.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "pointOfCare",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:pointOfCare.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Parameters.parameter:requestData.part:pointOfCare.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:pointOfCare.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:healthcare-facility-type",
      "path" : "Parameters.parameter.part",
      "sliceName" : "healthcare-facility-type",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:healthcare-facility-type.name",
      "path" : "Parameters.parameter.part.name",
      "patternString" : "healthcare-facility-type",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:healthcare-facility-type.value[x]",
      "path" : "Parameters.parameter.part.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/directory/ValueSet/OrganizationProfessionOIDTypeVS"
      }
    },
    {
      "id" : "Parameters.parameter:requestData.part:healthcare-facility-type.value[x].system",
      "path" : "Parameters.parameter.part.value[x].system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:requestData.part:healthcare-facility-type.resource",
      "path" : "Parameters.parameter.part.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:requestData.part:healthcare-facility-type.part",
      "path" : "Parameters.parameter.part.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:practitionerData",
      "path" : "Parameters.parameter",
      "sliceName" : "practitionerData",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:practitionerData.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "practitionerData",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:practitionerData.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:practitionerData.resource",
      "path" : "Parameters.parameter.resource",
      "type" : [{
        "code" : "Practitioner",
        "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Practitioner"]
      }]
    },
    {
      "id" : "Parameters.parameter:practitionerData.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:organizationData",
      "path" : "Parameters.parameter",
      "sliceName" : "organizationData",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:organizationData.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "organizationData",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:organizationData.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:organizationData.resource",
      "path" : "Parameters.parameter.resource",
      "type" : [{
        "code" : "Organization",
        "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Organization"]
      }]
    },
    {
      "id" : "Parameters.parameter:organizationData.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:practitionerRoleData",
      "path" : "Parameters.parameter",
      "sliceName" : "practitionerRoleData",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:practitionerRoleData.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "practitionerRoleData",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:practitionerRoleData.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:practitionerRoleData.resource",
      "path" : "Parameters.parameter.resource",
      "type" : [{
        "code" : "PractitionerRole",
        "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PractitionerRole"]
      }]
    },
    {
      "id" : "Parameters.parameter:practitionerRoleData.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    }]
  }
}

```
