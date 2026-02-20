# Query API: Communication - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Communication**

## Query API: Communication

Query API: Communication

Die Query API für Communication beschreibt das Einstellen von Nachrichten im Rahmen der PKV‑Abrechnung (z. B. Änderungsanfragen der Abrechnungsinformation).

## POST /Communication

### Nachricht

Nachrichten werden als Communication‑Ressourcen an den E‑Rezept‑Fachdienst gesendet. Die verwendeten Profile richten sich nach der Kommunikationsbeziehung (Versicherter ↔ Apotheke).

**Beispiel-URI:** `https://prescriptionserver.telematik/Communication`

### Auslösung

Die Operation wird ausgelöst, wenn ein Versicherter eine Änderungsanfrage stellt oder die Apotheke antwortet.

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

### Verarbeitung

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die HTTP-Operation POST auf den Endpunkt /Communication die im HTTP-Request-Body übergebene Communication-Ressource gegen das aus der Kommunikationsbeziehung ableitbare zulässige Schema prüfen und den Aufruf bei Nicht-Konformität mit dem http-Status-Code 400 ablehnen, damit ausschließlich konforme E-Rezept-Nachrichten ausgetauscht werden.

Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq oder GEM_ERP_PR_Communication_Representative durch einen Versicherten über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn die KVNR des in Communication.basedOn referenzierten Tasks ungleich der KVNR des Einstellenden in "idNummer" des ACCESS_TOKEN ist und der HTTP-Header "X-AccessCode" fehlt oder ungleich dem AccessCode-Identifier des referenzierten Tasks ist, um irreführende Testnachrichten zu unterbinden.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq, GEM_ERP_PR_Communication_Reply oder GEM_ERP_PR_Communication_Representative über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen Task referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen ChargeItem referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReq zur Versicherten-zu-Apotheken-Kommunikation über die HTTP-Operation POST auf den Endpunkt /Communication prüfen, ob für die Telematik-ID des Empfängers Subscriptions registriert sind und für Registrierungen über den Subscription Service eine Notification (ping : subscription-id) senden.
## Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

