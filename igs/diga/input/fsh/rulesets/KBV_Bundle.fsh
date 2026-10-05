Instance: Example-KBV-EVDGA-Bundle-Placeholder
InstanceOf: Bundle
Title: "Platzhalter für KBV-Bundle"
Description: "Aktuelle Version von KBV_PR_ERP_Bundle für FHIR-Profil und Datenbeispiele prüfen"
Usage: #inline
* id = $UUID-KBV-EVDGA-Bundle-Placeholder
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle"
* type = #document
* identifier.system = "https://example.org/fhir/bundle-ids"
* identifier.value = "162.000.000.000.000.01"
* timestamp = "2026-09-29T10:00:00+02:00"
* entry[0].fullUrl = "urn:uuid:00000000-0000-4000-8000-000000000001"
* entry[0].resource = Example-Composition-Placeholder
* entry[1].fullUrl = "urn:uuid:00000000-0000-4000-8000-000000000002"
* entry[1].resource = Example-Patient-Placeholder

Instance: Example-Composition-Placeholder
InstanceOf: Composition
Usage: #inline
* status = #final
* type = http://loinc.org#34133-9 "Krankengeschichte"
* subject = Reference(urn:uuid:00000000-0000-4000-8000-000000000002)
* date = "2026-09-29T10:00:00+02:00"
* author = Reference(urn:uuid:00000000-0000-4000-8000-000000000002)
* title = "Dummy Document"

Instance: Example-Patient-Placeholder
InstanceOf: Patient
Usage: #inline
* identifier.system = "https://example.org/fhir/patient-ids"
* identifier.value = "X123456789"
* name.family = "Mustermann"
* name.given = "Max"
* birthDate = "1980-01-01"