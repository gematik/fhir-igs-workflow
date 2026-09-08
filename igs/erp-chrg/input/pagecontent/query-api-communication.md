Diese Seite basiert auf der gleichnamigen Schnittstelle in der [Core-Spezifikation](https://gemspec.gematik.de/ig/fhir/{{ site.data.constants.tiflow_core_version }}query-api-communication.html) und beschreibt den Einstieg in die Communication-Query-Schnittstelle.

Die Query API für Communication beschreibt das Einstellen von Nachrichten im Rahmen der PKV‑Abrechnung (z. B. Änderungsanfragen der Abrechnungsinformation).

### Nachricht
Nachrichten werden als Communication‑Ressourcen an den E‑Rezept‑Fachdienst gesendet. Die verwendeten Profile richten sich nach der Kommunikationsbeziehung (Versicherter - Apotheke).

Die Interaktion mit Nachrichten als FHIR-Ressource _Communication_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Nachrichten abrufen|
|POST|Nachricht einstellen|
|DELETE|Nachricht löschen|

### Anforderungen an die Schnittstelle

- [FD-Anforderungen zu Communications](./query-api-communication-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu Communications](./query-api-communication-req-fdv.html): Anforderungen an ein TI-Flow-FdV zur Nutzung der Schnittstelle.
- [AVS-Anforderungen zu Communications](./query-api-communication-req-avs.html): Anforderungen an ein Apothekenverwaltungssystem zur Nutzung der Schnittstelle.

### Resource API

Anfragen an die <i>Communication</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern. Zum Beispiel:

- Für den Versicherten noch nicht vom TI-Flow-Fachdienst abgerufene Communications: `?recipient=<kvnr>&received=NULL`

#### API Beschreibung

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-erpchrg.json %}
		</pre>
	</div>
	<div id="Response-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/Example-Communication-Bundle XML %}
		</div>
		<div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Bundle/Example-Communication-Bundle JSON %}
		</div>
	</div>
</div>

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="read">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-erpchrg.json %}
		</pre>
	</div>	
	<div id="Response-Examples">
		<div data-name="ChargChangeRequest - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Communication/Example-Communication-ChargChangeReq XML %}
		</div>
		<div data-name="ChargChangeRequest - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Communication/Example-Communication-ChargChangeReq JSON %}
		</div>
		<div data-name="ChargChangeReply - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Communication/Example-Communication-ChargChangeReply XML %}
		</div>
		<div data-name="ChargChangeReply - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Communication/Example-Communication-ChargChangeReply JSON %}
		</div>
	</div>
</div>

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="create">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-erpchrg.json %}
		</pre>
	</div>
	<div id="Request-Examples">
		<div data-name="ChargChangeRequest - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Communication/Example-Communication-ChargChangeReq XML %}
		</div>
		<div data-name="ChargChangeRequest - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Communication/Example-Communication-ChargChangeReq JSON %}
		</div>
	</div>
	<div id="Response-Examples">
		<div data-name="ChargChangeRequest - application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Communication/Example-Communication-ChargChangeReply XML %}
		</div>
		<div data-name="ChargChangeRequest - application/fhir+json" data-type="JSON" data-render="ig-Fragment">
			{% fragment Communication/Example-Communication-ChargChangeReply JSON %}
		</div>
	</div>
</div>

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="Communication"
	data-api-fhir-interaction="delete">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-erpchrg.json %}
		</pre>
	</div>	
</div>

## Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-technische-umsetzung-datenschutz-und-sicherheit.html) festgehalten.
