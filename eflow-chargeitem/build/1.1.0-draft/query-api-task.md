# Query API: Task - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Task**

## Query API: Task

Die Query API für Task beschreibt den lesenden Zugriff auf Tasks. PKV‑spezifische Vorgänge erfolgen über die Operationen $accept und $activate und sind auf den jeweiligen Operationsseiten beschrieben.

## GET /Task (Suche)

### Nachricht

Clients können Tasks suchen (z. B. nach Status oder Identifiern), um den Bearbeitungsstand zu ermitteln.

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

## GET /Task/ (Details)

### Nachricht

Der Detailabruf liefert die Task‑Ressource zu einer bekannten Task‑ID.

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

## Weiterführende Operationen

* [$accept](./op-accept.md)
* [$activate](./op-activate.md)

