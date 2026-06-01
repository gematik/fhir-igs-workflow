# Operation API: Abgabe von E-Rezepten im EU-Ausland - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: Abgabe von E-Rezepten im EU-Ausland**

## Operation API: Abgabe von E-Rezepten im EU-Ausland

Die FHIR-Operation $eu-close beendet den E-Rezept-Workflow des unter der  geführten Tasks und speichert die von der europäischen Apotheke übermittelten Dispensierinformationen für den Versicherten. Diese Operation steht ausschließlich dem NCPeH-FD zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$eu-close` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$eu-close`](op-eu-close-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [NCPeH Anforderungen zu `$eu-close`](./op-eu-close-req-ncpeha.md): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{"resourceType":"OperationDefinition","id":"EUCloseOperation","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition EUCloseOperation</p><a name=\"EUCloseOperation\"> </a><a name=\"hcEUCloseOperation\"> </a>URL: [base]/Task/[id]/$eu-closeInput parameters Profile:<a href=\"StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.html\">GEM ERP PR EU CloseOperation Input</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINrequestData1..1Additional request information\nINrequestData.kvnr1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Identifier\">Identifier</a>INrequestData.accessCode1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Identifier\">Identifier</a>INrequestData.countryCode1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>INrequestData.practitionerName1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#string\">string</a>INrequestData.practitionerRole1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>INrequestData.pointOfCare1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#string\">string</a>INrequestData.healthcare-facility-type1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>INpractitionerData1..1<a href=\"http://hl7.org/fhir/R4/practitioner.html\">Practitioner</a>Information on the practitioner who dispensed\nINorganizationData1..1<a href=\"http://hl7.org/fhir/R4/organization.html\">Organization</a>Information on the organization where the dispensation happened\nINpractitionerRoleData1..1<a href=\"http://hl7.org/fhir/R4/practitionerrole.html\">PractitionerRole</a>INrxDispensation1..*Information on dispensed Medication(s)\nINrxDispensation.medicationDispense1..1<a href=\"http://hl7.org/fhir/R4/medicationdispense.html\">MedicationDispense</a>INrxDispensation.medication1..1<a href=\"http://hl7.org/fhir/R4/medication.html\">Medication</a></table></div>"},"url":"https://gematik.de/fhir/erp-eu/OperationDefinition/EUCloseOperationDefinition","version":"2.0.0-ballot.2","name":"EUClose","status":"draft","kind":"operation","date":"2026-05-26","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"code":"eu-close","resource":["Task"],"system":false,"type":false,"instance":true,"inputProfile":"https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input","parameter":[{"name":"requestData","use":"in","min":1,"max":"1","documentation":"Additional request information","part":[{"name":"kvnr","use":"in","min":1,"max":"1","type":"Identifier"},{"name":"accessCode","use":"in","min":1,"max":"1","type":"Identifier"},{"name":"countryCode","use":"in","min":1,"max":"1","type":"Coding"},{"name":"practitionerName","use":"in","min":1,"max":"1","type":"string"},{"name":"practitionerRole","use":"in","min":1,"max":"1","type":"Coding"},{"name":"pointOfCare","use":"in","min":1,"max":"1","type":"string"},{"name":"healthcare-facility-type","use":"in","min":1,"max":"1","type":"Coding"}]},{"name":"practitionerData","use":"in","min":1,"max":"1","documentation":"Information on the practitioner who dispensed","type":"Practitioner"},{"name":"organizationData","use":"in","min":1,"max":"1","documentation":"Information on the organization where the dispensation happened","type":"Organization"},{"name":"practitionerRoleData","use":"in","min":1,"max":"1","type":"PractitionerRole"},{"name":"rxDispensation","use":"in","min":1,"max":"*","documentation":"Information on dispensed Medication(s)","part":[{"name":"medicationDispense","use":"in","min":1,"max":"1","type":"MedicationDispense"},{"name":"medication","use":"in","min":1,"max":"1","type":"Medication"}]}]}
		
```

