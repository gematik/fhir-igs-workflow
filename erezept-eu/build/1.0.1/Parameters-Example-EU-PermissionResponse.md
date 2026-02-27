# Resource Example-EU-PermissionResponse (Parameters)



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "Example-EU-PermissionResponse",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response"]
  },
  "parameter" : [{
    "name" : "countryCode",
    "valueCoding" : {
      "system" : "urn:iso:std:iso:3166",
      "code" : "BE"
    }
  },
  {
    "name" : "accessCode",
    "valueIdentifier" : {
      "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_EU_AccessCode",
      "value" : "ABC123"
    }
  },
  {
    "name" : "validUntil",
    "valueInstant" : "2025-10-01T13:12:32+02:00"
  },
  {
    "name" : "createdAt",
    "valueInstant" : "2025-10-01T12:12:32+02:00"
  }]
}

```
