# Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**Schnittstellen - Operation API**](menu-schnittstellen-operation-api.md)
* **Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen**

## Operation API: E-Rezepte zur Einlösung im EU-Ausland abrufen

Der abgebenden Apotheke im europäischen Ausland werden Ressourcen des MedicationRequest sowie die darin verknüpften Ressourcen mit Informationen über im europäischen Ausland einlösbare Verordnungen bereitgestellt. Der Zugriff auf diese Ressourcen erfolgt ausschließlich lesend durch den deutschen NCPeH-FD, der die Informationen entsprechend aufbereitet und weiterleitet.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/$get-eu-prescriptions` gesendet.

### Anforderungen an Schnittstelle

* [Server Anforderungen zu `$get-eu-prescriptions`](./op-get-eu-prescriptions-req-fd.md): Anforderungen an den TI-Flow-Fachdienst zur Bereitstellung der Schnittstelle.
* [NCPeH Anforderungen zu `$get-eu-prescriptions`](./op-get-eu-prescriptions-req-ncpeha.md): Anforderungen an den NCPeH-FD zur Nutzung der Schnittstelle.

### API Beschreibung

```
server
```

```

			{"resourceType":"OperationDefinition","id":"GET-Prescription-EU","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition GET-Prescription-EU</p><a name=\"GET-Prescription-EU\"> </a><a name=\"hcGET-Prescription-EU\"> </a>URL: [base]/$get-eu-prescriptionsInput parameters Profile:<a href=\"StructureDefinition-GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input.html\">GEM ERPEU PR PAR GET Prescription Input</a>Output parameters Profile:<a href=\"StructureDefinition-gem-erpeu-pr-par-get-prescription-output.html\">GEM ERPEU PR PAR GET Prescription Output</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentationINrequestData1..1Additional request information\nINrequestData.requesttype1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>INrequestData.kvnr1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Identifier\">Identifier</a>INrequestData.accessCode1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Identifier\">Identifier</a>INrequestData.countryCode1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>INrequestData.prescription-id0..*<a href=\"http://hl7.org/fhir/R4/datatypes.html#Identifier\">Identifier</a>INrequestData.practitionerName1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#string\">string</a>INrequestData.practitionerRole1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>INrequestData.pointOfCare1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#string\">string</a>INrequestData.healthcare-facility-type1..1<a href=\"http://hl7.org/fhir/R4/datatypes.html#Coding\">Coding</a>OUTreturn0..1<a href=\"http://hl7.org/fhir/R4/bundle.html\">Bundle</a>Depending on the requesttype this operation returns a Bundle containing eRezept KBV_PR_ERP_Bundle Prescription-Bundles.\n</table></div>"},"url":"https://gematik.de/fhir/tiflow-xborder/OperationDefinition/GET-Prescription-EU","version":"2.0.0-ballot.2","name":"GET-Prescription-EU","status":"draft","kind":"operation","date":"2026-05-26","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"affectsState":false,"code":"get-eu-prescriptions","system":true,"type":false,"instance":false,"inputProfile":"https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input","outputProfile":"https://gematik.de/fhir/tiflow-xborder/StructureDefinition/gem-erpeu-pr-par-get-prescription-output","parameter":[{"name":"requestData","use":"in","min":1,"max":"1","documentation":"Additional request information","part":[{"name":"requesttype","use":"in","min":1,"max":"1","type":"Coding"},{"name":"kvnr","use":"in","min":1,"max":"1","type":"Identifier"},{"name":"accessCode","use":"in","min":1,"max":"1","type":"Identifier"},{"name":"countryCode","use":"in","min":1,"max":"1","type":"Coding"},{"name":"prescription-id","use":"in","min":0,"max":"*","type":"Identifier"},{"name":"practitionerName","use":"in","min":1,"max":"1","type":"string"},{"name":"practitionerRole","use":"in","min":1,"max":"1","type":"Coding"},{"name":"pointOfCare","use":"in","min":1,"max":"1","type":"string"},{"name":"healthcare-facility-type","use":"in","min":1,"max":"1","type":"Coding"}]},{"name":"return","use":"out","min":0,"max":"1","documentation":"Depending on the requesttype this operation returns a Bundle containing eRezept KBV_PR_ERP_Bundle Prescription-Bundles.","type":"Bundle"}]}
		
```

