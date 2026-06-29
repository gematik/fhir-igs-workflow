# erp-notification-avs-01-request-PostSubscriptionPseudo - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **erp-notification-avs-01-request-PostSubscriptionPseudo**

## Example Subscription: erp-notification-avs-01-request-PostSubscriptionPseudo

**status**: Requested

**reason**: Communication notifications

**criteria**: Communication?received=null&recipient=3-abc-12345678

### Channels

| | |
| :--- | :--- |
| - | **Type** |
| * | Websocket |



## Resource Content

```json
{
  "resourceType" : "Subscription",
  "id" : "erp-notification-avs-01-request-PostSubscriptionPseudo",
  "status" : "requested",
  "reason" : "Communication notifications",
  "criteria" : "Communication?received=null&recipient=3-abc-12345678",
  "channel" : {
    "type" : "websocket"
  }
}

```
