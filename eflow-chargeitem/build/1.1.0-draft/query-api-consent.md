# Query API: Consent - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](query-api.md)
* **Query API: Consent**

## Query API: Consent

Query API: Consent

Die Query API für Consent ermöglicht das Erteilen, Einsehen und Widerrufen der Einwilligung zur Speicherung von Abrechnungsinformationen.

## Profilierung

Die Profilierung der Ressource Consent ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_consent

## Unzulässige Operationen

Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Consent mittels der HTTP-Operationen PUT, PATCH oder HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zur Einwilligung ausgeführt werden können.
## POST /Consent (Einwilligung erteilen)

### Nachricht

Der Versicherte erteilt die Einwilligung durch das Erstellen einer Consent‑Ressource (CHARGCONS). Die KVNR wird in Consent.patient.identifier angegeben.

**Beispiel-URI:** `https://prescriptionserver.telematik/Consent`

### Auslösung

Die Operation wird im FdV/AdV ausgelöst, wenn der Versicherte der Speicherung zustimmt.

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

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Einwilligung nicht durch Unberechtigte erteilt werden kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass die KVNR im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests und die KVNR in Consent.patient.identifier übereinstimmen, damit eine Einwilligung für einen Versicherten nicht durch Dritte erteilt werden kann. Im Fehlerfall muss der Http-Request mit dem Http-Fehlercode 403 abgewiesen werden.

Der E-Rezept-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource Consent übertragene Consent-Ressource gegen das FHIR-Profil Consent prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass noch keine Consent-Ressource für die KVNR im ACCESS_TOKEN und Consent.category.coding.code = CHARGCONS gespeichert ist, um maximal eine Einwilligung für den Versicherten zu speichern. Im Fehlerfall muss der Http-Request mit dem Http-Fehlercode 409 abgewiesen werden.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent – falls bei den Prüfungen keine Fehler aufgetreten sind, welche zum Abbruch der Operation führen – die übermittelte Ressource persistieren.
## GET /Consent (Einwilligung einsehen)

### Nachricht

Der Versicherte liest die gespeicherte Einwilligung aus. Die Antwort ist ein Bundle mit den Consent‑Ressourcen des Versicherten.

**Beispiel-URI:** `https://prescriptionserver.telematik/Consent`

### Auslösung

Die Operation wird im FdV/AdV ausgelöst, um den Einwilligungsstatus anzuzeigen.

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

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit die Information zur Einwilligung nicht durch Unberechtigte ausgelesen werden kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent die dem Versicherten zugeordneten Consent-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und in den Response aufnehmen, die in Consent.patient.identifier die entsprechende KVNR des begünstigten Versicherten referenziert haben, damit ausschließlich Versicherte ihre eigenen Informationen zu Einwilligungen einsehen können.
## DELETE /Consent (Einwilligung widerrufen)

### Nachricht

Der Versicherte widerruft die Einwilligung. Der Widerruf löscht die Consent‑Ressource und alle zugehörigen Abrechnungsinformationen.

**Beispiel-URI:** `https://prescriptionserver.telematik/Consent?category=CHARGCONS`

### Auslösung

Die Operation wird im FdV/AdV ausgelöst, wenn der Versicherte die Einwilligung zurückzieht.

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

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent ohne Angabe ?category mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit die Information zur Einwilligung nicht durch Unberechtigte gelöscht werden kann.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent prüfen, dass der für ?category angegebene Wert im System https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType enthalten ist und bei fehlerhafter Prüfung den Request mit dem Fehler 400 abbrechen, damit nur Löschrequests für definierte Consent-Typen ausgeführt werden.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent mit ?category=CHARGCONS alle dem Versicherten zugeordneten ChargeItem-Ressourcen (ChargeItem.subject.identifier) anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und löschen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Ressource löschen, bei der Consent.patient.identifier der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests sowie Consent.category.coding.code dem in ?category übermittelten Wert entspricht.
## Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.md) festgehalten.

