# Operation API: Abgabe von E-Rezepten im EU-Ausland - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

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

			{"resourceType":"OperationDefinition","id":"EUCloseOperation","text":{"status":"generated","div":"<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\">Generated Narrative: OperationDefinition EUCloseOperation</p><a name=\"EUCloseOperation\"> </a><a name=\"hcEUCloseOperation\"> </a>URL: [base]/Task/[id]/$eu-closeInput parameters Profile:<a href=\"StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.html\">GEM ERP PR EU CloseOperation Input</a>Parameters<table class=\"grid\">UseNameScopeCardinalityTypeBindingDocumentation</table></div>"},"url":"https://gematik.de/fhir/tiflow-xborder/OperationDefinition/EUCloseOperation","version":"2.0.0-ballot.2","name":"EUCloseOperation","status":"draft","kind":"operation","date":"2026-06-30","publisher":"gematik GmbH","contact":[{"name":"gematik GmbH","telecom":[{"system":"url","value":"https://gematik.de"},{"system":"email","value":"erp-umsetzung@gematik.de"}]}],"description":"The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed","jurisdiction":[{"coding":[{"system":"urn:iso:std:iso:3166","code":"DE","display":"Germany"}]}],"code":"eu-close","resource":["Task"],"system":false,"type":false,"instance":true,"inputProfile":"https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input"}
		
```

