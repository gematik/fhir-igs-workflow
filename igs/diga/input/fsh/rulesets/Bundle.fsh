Instance: Example-Bundle-DiGA
InstanceOf: Bundle
Usage: #example
Title: "DiGA-Verordnungs-Bundle (unvollständig)"
Description: "Unvollständiges Beispiel eines DiGA-Rezept-Bundles nach KBV_PR_EVDGA_Bundle"
* identifier.system = $prescription-id-ns
* identifier.value = "162.000.000.000.000.01"
* type = #document
* insert DateTimeStamp(timestamp)
* entry[+].fullUrl = "https://erp-ref.example.org/Composition/Example-Composition-DiGA"
* entry[=].resource = Example-Composition-DiGA

Instance: Example-Composition-DiGA
InstanceOf: Composition
Usage: #inline
* status = #final
* type.coding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_FORMULAR_ART"
* type.coding.code = #e16D
* date = "2026-03-01T10:00:00+01:00"
* author.display = "Verordnende Praxis"
* title = "elektronische Verordnung digitaler Gesundheitsanwendungen"