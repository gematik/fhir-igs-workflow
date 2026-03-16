
Für den Empfang von Push Notifications in einem FdV muss sich die App-Instanz am E-Rezept-Fachdienst registrieren. Für die Registrierung wird die Ressource pusher verwendet.

### Nachricht

| HTTP-Methode | Ergebnis der Anfrage     |
| ------------ | ------------------------ |
| GET          | Registrierungen abrufen  |
| POST         | FdV-Instanz registrieren |

### Anforderungen an Schnittstelle

- [FD-Anforderungen zur Pushers-Query](./query-api-pushers-req-fd.html): Anforderungen an den E-Rezept-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zur Pushers-Query](./query-api-pushers-req-fdv.html): Anforderungen an das E-Rezept-FdV zur Nutzung der Schnittstelle.


### Resource API

Dieser Endpunkt ermöglicht die Erstellung, Änderung und Löschung von Pushers für den authentifizierten Nutzer. Das Verhalten dieses Endpunkts variiert je nach Werten im JSON-Body.

Ist `kind` nicht `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer aktualisiert oder erstellt, falls er nicht existiert. Ist `kind` `null`, wird der Pusher mit dieser `app_id` und `pushkey` für diesen Nutzer gelöscht.

#### API Beschreibung

##### GET /pushers

<div class="gematik-api"
	data-api-type="Custom"
	data-api-method="GET"
	data-api-operation-id="getPushers_erp_fd"
	data-api-url-path="/pushers">
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
			{% include pushers-list-response-example.json %}
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

##### POST /pushers/set

<div class="gematik-api"
	data-api-type="Custom"
	data-api-method="POST"
	data-api-operation-id="setPusher_erp_fd"
	data-api-url-path="/pushers/set">
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
			{% include pushers-set-registration-example.json %}
		</div>
		<div data-name="application/json" data-type="JSON">
			{% include pushers-set-deletion-example.json %}
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

