Die Umsetzung der Subscription-Schnittstelle des TI-Flow-Fachdienstes folgt den Vorgaben des [FHIR-Standards](https://www.hl7.org/fhir/subscription.html#2.46.7.2).

Ein Client registriert zunächst eine Subscription über die ZETA-gesicherte FHIR-API des TI-Flow-Fachdienstes. Der TI-Flow-Fachdienst stellt dabei einen kurzlebigen Bearer-Token aus, mit dem der Client anschließend eine WebSocket-Verbindung zum Subscription-Endpunkt aufbaut. Über diese Verbindung erhält der Client je neu vorliegender Ressource ein `ping` als Trigger für den Abruf der Daten über die reguläre FHIR-Schnittstelle. Über die WebSocket-Verbindung selbst werden keine fachlichen Daten übertragen.

Der Subscription-Service ist eine eigenständige Cloud-Komponente des TI-Flow-Fachdienstes, die **nicht** über ZETA abgesichert ist: Der WebSocket-Upgrade-Request wird direkt TLS-verschlüsselt an den Subscription-Endpunkt übertragen und durch den vom TI-Flow-Fachdienst ausgestellten Bearer-Token authentisiert. Damit entfällt die Notwendigkeit, WebSocket-Verbindungen durch die ZETA-Infrastruktur zu führen.

### Ablauf zum Verbindungsaufbau

Der Aufbau der WebSocket-Verbindung erfolgt in drei Schritten:

1. **Subscription registrieren** – ZETA-gesicherter POST /Subscription an den TI-Flow-Fachdienst; dieser stellt einen Bearer-Token für den Subscription-Endpunkt aus
2. **WebSocket-Verbindung aufbauen** – TLS-verschlüsselter Upgrade-Request an den Subscription-Endpunkt mit dem FD-ausgestellten Bearer-Token
3. **Subscription binden** – Übermittlung der `Subscription.id` über die offene Verbindung; ab dann empfängt der Client bei jeder neu vorliegenden Ressource ein `ping` als Trigger für den Abruf über die FHIR-Schnittstelle

Request/Response-Beispiele und das vollständige Protokoll (bind/bound/ping) sind unter [Subscription-Schnittstelle](./query-api-subscription.html) beschrieben.

### Wichtige Hinweise zur Implementierung

*Achtung:* Jede eingehende Ressource führt zu einem `ping`, ggf. im Millisekundenbereich, wenn viele Ressourcen an einen Empfänger gerichtet werden. In Abhängigkeit von der Implementierung kann dieses Verhalten zu einer Überlastung des Clients führen, wenn bspw. jedes einzelne `ping` unmittelbar einen Abruf auslöst. Im Zweifel ist eine kurze Wartezeit sinnvoll, bevor ein Abruf gestartet wird. Zwischenzeitlich eingegangene Ressourcen gehen dabei nicht verloren, da sie beim nächsten Abruf gesammelt heruntergeladen werden können.

*Achtung:* Wird die WebSocket-Verbindung aufgrund eines Fehlers unerwartet terminiert, MUSS der Client eine zufällig gewählte Pause zwischen 5 und 60 Sekunden warten, bevor eine neue WebSocket-Verbindung aufgebaut wird.

*Hinweis:* Je Telematik-ID ist nur eine WebSocket-Verbindung gleichzeitig möglich.

*Hinweis:* Die WebSocket-Verbindung wird nach 12h automatisch geschlossen. Der Client muss anschließend eine neue Subscription registrieren (ab Schritt 1).

*Hinweis:* Eine Verwendung anfallender Verbindungsmetadaten zur Sicherung der Schnittstelle (DDoS-Schutz, Fehleranalyse in sehr eingeschränktem Maß) ist zulässig. Eine darüber hinausgehende Profilbildung der verbundenen Clients ist nicht zulässig.
