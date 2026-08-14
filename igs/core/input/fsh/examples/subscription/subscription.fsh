Instance: erp-notification-avs-01-request-PostSubscriptionPseudo
InstanceOf: Subscription
Usage: #example
* reason = "Communication notifications"
* channel.type = #websocket
* status = #requested
* criteria = "Communication?received=null&recipient=3-abc-12345678"

Instance: erp-notification-avs-02-response-PostSubscriptionPseudo
InstanceOf: Subscription
Usage: #example
* reason = "Communication notifications"
* channel.header = "Authorization: Bearer eyJhbGciOiAiYnJhaW5wb29sUDI1NnIxIiwidHlwIjogIkpXVCJ9.eyJpc3MiOiAiTWF0aGlzIGJyYWlucG9vbCBqd3QiLCJpYXQiOiAxNjMyMjk0MzY1LCJleHAiOiAxNjYzODMwMzY1LCJhdWQiOiAibG9jYWxob3N0Iiwic3ViIjogIm15VXNlcm5hbWUiLCJzdWJzY3JpcHRpb25JZCI6ICIxMjNhYmMifQ.MEUCIAKqlB50xqNhnHkP6qoOoll33l3rWQ-_b5XfQJAUErnFAiEAlGR-cEl7DCzaoHqifh0drreFInsqo1xVy3SrWSMmNCI"
* channel.type = #websocket
* status = #active
* criteria = "Communication?received=null&recipient=3-abc-12345678"
* end = "2025-10-01T15:29:00+00:00"