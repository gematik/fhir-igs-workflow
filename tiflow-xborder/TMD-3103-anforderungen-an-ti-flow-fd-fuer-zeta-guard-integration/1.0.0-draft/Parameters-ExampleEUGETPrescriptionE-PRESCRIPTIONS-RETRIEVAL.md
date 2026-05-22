# Example EU-GET Prescription Parameters - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example EU-GET Prescription Parameters**

## Example Parameters: Example EU-GET Prescription Parameters



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "ExampleEUGETPrescriptionE-PRESCRIPTIONS-RETRIEVAL",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input"]
  },
  "parameter" : [{
    "name" : "requestData",
    "part" : [{
      "name" : "requesttype",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_RequestType",
        "code" : "e-prescriptions-retrieval"
      }
    },
    {
      "name" : "kvnr",
      "valueIdentifier" : {
        "system" : "http://fhir.de/sid/gkv/kvid-10",
        "value" : "X123456789"
      }
    },
    {
      "name" : "accessCode",
      "valueIdentifier" : {
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_EU_AccessCode",
        "value" : "123456"
      }
    },
    {
      "name" : "countryCode",
      "valueCoding" : {
        "system" : "urn:iso:std:iso:3166",
        "code" : "BE"
      }
    },
    {
      "name" : "practitionerName",
      "valueString" : "Sanches"
    },
    {
      "name" : "practitionerRole",
      "valueCoding" : {
        "system" : "urn:oid:2.16.840.1.113883.2.9.6.2.7",
        "code" : "2262",
        "display" : "Pharmacists"
      }
    },
    {
      "name" : "pointOfCare",
      "valueString" : "Super Pharmacia"
    },
    {
      "name" : "healthcare-facility-type",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID",
        "code" : "1.2.276.0.76.4.54",
        "display" : "Öffentliche Apotheke"
      }
    },
    {
      "name" : "prescription-id",
      "valueIdentifier" : {
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
        "value" : "160.000.000.000.000.01"
      }
    },
    {
      "name" : "prescription-id",
      "valueIdentifier" : {
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
        "value" : "160.000.000.000.000.02"
      }
    },
    {
      "name" : "prescription-id",
      "valueIdentifier" : {
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
        "value" : "160.000.000.000.000.03"
      }
    },
    {
      "name" : "prescription-id",
      "valueIdentifier" : {
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
        "value" : "160.000.000.000.000.04"
      }
    }]
  }]
}

```
