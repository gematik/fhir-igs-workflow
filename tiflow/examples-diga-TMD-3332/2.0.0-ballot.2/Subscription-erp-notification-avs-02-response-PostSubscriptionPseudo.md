# erp-notification-avs-02-response-PostSubscriptionPseudo - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **erp-notification-avs-02-response-PostSubscriptionPseudo**

## Example Subscription: erp-notification-avs-02-response-PostSubscriptionPseudo

**status**: Active

**end**: 2025-10-01 15:29:00+0000

**reason**: Communication notifications

**criteria**: Communication?received=null&recipient=3-abc-12345678

### Channels

| | | |
| :--- | :--- | :--- |
| - | **Type** | **Header** |
| * | Websocket | Authorization: Bearer eyJhbGciOiAiYnJhaW5wb29sUDI1NnIxIiwidHlwIjogIkpXVCJ9.eyJpc3MiOiAiTWF0aGlzIGJyYWlucG9vbCBqd3QiLCJpYXQiOiAxNjMyMjk0MzY1LCJleHAiOiAxNjYzODMwMzY1LCJhdWQiOiAibG9jYWxob3N0Iiwic3ViIjogIm15VXNlcm5hbWUiLCJzdWJzY3JpcHRpb25JZCI6ICIxMjNhYmMifQ.MEUCIAKqlB50xqNhnHkP6qoOoll33l3rWQ-_b5XfQJAUErnFAiEAlGR-cEl7DCzaoHqifh0drreFInsqo1xVy3SrWSMmNCI |



## Resource Content

```json
{
  "resourceType" : "Subscription",
  "id" : "erp-notification-avs-02-response-PostSubscriptionPseudo",
  "status" : "active",
  "end" : "2025-10-01T15:29:00+00:00",
  "reason" : "Communication notifications",
  "criteria" : "Communication?received=null&recipient=3-abc-12345678",
  "channel" : {
    "type" : "websocket",
    "header" : ["Authorization: Bearer eyJhbGciOiAiYnJhaW5wb29sUDI1NnIxIiwidHlwIjogIkpXVCJ9.eyJpc3MiOiAiTWF0aGlzIGJyYWlucG9vbCBqd3QiLCJpYXQiOiAxNjMyMjk0MzY1LCJleHAiOiAxNjYzODMwMzY1LCJhdWQiOiAibG9jYWxob3N0Iiwic3ViIjogIm15VXNlcm5hbWUiLCJzdWJzY3JpcHRpb25JZCI6ICIxMjNhYmMifQ.MEUCIAKqlB50xqNhnHkP6qoOoll33l3rWQ-_b5XfQJAUErnFAiEAlGR-cEl7DCzaoHqifh0drreFInsqo1xVy3SrWSMmNCI"]
  }
}

```
