Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}/query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

Communication wird für die Kommunikation zwischen Versicherten und Apotheke verwendet.

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource _Communication_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Nachrichten abrufen|
|POST|Nachricht einstellen|
|DELETE|Nachricht löschen|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Communication-Query](./query-api-communication-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen für Communication-Query](./query-api-communication-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen für Communication-Query](./query-api-communication-req-avs.html): Anforderungen an das AVS zur Nutzung der Schnittstelle.
- [Datenmodell Payload für Communication-Query](./query-api-communication-req-data.html): Datenmodell Payload zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>Communication</i>-Ressource können über die RESTful API durchgeführt werden.

#### Einstellen von Communications

Als Versicherter möchte ich einer Apotheke alle Informationen zukommen lassen, damit diese mein E-Rezept beliefern kann. Über einen JSON-Payload kann ich weitere Informationen zur Belieferung angeben.
Uns als Apotheke möchte ich dem Versicherten eine Antwort auf seine Anfrage einstellen.

Der Aufruf erfolgt als http-POST-Operation. Der Server prüft die Nachricht auf Zulässigkeit und ergänzt Metainformationen wie den Sendezeitpunkt und die Angaben des Absenders aus dessen ACCESS_TOKEN.

<div class="gematik-apidoc"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="create">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Communication/7977a4ab-97a9-4d95-afb3-6c4c1e2ac596 JSON %}
		</div>
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Communication/7977a4ab-97a9-4d95-afb3-6c4c1e2ac596 XML %}
		</div>
	</div>
</div>

#### Abrufen von Communications

Als Versicherter und als Apotheke möchte ich wissen, ob im Fachdienst "ungelesene" Nachrichten für mich vorhanden sind.
Als Apotheke oder Kostenträger möchten wir alle Nachrichten des Monats April 2020 abrufen, um uns einen Überblick der bisherigen E-Rezept-Anfragen zu beschaffen.

<div class="gematik-apidoc"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Bundle/example-searchset-communication JSON %}
		</div>
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/example-searchset-communication XML %}
		</div>
	</div>
</div>

### Instance API

Um spezifische Details zu einer einzelnen _Communciation_ mittels der RESTful API zu erhalten, wird die _Communciation Instance API_ verwendet, indem eine HTTP GET-Anfrage an den Endpunkt <i>/Communciation/[id]</i> gestellt wird.

#### Lesen von einzelnen Communications

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="read">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<!-- TODO: Add a dedicated Communication read example for RX. -->
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleRxCommunicationSearchset XML %}
		</div>
	</div>
</div>

#### Löschen von Communications

Als Apotheke oder Kostenträger möchten wir eine von uns versendete Nachricht auf dem Fachdienst entfernen.

<div class="gematik-apidoc"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="delete">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-rx.json %}
		</pre>
	</div>
</div>


- Bei der direkten Zuweisung wird im "`contentString`" des Payloads ein strukturierter Text übergeben. Im Beispiel übermittelt die E-Rezept-App die Details für eine Botenlieferung. Dies erfolgt für Versand mit `supplyOptionsType = shipment` und für die Filialabholung mit `supplyOptionsType = onPremise`.
- Mit der Übergabe der Referenz auf den E-Rezept-Task inkl. des AccessCodes in `"reference": "Task/160.000.000.000.000.01/$accept?ac=*" ` ist die Apotheke berechtigt, das E-Rezept herunterzuladen und zu beliefern.
- Die von der Apotheke übermittelte Antwort ist strukturiert in .payload.contentString abgelegt.
- In der Extension .payload.extension:OfferedSupplyOptions kann das AVS die zur Verfügung gestellten Optionen zur Belieferung angeben. Im JSON unter "supplyOptionsType" wird die ausgewählte Belieferungsart angegeben.
- Die Extension `.payload.extension:AvailabilityStatus` kann genutzt werden, um anzugeben, wann eine Belieferung möglich ist. Die möglichen Werte sind in [GEM_ERP_CS_AvailabilityStatus](./CodeSystem-GEM-ERP-CS-AvailabilityStatus.html) definiert.
- 	Der Server übernimmt beim Absenden der Nachricht den Sendezeitpunkt in die Communication-Ressource ` <sent value="2020-03-12T18:01:10+00:00" />`
- Die Informationen zum Absender werden aus dem im Request übergebenen ACCESS_TOKEN übernommen, in diesem Fall die Telematik-ID der Apotheke in ` <sender>` als Absender der Nachricht.
- Der Aufruf ist aus Performance Gründen nicht für die regelmäßige Abfrage von Nachrichten vorgesehen. Es soll nur nach neuen Nachrichten geprüft werden, wenn der Nutzer aktiv eine Aktion ausführt, die eine solche Prüfung erfordert oder in der App ein "refresh" der Daten durchgeführt wird.
- Die abgerufene Nachricht enthält kein Element received, da die Nachricht erstmalig vom TI-Flow-Fachdienst abgerufen wurde. Dieses Attribut received wurde beim Abruf durch den Fachdienst auf dessen aktuelle Systemzeit in `"sent": "2020-03-12T18:01:10+00:00"` aktualisiert, sodass ein erneuter Aufruf mit dem Filter `?received=NULL` kein Ergebnis liefert, da keine neuen bzw. ungelesenen Nachrichten vorhanden sind.
- In `Communication.sender.value` ist die Empfänger-ID (in diesem Fall Versicherten-ID) des Adressaten angegeben, über die die Nachrichten beim Abruf gemäß der Nutzerkennung im übergebenen ACCESS_TOKEN gefiltert werden.
- Dies sei die Antwort der Apotheke auf eine verbindliche Zuweisung, dann erhält die E-Rezept-App vom Warenwirtschaftssystem der Apotheke ebenfalls einen strukturierten Text im "`contentString`". In diesem sind u.a. Details für die Abholung in der Filiale wie z.B. der Abholcode `pickUpCodeHR` angegeben.



