# FD-Anforderungen: Communication-Query - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**Query API**](menu-schnittstellen-query-api.md)
* [**Query API: Communication**](query-api-communication.md)
* **FD-Anforderungen: Communication-Query**

## FD-Anforderungen: Communication-Query

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für die `Communication`-Query-Endpunkte.

### Anforderungen aus der Core Spezifikation

Diese Seite enthält die normativen Anforderungen an den E-Rezept-Fachdienst für den Communication-Endpunkt.

Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Communication mittels der HTTP-Operationen PUT, PATCH und HEAD unterbinden, damit keine unzulässigen Operationen auf den Kommunikationsnachrichten ausgeführt werden können.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET, DELETE und POST-Operation auf den Endpunkt /Communication bzw. /Communication/<id> sicherstellen, dass ausschließlich Versicherte, Leistungserbingerinstitutionen und Kostenträger in der Rolle
* oid_versicherter
* oid_oeffentliche_apotheke
* oid_krankenhausapotheke
* oid_kostentraeger
die Operation am Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit der Nachrichtenaustausch nicht zwischen Unbefugten erfolgt.
#### GET /Communication

Der E-Rezept-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/<id> ausschließlich die Nachrichten an den Aufrufer zurückgeben, die im Attribut Communication.recipient oder Communication.sender mit dem entsprechenden Identifier https://gematik.de/fhir/sid/telematik-id für Apotheken bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte den gleichen Typ und den identischen Wert haben wie im Attribut "idNummer" des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" für Versicherten-ID bzw. Telematik-ID, damit keine Nachrichten an Dritte unrechtmäßig ausgelesen werden.

Der E-Rezept-Fachdienst MUSS beim Abrufen von Nachrichten über die http-Operation GET auf den Endpunkt /Communication bzw. beim Abruf einer einzelnen Nachricht über /Communication/<id> den Wert des Attributs Communication.received = <aktuelle Systemzeit&gt setzen, wenn dieser Wert zum Zeitpunkt des Abrufs der Nachrichten NULL ist, damit Nutzer eine Filtermöglicheit auf "neue Nachrichten" haben.
#### POST /Communication

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication die im http-Request-Body übergebene Communications-Ressource gegen das aus der Kommunikationsbeziehung ableitbare, zulässige Schema gemäß TAB_eRPFD_008 prüfen und den Aufruf bei Nicht-Konformität mit dem http-Status-Code 400 ablehnen, damit ausschließlich konforme E-Rezept-Nachrichten ausgetauscht werden.

* sender: KVNR
  * recipient: Telematik-ID
  * zusätzliche Bedingung: Communication.basedOn referenziert Task
  * Schema: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq
* sender: Telematik-ID
  * recipient: KVNR
  * zusätzliche Bedingung: Communication.basedOn referenziert Task
  * Schema: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Replyhttps://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA
* sender: KVNR
  * recipient: KVNR
  * zusätzliche Bedingung: Communication.basedOn referenziert Task
  * Schema: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative
* sender: KVNR
  * recipient: Telematik-ID
  * zusätzliche Bedingung: Communication.basedOn referenziert ChargeItam
  * Schema: https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq
* sender: Telematik-ID
  * recipient: KVNR
  * zusätzliche Bedingung: Communication.basedOn referenziert ChargeItam
  * Schema: https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReqReply

**Tabelle: **TAB_eRPFD_008 Nachrichtentyp zu Kommunikationsbeziehung

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication, falls die Ressource dem GEM_ERP_PR_Communication_DispReq-Profil entspricht, den Inhalt der contentString-Eigenschaft auf valides JSON sowie gegen die Struktur in "Tabelle: E-Rezept einer Apotheke zuweisen" überprüfen und bei negativem Prüfergebnis, mit einem Http-Fehler 400 (Bad Request) abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication, falls die Ressource dem GEM_ERP_PR_Communication_Reply-Profil entspricht, den Inhalt der contentString-Eigenschaft auf valides JSON sowie gegen die Struktur in "Tabelle: Nachricht als Apotheke an einen Versicherten schicken" überprüfen und bei negativem Prüfergebnis, mit einem Http-Fehler 400 (Bad Request) abbrechen sowie mit einer aussagekräftigen Fehlermeldung in Form einer eingebetteten OperationOutcome-Ressource antworten.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication die Absenderidentifikation aus dem Attribut idNummer des im HTTP-Header "Authorization" übergebenen ACCESS_TOKEN mit dem entsprechenden System https://gematik.de/fhir/sid/telematik-id für Institutionen der TI bzw. http://fhir.de/sid/gkv/kvid-10 für Versicherte übernehmen sowie das Absendedatum Communication.sent auf die aktuelle Systemzeit des E-Rezept-Fachdienstes setzen, damit Absender und Sendezeitpunkt für den Empfänger eindeutig sind.

Der E-Rezept-Fachdienst MUSS die zulässige Anzahl der Communication-Ressourcen des Schemas https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative zur Versicherter-zu-Versichertem-Kommunikation auf einen konfigurierbaren Maximalwert (Default: 10) je referenziertem Task beschränken und bei Überschreiten des Maximalwerts das Einstellen einer Nachricht mit dem http-Status-Code 429 abbrechen, damit Versicherte den E-Rezept-Fachdienst nicht für beliebige Kommunikation außerhalb der Vertretung in der Einlösung von E-Rezepten benutzen.

Der E-Rezept-Fachdienst DARF die Anzahl der Communication-Ressourcen je referenziertem Task für die Versicherter-zu-Versichertem-Kommunikation NICHT zu anderen Zwecken verwenden, als für die Beschränkung der Anzahl auf den maximalen Wert.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht des Schemas https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative zur Versicherter-zu-Versichertem-Kommunikation über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn der referenzierte Task nicht im Zustand "ready" oder "in-progress" ist, damit die Weitergabe des Zugriffs auf E-Rezepte ausschließlich auf einlösbare bzw. in Arbeit befindliche Verordnungen beschränkt wird.

Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn der Empfänger Communication.recipient gleich der Absenderidentifikation im Attribut idNummer des übergebenen ACCESS_TOKEN im HTTP-Header "Authorization" ist, damit irreführende Kommunikationsbeziehungen nicht zu einer vermeidbaren Mehrbelastung des E-Rezept-Fachdienstes führen.

Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn
* der Nachrichteninhalt Communication.payload größer als 10 kByte ist oder
* in von Versicherten eingestellten Nachrichten in Communication.payload eine externe URLs enthält oder
* ein Attachment mit MimeType "application/*" enthält,
damit über den E-Rezept-Fachdienst kein Schadcode verteilt wird.

Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq" oder "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative" durch einen Versicherten über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn
*  die KVNR des in Communication.basedOn referenzierten Tasks Task.for ungleich der KVNR des Einstellenden in "idNummer" des übergebenen ACCESS_TOKEN 
und
*  der http-Header "X-AccessCode" fehlt oder der im http-Header "X-AccessCode" übergebene AccessCode ungleich dem AccessCode-Identifier des referenzierten Tasks 
ist, um irreführende Testnachrichten zu unterbinden, die eine vermeidbare Mehrbelastung für den E-Rezept-Fachdienst darstellen.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq" durch einen Versicherten über die http-Operation POST auf den Endpunkt /Communication die Zulässigkeit der Übermittlung auf Basis des Flowtypes des referenzierten Tasks (Task.extension:flowType) und dem Empfänger Communication.recipient prüfen und mit dem http-Status-Code 403 abbrechen, wenn der Empfänger laut TAB_eRPFD_028 den spezifischen Flowtype nicht empfangen darf.

* Empfänger (Präfix der Telematik-ID): oid_oeffentliche_apotheke (3-*, 9-*)
  * Zulässige Flowtypes: 160, 166, 200
* Empfänger (Präfix der Telematik-ID): oid_kostentraeger (8-*)
  * Zulässige Flowtypes: 162

**Tabelle: **Tab_eRPFD_028 Zulässige Empfänger Communication_DispReq

Der Fachdienst E-Rezept MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq", "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply", "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA" oder "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative" über die http-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen Task referenziert, der nicht existiert, um Spam und nicht-verordnungsbezogene Kommunikation zu verhindern.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, dass Task.status = ready und bei Ungleichheit mit dem Http-Fehler 400 und dem OperationOutcome "Task has invalid status." abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, welche durch den Adressaten abrufbar sind.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, dass Task.ExpiryDate nicht zu einem früheren Zeitpunkt als dem aktuellem Datum liegt und anderenfalls mit dem Http-Fehler 400 und dem OperationOutcome "Task has expired." abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, welche deren Einlösefrist noch nicht erreicht ist.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die http-Operation POST auf den Endpunkt /Communication mit GEM_ERP_PR_Communication_DispReq-Ressource für den in Communication.basedOn referenzierten Task prüfen, falls die Verordnung als Mehrfachverordnung (MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen = true) gekennzeichnet ist, ob der Beginn der Einlösefrist (MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum.value[x]:valuePeriod.start) zum aktuellen oder einem früheren Zeitpunkt als das aktuelle Datum liegt und anderenfalls mit dem Http-Fehler 400 und dem OperationOutcome "Prescription is not fillable yet." abbrechen, damit ausschließlich E-Rezepte zugewiesen werden, deren Einlösefrist erreicht ist.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht des Profils "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq" oder "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq" zur Versicherter-zu-Apotheken-Kommunikation über die http-Operation POST auf den Endpunkt /Communication prüfen, ob für die Telematik-ID des Empfängers Subscriptions registriert sind und für Registrierungen über den Subscription Service eine Notification (ping : subscription-id) senden.

Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht mittels HTTP-POST-Operation über /Communication bei erfolgreichem Abschluss der Operation, den Push Notification Prozess für den Trigger mit der ChannelId "erp.communication.new" und den Versicherten mit der KVNR = Communication.recipient initiieren.
#### DELETE /Communication

Mit der HTTP-Operation DELETE kann ein Nutzer eine verschickte Kommunikationsnachricht als Absender löschen, um bspw. einen Irrläufer zurückzurufen. Der E-Rezept-Fachdienst prüft, ob die Nachricht bereits abgerufen wurde. Das Löschen einer ungelesenen Nachricht erfolgt sofort, das Löschen einer bereits abgerufenen Nachricht wird vom E-Rezept-Fachdienst mit einer Warnung umgesetzt, um darauf hinzuweisen, dass die Nachricht als Kopie im Clientsystem des Empfängers vorliegt und das Löschen nicht vor unberechtigter Einsichtnahme schützt.

Um den Schutz vor unberechtigter Einsichtnahme in persönliche Daten durchzusetzen, ist es ratsam bei bereits gelesenen Nachrichten den referenzierten E-Rezept-Task zu löschen. Für eine geeignete Nutzerführung auf Clientseite ergänzt der E-Rezept-Fachdienst die http-Response um das Header-Attribut “Warning” mit einem entsprechenden Hinweis. Das Löschen des Task führt direkt auch zum Löschen aller Kommunikationsnachrichten, die auf diesen Task verweisen. Damit kann ein fälschlich adressierter Vertreter eines Versicherten keine Einsicht in die Daten des E-Rezepts mehr nehmen bzw. das E-Rezept in keiner Apotheke mehr einlösen.

Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf /Communication/<id> die über <id> identifizierte Communication-Ressource anhand der KVNR bzw. Telematik-ID des aufrufenden Nutzers im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests über das Absender-Attribut Communication.sender lokalisieren und löschen, damit Nutzer irrtümlich versendete oder nicht mehr gewünschte Nachrichten vom E-Rezept-Fachdienst entfernen können.

Der E-Rezept-Fachdienst MUSS beim Löschen einer Communication-Ressource der http-Response das http-Header-Feld "Warning" mit dem Zeitpunkt des Nachrichtenabrufs durch den Empfänger ergänzen (z.B. "Warning: 'Deleted message delivered at 2020-07-01 10:30:00'"), wenn die Nachricht bereits durch den Empfänger abgerufen wurde (Communication.received ungleich NULL, bzw. enthält Datum des Abrufs), um dem Absender einen Hinweis anzeigen zu können.
### Modulspezifische Anforderungen

#### POST /Communication

Für Prüfung Payload siehe [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.md)

