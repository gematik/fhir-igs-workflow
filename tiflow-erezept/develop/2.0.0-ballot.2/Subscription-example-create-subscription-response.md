# Antwort fuer POST /Subscription - TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Antwort fuer POST /Subscription**

## Example Subscription: Antwort fuer POST /Subscription

**status**: Active

**reason**: Subscription erfolgreich registriert

**criteria**: Communication?received=NULL&recipient=1-2-3-4-5

### Channels

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Type** | **Endpoint** | **Payload** |
| * | Rest Hook | [https://apotheke.example.org/erp/notification](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=https://apotheke.example.org/erp/notification) | application/fhir+json |



## Resource Content

```json
{
  "resourceType" : "Subscription",
  "id" : "example-create-subscription-response",
  "status" : "active",
  "reason" : "Subscription erfolgreich registriert",
  "criteria" : "Communication?received=NULL&recipient=1-2-3-4-5",
  "channel" : {
    "type" : "rest-hook",
    "endpoint" : "https://apotheke.example.org/erp/notification",
    "payload" : "application/fhir+json"
  }
}

```
