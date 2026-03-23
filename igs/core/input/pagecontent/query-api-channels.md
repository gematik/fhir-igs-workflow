
Für den Empfang von Push Notifications in einem FdV kann die App-Instanz eine Konfiguration am TI-Flow-Fachdienst hinterlegen. Für die Konfiguration wird die Ressource channels verwendet.

### Nachricht

Die Nachricht zur Interaktion mit Konfigurationen für Push Notifications als Ressource _Channels_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Aufruf|Ergebnis der Anfrage|
|---|---|
|GET|GET /channels|Verfügbare Channels abrufen|
|GET|GET /channels/{pushkey}|Für eine FdV-Instanz hinterlegte Konfiguration abrufen|
|POST|POST /channels/{pushkey}|Konfiguration für eine FdV-Instanz speichern|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur channels-Query](./query-api-channels-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur channels-Query](./query-api-channels-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.


### Resource API

Der TI-Flow-Fachdienst unterstützt das optionale Feature "Channels". Ruft alle verfügbaren Channels für den authentifizierten Nutzer ab.

#### API Beschreibung

##### GET /channels

<div class="gematik-api"
	data-api-type="Custom"
	data-api-method="GET"
	data-api-operation-id="getChannels_erp_fd"
	data-api-url-path="/channels">
	<div id="CapabilityStatement">
		<pre>
		{% include CapabilityStatement-erp-fachdienst-server.json %}
		</pre>
	</div>
	<div id="Formats">
			<div data-value="application/json"></div>
	</div>
	<div id="Response-Examples">
		<div data-name="application/json" data-type="JSON">
			{% include channels-list-response-example.json %}
		</div>
	</div>
	<div id="Responses">
		<div data-code="200" data-error-code="" data-response-type="application/json">Successful operation</div>
		<div data-code="400" data-error-code="badRequest" data-response-type="application/fhir+json">Bad Request</div>
		<div data-code="401" data-error-code="unauthorized" data-response-type="application/fhir+json">Unauthorized</div>
		<div data-code="403" data-error-code="forbidden" data-response-type="application/fhir+json">Forbidden</div>
		<div data-code="429" data-error-code="tooManyRequests" data-response-type="application/fhir+json">Too Many Requests</div>
	</div>
</div>

##### GET /channels/{pushkey}

<div class="gematik-api"
	data-api-type="Custom"
	data-api-method="GET"
	data-api-operation-id="getChannelByPushkey_erp_fd"
	data-api-url-path="/channels/{pushkey}">
	<div id="CapabilityStatement">
		<pre>
		{% include CapabilityStatement-erp-fachdienst-server.json %}
		</pre>
	</div>
	<div id="Formats">
			<div data-value="application/json"></div>
	</div>
	<div id="Response-Examples">
		<div data-name="application/json" data-type="JSON">
			{% include channels-list-response-example.json %}
		</div>
	</div>
	<div id="Responses">
		<div data-code="200" data-error-code="" data-response-type="application/json">Successful operation</div>
		<div data-code="400" data-error-code="badRequest" data-response-type="application/fhir+json">Bad Request</div>
		<div data-code="401" data-error-code="unauthorized" data-response-type="application/fhir+json">Unauthorized</div>
		<div data-code="403" data-error-code="forbidden" data-response-type="application/fhir+json">Forbidden</div>
		<div data-code="429" data-error-code="tooManyRequests" data-response-type="application/fhir+json">Too Many Requests</div>
	</div>
</div>

##### POST /channels/{pushkey}

<div class="gematik-api"
	data-api-type="Custom"
	data-api-method="POST"
	data-api-operation-id="setChannelByPushkey_erp_fd"
	data-api-url-path="/channels/{pushkey}">
	<div id="CapabilityStatement">
		<pre>
		{% include CapabilityStatement-erp-fachdienst-server.json %}
		</pre>
	</div>
	<div id="Formats">
			<div data-value="application/json"></div>
	</div>
	<div id="Request-Examples">
		<div data-name="application/json" data-type="JSON">
			{% include channels-set-request-example.json %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="application/json" data-type="JSON">
			{% include empty-object-response-example.json %}
		</div>
	</div>
	<div id="Responses">
		<div data-code="200" data-error-code="" data-response-type="application/json">Successful operation</div>
		<div data-code="400" data-error-code="badRequest" data-response-type="application/fhir+json">Bad Request</div>
		<div data-code="401" data-error-code="unauthorized" data-response-type="application/fhir+json">Unauthorized</div>
		<div data-code="403" data-error-code="forbidden" data-response-type="application/fhir+json">Forbidden</div>
		<div data-code="429" data-error-code="tooManyRequests" data-response-type="application/fhir+json">Too Many Requests</div>
	</div>
</div>


