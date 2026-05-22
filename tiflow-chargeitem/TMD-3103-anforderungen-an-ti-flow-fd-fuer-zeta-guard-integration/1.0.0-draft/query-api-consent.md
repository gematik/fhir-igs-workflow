# Query API: Consent - TIFlow - Abrechnungsinformationen v1.0.0-draft

TIFlow - Abrechnungsinformationen

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Consent**

## Query API: Consent

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0query-api-consent.html) und beschreibt den Einstieg in die Consent-Query-Schnittstelle.

Die Query API für Consent ermöglicht das Erteilen, Einsehen und Widerrufen der Einwilligung zur Speicherung von Abrechnungsinformationen.

### Anforderungen an die Schnittstelle

* [Server-Anforderungen zur Consent-Query](./query-api-consent-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Consent-Query](./query-api-consent-req-fdv.md): Anforderungen an das E-Rezept-FdV des TI-Flow-Fachdienstes zur Nutzung der Schnittstelle.

Für die Verwaltung der Einwilligung zum Speichern der Abrechnungsinformationen wird Consent.category.coding.code mit dem Codesystem https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType verwendet.

### Resource API

```

			{
  "resourceType": "CapabilityStatement",
  "id": "erp-fachdienst-server-erpchrg",
  "meta": {
    "profile": [
      "https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"
    ]
  },
  "url": "https://gematik.de/fhir/erpchrg/OperationDefinition/ERPFachdienstServerChrgOperationDefinition",
  "extension": [
    {
      "url": "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
      "valueString": "https://gematik.de/fhir/erpchrg"
    }
  ],
  "name": "ERPFachdienstServerChrg",
  "status": "draft",
  "version": "1.1.0",
  "date": "2025-04-10",
  "title": "ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst",
  "description": "CapabilityStatement für den E-Rezept-Fachdienst (PKV-Abrechnungsinformationen)",
  "contact": [
    {
      "telecom": [
        {
          "system": "url",
          "value": "https://www.gematik.de"
        }
      ]
    }
  ],
  "kind": "requirements",
  "fhirVersion": "4.0.1",
  "format": [
    "application/fhir+json",
    "application/fhir+xml"
  ],
  "rest": [
    {
      "mode": "server",
      "resource": [
        {
          "type": "Task",
          "versioning": "versioned-update",
          "readHistory": true,
          "extension": [
            {
              "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode": "SHALL"
            }
          ],
          "interaction": [
            {
              "code": "read",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            },
            {
              "code": "search-type",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            }
          ]
        },
        {
          "type": "ChargeItem",
          "versioning": "versioned-update",
          "readHistory": true,
          "extension": [
            {
              "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode": "SHALL"
            }
          ],
          "interaction": [
            {
              "code": "read",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            },
            {
              "code": "search-type",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            },
            {
              "code": "create",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            },
            {
              "code": "update",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            },
            {
              "code": "patch",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            },
            {
              "code": "delete",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            }
          ]
        },
        {
          "type": "Consent",
          "versioning": "versioned-update",
          "readHistory": true,
          "extension": [
            {
              "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode": "SHALL"
            }
          ],
          "interaction": [
            {
              "code": "read",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            },
            {
              "code": "create",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            },
            {
              "code": "delete",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            }
          ]
        },
        {
          "type": "Communication",
          "versioning": "versioned-update",
          "readHistory": true,
          "extension": [
            {
              "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode": "SHALL"
            }
          ],
          "interaction": [
            {
              "code": "create",
              "extension": [
                {
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode": "SHALL"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}

		
```

