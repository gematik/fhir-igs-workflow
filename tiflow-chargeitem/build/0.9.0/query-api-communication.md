# Query API: Communication - TIFlow - Abrechnungsinformationen v0.9.0

TIFlow - Abrechnungsinformationen

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Communication**

## Query API: Communication

Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/1.0.0query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

Die Query API für Communication beschreibt das Einstellen von Nachrichten im Rahmen der PKV‑Abrechnung (z. B. Änderungsanfragen der Abrechnungsinformation).

### Nachricht

Nachrichten werden als Communication‑Ressourcen an den E‑Rezept‑Fachdienst gesendet. Die verwendeten Profile richten sich nach der Kommunikationsbeziehung (Versicherter - Apotheke).

Die Interaktion mit Nachrichten als FHIR-Ressource **Communication** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Nachrichten abrufen |
| POST | Nachricht einstellen |
| DELETE | Nachricht löschen |

### Anforderungen an die Schnittstelle

* [FD-Anforderungen zu Communications](./query-api-communication-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zu Communications](./query-api-communication-req-avs.md): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die *Communication*-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

* Für den Versicherten noch nicht vom TI-Flow-Fachdienst abgerufene Communications: `?recipient=<kvnr>&received=NULL`

#### API Beschreibung

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

## Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-technische-umsetzung-datenschutz-und-sicherheit.md) festgehalten.

