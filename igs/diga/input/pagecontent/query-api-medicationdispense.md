Query API: MedicationDispense

MedicationDispense wird für die Abgabeinformation der DiGA genutzt. Der Freischaltcode sowie die DiGA-Bezeichnung werden in der Abgabeinformation bereitgestellt. 
Falls kein Freischaltcode bereitgestellt werden kann, enthält die Abgabeinformation eine begründende Rückmeldung.

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource _MedicationDispense_ wird über die folgenden HTTP-Methoden ermöglicht:

|HTTP-Methode|Ergebnis der Anfrage|
|---|---|
|GET|Freischaltcodes abrufen|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu MedicationDispense](./query-api-medicationdispense-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu MedicationDispense](./query-api-medicationdispense-req-fdv.html): Anforderungen an ein E-Rezept-FdV zur Nutzung der Schnittstelle.

### Resource API

<div class="gematik-api"
	data-api-type="FHIRResource"
	data-api-fhir-resource-type="MedicationDispense"
	data-api-fhir-interaction="search-type">
	<div id="CapabilityStatement">
		<pre>
			{% include CapabilityStatement-ti-flow-fachdienst-server-diga.json %}
		</pre>
	</div>
<!--
	<div id="Response-Examples">
		<div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
			{% fragment Bundle/ExampleDiGAMedicationDispenseSearchset XML %}
		</div>
	</div>
-->
</div>
