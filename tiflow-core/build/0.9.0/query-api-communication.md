# Query API: Communication - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* **Query API: Communication**

## Query API: Communication

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource **Communication** wird über die folgenden HTTP-Methoden ermöglicht:

| | |
| :--- | :--- |
| GET | Nachrichten abrufen |
| POST | Nachricht einstellen |
| DELETE | Nachricht löschen |

### Anforderungen an Schnittstelle

* [Server-Anforderungen zu Communications](./query-api-communication-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.md): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.
* [AVS-Anforderungen zu Communications](./query-api-communication-req-avs.md): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.
* [KTR-Anforderungen zu Communications](./query-api-communication-req-ktr.md): Anforderungen an ein Clientsystem des Kostenträgers zur Nutzung der Schnittstelle.

### Resource API

#### Einstellen von Communications

Als Versicherter möchte ich einer Apotheke alle Informationen zukommen lassen, damit diese mein E-Rezept beliefern kann. Über einen JSON-Payload kann ich weitere Informationen zur Belieferung angeben. Uns als Apotheke möchte ich dem Versicherten eine Antwort auf seine Anfrage einstellen.

Der Aufruf erfolgt als http-POST-Operation. Der Server prüft die Nachricht auf Zulässigkeit und ergänzt Metainformationen wie den Sendezeitpunkt und die Angaben des Absenders aus dessen ACCESS_TOKEN.

```
server
```

#### Hinweise

* Bei der direkten Zuweisung wird im “`contentString`” des Payloads ein strukturierter Text übergeben. Im Beispiel übermittelt die E-Rezept-App die Details für eine Botenlieferung. Dies erfolgt für Versand mit `supplyOptionsType = shipment` und für die Filialabholung mit `supplyOptionsType = onPremise`.
* Mit der Übergabe der Referenz auf den E-Rezept-Task inkl. des AccessCodes in `"reference": "Task/160.000.000.000.000.01/$accept?ac=*" ` ist die Apotheke berechtigt, das E-Rezept herunterzuladen und zu beliefern.
* Die von der Apotheke übermittelte Antwort ist strukturiert in .payload.contentString abgelegt.
* In der Extension .payload.extension:OfferedSupplyOptions kann das AVS die zur Verfügung gestellten Optionen zur Belieferung angeben. Im JSON unter “supplyOptionsType” wird die ausgewählte Belieferungsart angegeben.
* Die Extension `.payload.extension:AvailabilityStatus` kann genutzt werden, um anzugeben, wann eine Belieferung möglich ist. Die möglichen Werte sind in [GEM_ERP_CS_AvailabilityStatus](./CodeSystem-GEM-ERP-CS-AvailabilityStatus.md) definiert.
* Der Server übernimmt beim Absenden der Nachricht den Sendezeitpunkt in die Communication-Ressource ` `
* Die Informationen zum Absender werden aus dem im Request übergebenen ACCESS_TOKEN übernommen, in diesem Fall die Telematik-ID der Apotheke in ` ` als Absender der Nachricht.

#### Abrufen von Communications

Als Versicherter und als Apotheke möchte ich wissen, ob im Fachdienst “ungelesene” Nachrichten für mich vorhanden sind. Als Apotheke oder Kostenträger möchten wir alle Nachrichten des Monats April 2020 abrufen, um uns einen Überblick der bisherigen E-Rezept-Anfragen zu beschaffen.

```
server
```

##### Hinweise

* Der Aufruf ist aus Performance Gründen nicht für die regelmäßige Abfrage von Nachrichten vorgesehen. Es soll nur nach neuen Nachrichten geprüft werden, wenn der Nutzer aktiv eine Aktion ausführt, die eine solche Prüfung erfordert oder in der App ein “refresh” der Daten durchgeführt wird.
* Die abgerufene Nachricht enthält kein Element received, da die Nachricht erstmalig vom TI-Flow-Fachdienst abgerufen wurde. Dieses Attribut received wurde beim Abruf durch den Fachdienst auf dessen aktuelle Systemzeit in `"sent": "2020-03-12T18:01:10+00:00"` aktualisiert, sodass ein erneuter Aufruf mit dem Filter `?received=NULL` kein Ergebnis liefert, da keine neuen bzw. ungelesenen Nachrichten vorhanden sind.
* In `Communication.sender.value` ist die Empfänger-ID (in diesem Fall Versicherten-ID) des Adressaten angegeben, über die die Nachrichten beim Abruf gemäß der Nutzerkennung im übergebenen ACCESS_TOKEN gefiltert werden.
* Dies sei die Antwort der Apotheke auf eine verbindliche Zuweisung, dann erhält die E-Rezept-App vom Warenwirtschaftssystem der Apotheke ebenfalls einen strukturierten Text im “`contentString`”. In diesem sind u.a. Details für die Abholung in der Filiale wie z.B. der Abholcode `pickUpCodeHR` angegeben.

### Instance API

#### Abfragen von einzelnen Communications

```
server
```

#### Löschen von Communications

Als Apotheke oder Kostenträger möchten wir eine von uns versendete Nachricht auf dem Fachdienst entfernen.

```
server
```

