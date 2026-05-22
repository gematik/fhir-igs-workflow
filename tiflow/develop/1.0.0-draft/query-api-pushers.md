# Query API: Pushers - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**Additional API**](menu-schnittstellen-additional-api.md)
* **Query API: Pushers**

## Query API: Pushers

Für den Empfang von Push Notifications in einem FdV muss sich die App-Instanz am TI-Flow-Fachdienst registrieren. Für die Registrierung wird die Ressource pusher verwendet.

### Nachricht

| | |
| :--- | :--- |
| GET | Registrierungen abrufen |
| POST | FdV-Instanz registrieren |

### Anforderungen an Schnittstelle

* [FD-Anforderungen zur Pushers-Query](./query-api-pushers-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zur Pushers-Query](./query-api-pushers-req-fdv.md): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

Dieser Endpunkt ermöglicht die Erstellung, Änderung und Löschung von Pushers für den authentifizierten Nutzer. Das Verhalten dieses Endpunkts variiert je nach Werten im JSON-Body.

Ist `kind` nicht `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer aktualisiert oder erstellt, falls er nicht existiert. Ist `kind` `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer gelöscht.

#### API Beschreibung

##### GET /pushers

```
server
```

{ "pushers": [ { "pushkey": "Xp/MzCt8/9DcSNE9cuiaoT5Ac55job3TdLSSmtmYl4A=", "kind": "http", "app_id": "face.mcapp.appy.prod", "app_display_name": "Appy McAppface", "device_display_name": "Alice's Phone", "profile_tag": "xyz", "lang": "en-US", "data": { "url": "https://example.com/_matrix/push/v1/" } } ] }

Successful operation

Bad Request

Unauthorized

Forbidden

Too Many Requests

##### POST /pushers/set

```
server
```

{ "lang": "en", "kind": "http", "app_display_name": "Mat Rix", "device_display_name": "iPhone 9", "app_id": "com.example.app.ios", "pushkey": "<APNS/GCM TOKEN>", "data": { "url": "https://push-gateway.location.here/_matrix/push/v1/" }, "encryption": { "method": "aes-hmac-sha256", "time_iss_created": "2023-10", "iss": "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f", "key_identifier": "f47ac10b-58cc-4372-a567-0e02b2c3d479" }, "append": false }

{ "app_id": "com.example.app.ios", "pushkey": "<APNS/GCM TOKEN>", "kind": null }

{}

Successful operation

Bad Request

Unauthorized

Forbidden

Too Many Requests

