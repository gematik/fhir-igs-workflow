Query API: MedicationDispense

MedicationDispense wird für die Abgabeinformation der DiGA genutzt. Der Freischaltcode sowie die DiGA-Bezeichnung werden in der Abgabeinformation bereitgestellt. 
Falls kein Freischaltcode bereitgestellt werden kann, enthält die Abgabeinformation eine begründende Rückmeldung.

### Nachricht

Die Interaktion mit Nachrichten als FHIR-Ressource _MedicationDispense_ wird über die folgenden HTTP-Methoden ermöglicht:

|Akteur|HTTP-Methode|Ergebnis der Anfrage|
|---|---|---|
|Versicherter|GET|Freischaltcodes abrufen|

### Anforderungen an Schnittstelle

- [FD-Anforderungen zu MedicationDispense](./query-api-medicationdispense-req-fd.html): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
- [FdV-Anforderungen zu MedicationDispense](./query-api-medicationdispense-req-fdv.html): Anforderungen an ein TI-Flow-FdV zur Nutzung der Schnittstelle.

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
	<div id="Response-Examples">
		<div data-name="200 - Name-And-PZN" data-type="XML" data-render="ig-Fragment">
			{% fragment MedicationDispense/Example-MedicationDispense-DiGA-Name-And-PZN XML %}
		</div>		
		<div data-name="200 - DeepLink" data-type="XML" data-render="ig-Fragment">
			{% fragment MedicationDispense/Example-MedicationDispense-DiGA-DeepLink XML %}
		</div>		
		<div data-name="200 - No redeem Code" data-type="XML" data-render="ig-Fragment">
			{% fragment MedicationDispense/Example-MedicationDispense-DiGA-NoRedeemCode XML %}
		</div>
		<div data-name="200 - Name-And-PZN" data-type="JSON" data-render="ig-Fragment">
			{% fragment MedicationDispense/Example-MedicationDispense-DiGA-Name-And-PZN JSON %}
		</div>
		<div data-name="200 - DeepLink" data-type="JSON" data-render="ig-Fragment">
			{% fragment MedicationDispense/Example-MedicationDispense-DiGA-DeepLink JSON %}
		</div>
		<div data-name="200 - No redeem Code" data-type="JSON" data-render="ig-Fragment">
			{% fragment MedicationDispense/Example-MedicationDispense-DiGA-NoRedeemCode JSON %}
		</div>
	</div>
</div>
